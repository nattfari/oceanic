//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusinessLogic.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class transportType
    {
        public transportType()
        {
            this.forsendelsesRute = new HashSet<forsendelsesRute>();
        }
    
        public long Id { get; set; }
        public string TransportType1 { get; set; }
        public string Company { get; set; }
    
        public virtual ICollection<forsendelsesRute> forsendelsesRute { get; set; }
    }
}
