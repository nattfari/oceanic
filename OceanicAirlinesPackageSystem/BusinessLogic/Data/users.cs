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
    
    public partial class users
    {
        public users()
        {
            this.pakke = new HashSet<pakke>();
        }
    
        public long Id { get; set; }
        public string BrugerNavn { get; set; }
        public string password { get; set; }
        public bool IsAdmin { get; set; }
    
        public virtual ICollection<pakke> pakke { get; set; }
    }
}
