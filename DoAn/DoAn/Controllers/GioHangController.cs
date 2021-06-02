using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAn.Models;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class GioHangController : Controller
    {
        DulichEntities db = new DulichEntities();
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if(lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }

        public ActionResult ThemGioHang(int iMaTour, string strURL)
        {
            Tour tour = db.Tours.SingleOrDefault(n => n.ID_Tour == iMaTour);
            if(tour == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.Find(n => n.iMaTour == iMaTour);
            if (sanpham==null)
            {
                sanpham = new GioHang(iMaTour);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
        }

        public ActionResult CapNhatGioHang(int iMaTour, FormCollection f)
        {
            Tour tour = db.Tours.SingleOrDefault(n => n.ID_Tour == iMaTour);
            if (tour == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.iMaTour == iMaTour);
            if (sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return View("GioHang");
        }

        public ActionResult XoaGioHang(int iMaSP)
        {
            Tour tour = db.Tours.SingleOrDefault(n => n.ID_Tour == iMaSP);
            if (tour == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.iMaTour == iMaSP);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.iMaTour == iMaSP);
            }
            if(lstGiohang.Count == 0) 
                {
                return RedirectToAction("Index","Home");
            } 
            return RedirectToAction("GioHang");
        }

        public ActionResult GioHang()
        {
            if(Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = Laygiohang();
            return View(lstGioHang);
        }

        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["Giohang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> lstGioHang = Session["Giohang"] as List<GioHang>;
            if(lstGioHang !=null)
            {
                dTongTien = lstGioHang.Sum(n => n.dThanhTien);
            }
            return dTongTien;
        }

        public ActionResult GioHangPartial()
        {
            if(TongSoLuong()==0)
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
    }
}