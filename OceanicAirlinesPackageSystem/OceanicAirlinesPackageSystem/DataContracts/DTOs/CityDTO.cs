using System.Runtime.Serialization;

namespace WebHost.DataContracts.DTOs
{
    [DataContract]
    public class CityDTO
    {
        [DataMember(Name = "id")]
        public long Id { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }

        [DataMember(Name="isActive")]
        public bool IsActive { get; set; }
    }
}