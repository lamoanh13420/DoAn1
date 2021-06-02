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

    public partial class TinTuc
    {
        public TinTuc()
        {
            ImageTT = "~/Images/add-image.png";
        }
        public int ID_TT { get; set; }

        [Display(Name = "Tên Tin Tức")]
        [Required(ErrorMessage = "Vui lòng nhập tên tin tức")]
        public string TenTT { get; set; }


        [Display(Name = "Hình Ảnh")]
        public string ImageTT { get; set; }


        [Display(Name = "Nội Dung Tin Tức")]
        [Required(ErrorMessage = "Vui lòng nhập nội dung tin tức")]
        public string NoiDungTT { get; set; }


        [Display(Name = "Ngày Nhập Tin Tức")]
        [Required(ErrorMessage = "Vui lòng nhập ngày nhập tin tức")]
        public Nullable<System.DateTime> NgayNhapTT { get; set; }

        [NotMapped]
        public HttpPostedFileBase ImageUpload { get; set; }
    }
}
