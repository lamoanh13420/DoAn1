﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAn.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Web;

    public partial class CamNangDuLich
    {
        [Display(Name = "Mã Cẩm Nang Du Lịch:")]
        public int ID_CNDL { get; set; }

        [Display(Name = "Tên Cẩm Nang Du Lịch:")]
        public string TenCNDL { get; set; }

        [Display(Name = "Hình Ảnh:")]
        public string ImageCNDL { get; set; }

        [Display(Name = "Nội Dung:")]
        public string NoiDungCNDL { get; set; }

        [Display(Name = "Ngày Nhập:")]
        public Nullable<System.DateTime> NgayNhapCN { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageUpload { get; set; }
    }
}
