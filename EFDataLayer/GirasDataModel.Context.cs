﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EFDataLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GirasDbContext : DbContext
    {
        public GirasDbContext()
            : base("name=GirasDbContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<vw_Categories> vw_Categories { get; set; }
        public virtual DbSet<vw_ItemFiles> vw_ItemFiles { get; set; }
        public virtual DbSet<vw_ItemsBaseData> vw_ItemsBaseData { get; set; }
    }
}