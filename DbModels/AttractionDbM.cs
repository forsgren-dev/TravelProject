using System.ComponentModel.DataAnnotations;
using Models;
using Models.Interfaces;

namespace DbModels;

public class AttractionDbM : Attraction, IAttraction
{
    [Key]
    public override Guid AttractionId { get; set; }
}