//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class vw_Categories
    {
        public int CategoryID { get; set; }
        public string PhotoExtension { get; set; }
        public int ModuleTypeID { get; set; }
        public Nullable<int> ParentID { get; set; }
        public Nullable<int> AllItemsCount { get; set; }
        public Nullable<int> ActiveItemsCount { get; set; }
        public string Path { get; set; }
        public Nullable<int> TotalSubItems { get; set; }
        public Nullable<System.DateTime> MostRecentSubItemDate { get; set; }
        public Nullable<int> TypeID { get; set; }
        public int Vistites_Count { get; set; }
        public System.DateTime Date_Added { get; set; }
        public Nullable<System.DateTime> ItemDate { get; set; }
        public bool IsAvailable { get; set; }
        public Nullable<bool> IsMain { get; set; }
        public Nullable<int> Priority { get; set; }
        public string Photo2Extension { get; set; }
        public string VideoExtension { get; set; }
        public string AudioExtension { get; set; }
        public string FileExtension { get; set; }
        public Nullable<int> Height { get; set; }
        public Nullable<int> Width { get; set; }
        public string YoutubeCode { get; set; }
        public string InsertUserName { get; set; }
        public string LastUpdateUserName { get; set; }
        public Nullable<double> GoogleLatitude { get; set; }
        public Nullable<double> GoogleLongitude { get; set; }
        public Nullable<bool> OnlyForRegisered { get; set; }
        public Nullable<bool> PublishPhoto { get; set; }
        public Nullable<bool> PublishPhoto2 { get; set; }
        public Nullable<bool> PublishFile { get; set; }
        public Nullable<bool> PublishAudio { get; set; }
        public Nullable<bool> PublishVideo { get; set; }
        public Nullable<bool> PublishYoutbe { get; set; }
        public Nullable<System.Guid> OwnerID { get; set; }
        public Nullable<System.DateTime> LastModification { get; set; }
        public string OwnerName { get; set; }
        public int Expr1 { get; set; }
        public int LangID { get; set; }
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public string KeyWords { get; set; }
    }
}
