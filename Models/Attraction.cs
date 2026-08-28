using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Models.Interfaces;

namespace Models
{
    public class Attraction : IAttraction
    {

        public virtual Guid AttractionId { get; set; }
        public virtual string AttractionName { get; set; }
        public virtual string AttractionDescription { get; set; }
        public virtual string AttractionStreet { get; set; }
        public virtual string AttractionZip { get; set; }
        public virtual Guid CityId { get; set; }

        
        public Attraction() { }

    }
}