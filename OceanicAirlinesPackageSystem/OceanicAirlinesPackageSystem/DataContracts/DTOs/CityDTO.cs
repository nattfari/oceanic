using System.Runtime.Serialization;

namespace WebHost.DataContracts.DTOs
{
    [DataContract]
    public class CityDTO
    {
        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }
    }
}