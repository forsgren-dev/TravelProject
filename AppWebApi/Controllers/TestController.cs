using Microsoft.AspNetCore.Mvc;
using Seido.Utilities.SeedGenerator;
using DbRepos;

namespace AppWebApi.Controllers;

[ApiController]
[Route("api/[controller]/[action]")]
public class TestController : ControllerBase
{
    readonly ILogger<TestController> _logger;
    readonly AdminDbRepos _adminDbRepos;
    readonly SeedGenerator _seeder = new SeedGenerator();

    [HttpGet()]
    [ActionName("HelloWorld")]
    [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]
    public IActionResult HelloWorld()
    {
        _logger.LogInformation("HelloWorld endpoint called at {Time}", DateTime.UtcNow);
        return Ok("Hello World!");
    }

    [HttpGet()]
    [ActionName("PlainText")]
    [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]
    public IActionResult PlainText()
    {
        _logger.LogInformation("PlainText endpoint called at {Time}", DateTime.UtcNow);
        return Content("Hello World!", "text/plain");
    }

    [HttpGet()]
    [ActionName("AllQuotes")]
    [ProducesResponseType(200)]
    public IActionResult AllQuotes()
    {
        try
        {
            _logger.LogInformation("AllQuotes endpoint called at {Time}", DateTime.UtcNow);
            return Ok(_seeder.AllQuotes);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all quotes");
            return BadRequest(ex.Message);
        }
    }

    [HttpGet()]
    [ActionName("RandomQuote")]
    [ProducesResponseType(200)]
    public IActionResult RandomQuote()
    {
        try
        {


            _logger.LogInformation("RandomQuote endpoint called at {Time}", DateTime.UtcNow);
            return Ok(_seeder.Quote);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving random quote");
            return BadRequest(ex.Message);
        }
    }

    [HttpGet()]
    [ActionName("Search")]
    [ProducesResponseType(200)]
    [ProducesResponseType(400)]
    public IActionResult Search(string word)
    {
        if (string.IsNullOrWhiteSpace(word))
        {
            return BadRequest("Please provide a search word.");
        }

        try
        {

            _logger.LogInformation("Search endpoint called at {Time}", DateTime.UtcNow);
            var matchingQuotes = _seeder.AllQuotes
                .Where(q => q.Quote.Contains(word, StringComparison.OrdinalIgnoreCase))
                .ToList();

            return Ok(matchingQuotes);

        }

        catch (Exception ex)
        {
            _logger.LogError(ex, "Error searching quotes");
            return BadRequest(ex.Message);
        }
    }

    [HttpGet]
    [ActionName("Attractions")]
    public async Task<IActionResult> Attractions()
    {
        return Ok(await _adminDbRepos.GetAllAttractionsAsync());
    }

    public TestController(
        ILogger<TestController> logger, AdminDbRepos adminDbRepos)
    {
        _logger = logger;
        _adminDbRepos = adminDbRepos;
    }
}
