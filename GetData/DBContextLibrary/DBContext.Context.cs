﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace DBContextLibrary
{

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

using System.Data.Entity.Core.Objects;
using System.Linq;


public partial class JDCTSDBEntities : DbContext
{
    public JDCTSDBEntities()
        : base("name=JDCTSDBEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<MasterDataTable> MasterDataTables { get; set; }

    public virtual DbSet<ProjectManagerDetail> ProjectManagerDetails { get; set; }

    public virtual DbSet<AssociateBilingDetail> AssociateBilingDetails { get; set; }


    public virtual ObjectResult<SP_FetchData_Result> SP_FetchData()
    {

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_FetchData_Result>("SP_FetchData");
    }


    public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
    {

        var diagramnameParameter = diagramname != null ?
            new ObjectParameter("diagramname", diagramname) :
            new ObjectParameter("diagramname", typeof(string));


        var owner_idParameter = owner_id.HasValue ?
            new ObjectParameter("owner_id", owner_id) :
            new ObjectParameter("owner_id", typeof(int));


        var versionParameter = version.HasValue ?
            new ObjectParameter("version", version) :
            new ObjectParameter("version", typeof(int));


        var definitionParameter = definition != null ?
            new ObjectParameter("definition", definition) :
            new ObjectParameter("definition", typeof(byte[]));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
    }


    public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
    {

        var diagramnameParameter = diagramname != null ?
            new ObjectParameter("diagramname", diagramname) :
            new ObjectParameter("diagramname", typeof(string));


        var owner_idParameter = owner_id.HasValue ?
            new ObjectParameter("owner_id", owner_id) :
            new ObjectParameter("owner_id", typeof(int));


        var versionParameter = version.HasValue ?
            new ObjectParameter("version", version) :
            new ObjectParameter("version", typeof(int));


        var definitionParameter = definition != null ?
            new ObjectParameter("definition", definition) :
            new ObjectParameter("definition", typeof(byte[]));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
    }


    public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
    {

        var diagramnameParameter = diagramname != null ?
            new ObjectParameter("diagramname", diagramname) :
            new ObjectParameter("diagramname", typeof(string));


        var owner_idParameter = owner_id.HasValue ?
            new ObjectParameter("owner_id", owner_id) :
            new ObjectParameter("owner_id", typeof(int));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
    }


    public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
    {

        var diagramnameParameter = diagramname != null ?
            new ObjectParameter("diagramname", diagramname) :
            new ObjectParameter("diagramname", typeof(string));


        var owner_idParameter = owner_id.HasValue ?
            new ObjectParameter("owner_id", owner_id) :
            new ObjectParameter("owner_id", typeof(int));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
    }


    public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
    {

        var diagramnameParameter = diagramname != null ?
            new ObjectParameter("diagramname", diagramname) :
            new ObjectParameter("diagramname", typeof(string));


        var owner_idParameter = owner_id.HasValue ?
            new ObjectParameter("owner_id", owner_id) :
            new ObjectParameter("owner_id", typeof(int));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
    }


    public virtual ObjectResult<SP_InsertAssociateBilling_Result> SP_InsertAssociateBilling(string userid, string month)
    {

        var useridParameter = userid != null ?
            new ObjectParameter("userid", userid) :
            new ObjectParameter("userid", typeof(string));


        var monthParameter = month != null ?
            new ObjectParameter("month", month) :
            new ObjectParameter("month", typeof(string));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_InsertAssociateBilling_Result>("SP_InsertAssociateBilling", useridParameter, monthParameter);
    }


    public virtual ObjectResult<SP_PMOUserOrNot_Result> SP_PMOUserOrNot(string userid, string month)
    {

        var useridParameter = userid != null ?
            new ObjectParameter("userid", userid) :
            new ObjectParameter("userid", typeof(string));


        var monthParameter = month != null ?
            new ObjectParameter("month", month) :
            new ObjectParameter("month", typeof(string));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_PMOUserOrNot_Result>("SP_PMOUserOrNot", useridParameter, monthParameter);
    }


    public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
    {

        var diagramnameParameter = diagramname != null ?
            new ObjectParameter("diagramname", diagramname) :
            new ObjectParameter("diagramname", typeof(string));


        var owner_idParameter = owner_id.HasValue ?
            new ObjectParameter("owner_id", owner_id) :
            new ObjectParameter("owner_id", typeof(int));


        var new_diagramnameParameter = new_diagramname != null ?
            new ObjectParameter("new_diagramname", new_diagramname) :
            new ObjectParameter("new_diagramname", typeof(string));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
    }


    public virtual int sp_upgraddiagrams()
    {

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
    }


    public virtual ObjectResult<SP_Weekwise_Result> SP_Weekwise(string userid, string month)
    {

        var useridParameter = userid != null ?
            new ObjectParameter("userid", userid) :
            new ObjectParameter("userid", typeof(string));


        var monthParameter = month != null ?
            new ObjectParameter("month", month) :
            new ObjectParameter("month", typeof(string));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_Weekwise_Result>("SP_Weekwise", useridParameter, monthParameter);
    }


    public virtual ObjectResult<SP_UpdateBilling_Result> SP_UpdateBilling(Nullable<int> userid, Nullable<int> month, Nullable<int> week1, Nullable<int> week2, Nullable<int> week3, Nullable<int> week4, Nullable<int> week5)
    {

        var useridParameter = userid.HasValue ?
            new ObjectParameter("userid", userid) :
            new ObjectParameter("userid", typeof(int));


        var monthParameter = month.HasValue ?
            new ObjectParameter("month", month) :
            new ObjectParameter("month", typeof(int));


        var week1Parameter = week1.HasValue ?
            new ObjectParameter("week1", week1) :
            new ObjectParameter("week1", typeof(int));


        var week2Parameter = week2.HasValue ?
            new ObjectParameter("week2", week2) :
            new ObjectParameter("week2", typeof(int));


        var week3Parameter = week3.HasValue ?
            new ObjectParameter("week3", week3) :
            new ObjectParameter("week3", typeof(int));


        var week4Parameter = week4.HasValue ?
            new ObjectParameter("week4", week4) :
            new ObjectParameter("week4", typeof(int));


        var week5Parameter = week5.HasValue ?
            new ObjectParameter("week5", week5) :
            new ObjectParameter("week5", typeof(int));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_UpdateBilling_Result>("SP_UpdateBilling", useridParameter, monthParameter, week1Parameter, week2Parameter, week3Parameter, week4Parameter, week5Parameter);
    }

}

}
