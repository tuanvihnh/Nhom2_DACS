﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class _Default : Page
    {

        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        public static int makh;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Query the database for the user with the given username and password
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;

            var db = new QL_BTSEntities();
            if (user.Any(p => (p.TrangThai == true && p.Email == SignIn.email)))
            {

                var tk = user.SingleOrDefault(p => p.TrangThai == true && p.Email == SignIn.email); //lọc trong xem có email nào == lbDeptid đang được hiện (TK)

                makh = tk.MaTK; // Cập nhật giá trị của makh từ tk.MaKH
                Session["MaKH"] = makh - 1; // Gán giá trị của makh vào Session["MaKH"]


            }

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<TH03_WebBanHang.Models.SanPham> GetTraSua()
        {
            //IQueryable<SanPham> sanPhams = dbcontext.SanPhams;

            //return sanPhams;
            var sanPhams = dbcontext.SanPhams.AsQueryable();

            var filteredSanPhams = sanPhams.Where(sp => sp.MaLoai != "5" && sp.MaLoai == "1").GroupBy(p => p.TenSP).Select(group => group.OrderBy(p => p.Gia).FirstOrDefault());

            return filteredSanPhams;
        }
        public IQueryable<TH03_WebBanHang.Models.SanPham> GetCoffee()
        {
            //IQueryable<SanPham> sanPhams = dbcontext.SanPhams;

            //return sanPhams;
            var sanPhams = dbcontext.SanPhams.AsQueryable();

            var filteredSanPhams = sanPhams.Where(sp => sp.MaLoai != "5" && sp.MaLoai == "2").GroupBy(p => p.TenSP).Select(group => group.OrderBy(p => p.Gia).FirstOrDefault());

            return filteredSanPhams;
        }
        public IQueryable<TH03_WebBanHang.Models.SanPham> GetTea()
        {
            //IQueryable<SanPham> sanPhams = dbcontext.SanPhams;

            //return sanPhams;
            var sanPhams = dbcontext.SanPhams.AsQueryable();

            var filteredSanPhams = sanPhams.Where(sp => sp.MaLoai != "5" && sp.MaLoai == "3").GroupBy(p => p.TenSP).Select(group => group.OrderBy(p => p.Gia).FirstOrDefault());

            return filteredSanPhams;
        }
        public IQueryable<TH03_WebBanHang.Models.SanPham> GetIceCream()
        {
            //IQueryable<SanPham> sanPhams = dbcontext.SanPhams;

            //return sanPhams;
            var sanPhams = dbcontext.SanPhams.AsQueryable();

            var filteredSanPhams = sanPhams.Where(sp => sp.MaLoai != "5" && sp.MaLoai == "4").GroupBy(p => p.TenSP).Select(group => group.OrderBy(p => p.Gia).FirstOrDefault());

            return filteredSanPhams;
        }
        protected void btnCart_Click(object sender, ImageClickEventArgs e)
        {
            // Trở lại trang hiện tại
            string url = HttpContext.Current.Request.Url.ToString();
            ImageButton btnCart = (ImageButton)sender;
            string itemMaSP = btnCart.CommandArgument;
            //productDetail.DataItem.
            // Lấy giở hàng
            var saP = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == itemMaSP);






            List<ChiTietDonHang> lstGioHang = LayGioHang();
            // 
            //string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            //ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == itemMaSP);
            ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == itemMaSP);




            var sanPhamCon1 = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == itemMaSP);

            if (chiTietDon == null && saP != null)
            {
                SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == itemMaSP);
                chiTietDon = new ChiTietDonHang();
                chiTietDon.MaSP = itemMaSP;
                chiTietDon.SoLuong = 1;
                chiTietDon.TenSP = sanPham.TenSP;
                chiTietDon.DuongDan = sanPham.DuongDan;
                chiTietDon.Gia = (double)sanPham.Gia;
                chiTietDon.ThanhTien = (double)sanPham.Gia;



                lstGioHang.Add(chiTietDon);
                Response.Write(" <script>\r\n        // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click\r\n        const notification = document.getElementById('notification');\r\n\r\n       \r\n            // Hiển thị thông báo\r\n            notification.style.display = 'flex';\r\n\r\n            // Ẩn thông báo sau 2 giây\r\n            setTimeout(function () {\r\n                notification.style.display = 'none';\r\n            }, 2000);\r\n        \r\n    </script>");

                Session["GioHang"] = lstGioHang;
                Thread.Sleep(1500);

                Response.Redirect(Request.RawUrl);
            }
            else if (saP != null && sanPhamCon1 == null)
            {


                chiTietDon.SoLuong++;

                //chiTietDon.SoLuong++;
                Response.Write(" <script>\r\n        // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click\r\n        const notification = document.getElementById('notification');\r\n\r\n       \r\n            // Hiển thị thông báo\r\n            notification.style.display = 'flex';\r\n\r\n            // Ẩn thông báo sau 2 giây\r\n            setTimeout(function () {\r\n                notification.style.display = 'none';\r\n            }, 2000);\r\n        \r\n    </script>");

                chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                Session["GioHang"] = lstGioHang;
                Thread.Sleep(1500);

                Response.Redirect(Request.RawUrl);
            }

        }
        public List<ChiTietDonHang> LayGioHang()
        {
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<ChiTietDonHang>();
                Session["GioHang"] = lstGioHang;

            }
            return lstGioHang;


        }
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            // Trở lại trang hiện tại
            string url = HttpContext.Current.Request.Url.ToString();
            //productDetail.DataItem.
            // Lấy giở hàng
            List<ChiTietDonHang> lstGioHang = LayGioHang();
            // 
            string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == idsp);
            if (chiTietDon == null)
            {
                SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
                chiTietDon = new ChiTietDonHang();
                chiTietDon.MaSP = idsp;
                chiTietDon.SoLuong = 1;
                chiTietDon.TenSP = sanPham.TenSP;
                chiTietDon.DuongDan = sanPham.DuongDan;
                chiTietDon.Gia = (double)sanPham.Gia;
                chiTietDon.ThanhTien = (double)sanPham.Gia;
                lstGioHang.Add(chiTietDon);
                Session["GioHang"] = lstGioHang;
                Thread.Sleep(1500);

                Response.Redirect(url);
            }
            else
            {
                chiTietDon.SoLuong++;
                chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                Session["GioHang"] = lstGioHang;
                Thread.Sleep(1500);

                Response.Redirect(url);
            }

        }
    }
}