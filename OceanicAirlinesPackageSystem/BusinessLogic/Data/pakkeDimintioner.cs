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
    
    public partial class pakkeDimintioner
    {
        public pakkeDimintioner()
        {
            this.pakkePris = new HashSet<pakkePris>();
        }
    
        public string Name { get; set; }
        public int Height { get; set; }
        public int Width { get; set; }
        public int Depth { get; set; }
    
        public virtual ICollection<pakkePris> pakkePris { get; set; }
    }
}
