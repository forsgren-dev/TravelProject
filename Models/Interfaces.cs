namespace Models.Interfaces;

public interface IAttraction
{
    Guid AttractionId { get; set; }
    string AttractionName { get; set; }
    string AttractionDescription { get; set; }
    string AttractionStreet { get; set; }
    string AttractionZip { get; set; }
    Guid CityId { get; set; }
}

public interface ICountry
{

}

public interface ICity
{

}
