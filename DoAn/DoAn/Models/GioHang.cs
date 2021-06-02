using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn.Models
{
    public class GioHang
    {
        DulichEntities db = new DulichEntities();
        public int iMaTour { get; set; }
        public string sTenTour { get; set; }
        public string sAnhTour { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double dThanhTien { get { return iSoLuong * dDonGia; } }

        public GioHang(int ID_Tour)
        {
            iMaTour = ID_Tour;
            Tour tour = db.Tours.Single(n => n.ID_Tour == iMaTour);
            sTenTour = tour.TenTour;
            sAnhTour = tour.HinhAnh;
            dDonGia = double.Parse(tour.Gia.ToString());
            iSoLuong = 1;
        }
    }
}