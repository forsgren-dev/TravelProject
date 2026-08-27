using Microsoft.AspNetCore.Mvc;
using Seido.Utilities.SeedGenerator;
using Configuration.Options;
using Microsoft.Extensions.Options;

namespace AppWebApi.Controllers;

[ApiController]
[Route("api/[controller]/[action]")]
public class AdminController : ControllerBase
{
    readonly ILogger<AdminController> _logger;
    readonly IWebHostEnvironment _environment;
    readonly IConfiguration _configuration;

    readonly MySecretsOptions _mySecretsOptions;
    readonly SeedGenerator _seeder = new SeedGenerator();

    [HttpGet()]
    [ActionName("Version")]
    [ProducesResponseType(typeof(VersionInfo), 200)]
    public IActionResult Version()
    {
        try
        {
            var versionInfo = VersionInfo.FromAssembly();
            _logger.LogInformation("Version endpoint called at {Time}", DateTime.UtcNow);
            return Ok(versionInfo);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving version information");
            return BadRequest(ex.Message);
        }
    }

    [HttpGet()]
    [ActionName("MySecret")]
    [ProducesResponseType(typeof(MySecretsOptions), 200)]
    public IActionResult MySecret()
    {
        try
        {
            var secret = _configuration["MySecrets:MySecret"];

            return Ok(secret);
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }

    }

     [HttpGet()]
        [ActionName("MySecretsOptions")]
        public IActionResult MySecretsOptions()
        {
            return Ok(_mySecretsOptions);
        }


    public AdminController(
        ILogger<AdminController> logger,
        IWebHostEnvironment environment,
        IConfiguration configuration,
        IOptions<MySecretsOptions> mySecretsOptions)
    {
        _logger = logger;
        _environment = environment;
        _configuration = configuration;
        _mySecretsOptions = mySecretsOptions.Value;
    }
}
