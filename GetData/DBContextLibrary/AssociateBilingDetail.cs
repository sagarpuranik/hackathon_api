
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
    using System.Collections.Generic;
    
public partial class AssociateBilingDetail
{

    public string AssociateID { get; set; }

    public Nullable<int> BillingMonth { get; set; }

    public Nullable<int> BillingWeek { get; set; }

    public Nullable<int> NumberHours { get; set; }



    public virtual MasterDataTable MasterDataTable { get; set; }

}

}
