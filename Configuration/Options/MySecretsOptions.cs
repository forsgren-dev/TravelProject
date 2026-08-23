namespace Configuration.Options;

public class MySecretsOptions
{

    public const string Position = "MySecrets";
    public string ApiKey { get; set; }

    public string ConnectionString { get; set; }

    public string MySecret { get; set; }
}
