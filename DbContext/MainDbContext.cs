using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;

using Configuration;
using DbModels;
using Microsoft.Extensions.Hosting.Internal;


namespace DbContext;

public class MainDbContext : Microsoft.EntityFrameworkCore.DbContext
{

}
