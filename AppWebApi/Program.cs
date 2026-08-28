using Microsoft.EntityFrameworkCore;
using Configuration.Options;
using DbContext;
using DbRepos;

var builder = WebApplication.CreateBuilder(args);


// Add console debug logging
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
builder.Logging.AddDebug();


// Add services to the container.

builder.Services.AddControllers().AddNewtonsoftJson(options =>
options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();
builder.Services.AddEndpointsApiExplorer();


//User secrets configuration
var currentDir = Directory.GetCurrentDirectory();
var assembly = System.Reflection.Assembly.Load("Configuration");
builder.Configuration.SetBasePath(Path.Combine(currentDir, "../AppWebApi"))
        .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
        .AddUserSecrets(assembly);

builder.Services.Configure<Configuration.Options.MySecretsOptions>(
    options => builder.Configuration.GetSection(Configuration.Options.MySecretsOptions.Position).Bind(options));

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new()
    {
        Title = "Forsgrens TravelAPI",
#if DEBUG
        Version = "v1.0 DEBUG",
#else
        Version = "v1.0",
#endif
        Description = "This is a RESTful API using Swagger"
    });
});


// Adding DbContext and DbRepos to the DI container
var useDataSetWithTag = builder.Configuration["DatabaseConnections:UseDataSetWithTag"];
var defaultDataUser = builder.Configuration["DatabaseConnections:DefaultDataUser"];

var connectionSets = builder.Configuration
    .GetSection(DbConnectionSetsOptions.Position)
    .Get<DbConnectionSetsOptions>();

var connectionName = connectionSets?.DataSets?
    .FirstOrDefault(dataSet => dataSet.DbTag == useDataSetWithTag)?
    .DbConnections?
    .FirstOrDefault(connection => connection.DbUserLogin == defaultDataUser)?
    .DbConnection;

if (string.IsNullOrWhiteSpace(connectionName))
{
    throw new InvalidOperationException($"No database connection named for tag '{useDataSetWithTag}' and user '{defaultDataUser}'.");
}

var connectionString = builder.Configuration.GetConnectionString(connectionName);

if (string.IsNullOrWhiteSpace(connectionString))
{
    throw new InvalidOperationException($"Connection string '{connectionName}' was not found.");
}

builder.Services.AddDbContext<MainDbContext, MainDbContext.SqlServerDbContext>(
    options => options.UseSqlServer(connectionString,
    sqlOptions => sqlOptions.EnableRetryOnFailure()));
builder.Services.AddScoped<AdminDbRepos>();



var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
{
    //app.MapOpenApi();

    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Seido Friends API v2.0");
    });

}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
