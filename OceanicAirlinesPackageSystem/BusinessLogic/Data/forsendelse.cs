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
    
    public partial class forsendelse
    {
        public forsendelse()
        {
            this.forsendelsesRute = new HashSet<forsendelsesRute>();
        }
    
        public long Id { get; set; }
        public Nullable<long> PakkeId { get; set; }
        public Nullable<long> StartBy { get; set; }
        public Nullable<long> SlutBy { get; set; }
        public System.DateTime AfsendelsesDato { get; set; }
    
        public virtual ICollection<forsendelsesRute> forsendelsesRute { get; set; }
        public virtual pakke pakke { get; set; }
    }
}
