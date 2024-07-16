using Newtonsoft.Json.Linq;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class Pay : System.Web.UI.Page
    {

        public static string madh;

        public static long TongThanhTien;
        protected void Page_Load(object sender, EventArgs e)
        {
            string apiKeyCK = ConfigurationManager.AppSettings["GMilkTea-CK"];
            string apiKeyBM = ConfigurationManager.AppSettings["GMilkTea-BM"];

            if (!IsPostBack)
            {
                // Khôi phục giá trị count từ session nếu có
                if (Session["Count"] != null)
                {
                    int count = (int)Session["Count"];
                    ViewState["Count"] = count;
                }


            }
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;

            var db = new QL_BTSEntities();

            if (user.Any(p => (p.TrangThai == true && p.Email == SignIn.email)) && Session["GioHang"] != null)
            {
                //user.SingleOrDefault(p => p.MaTK==makh); 
                List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;

                // Đặt dữ liệu cho ListView
               
                Hepler hepler = new Hepler();

                TongThanhTien = hepler.longTongThanhTien(lstGioHang);
                // user.Any(p =>p.MaTK == makh);


            }
            // Otherwise, display an error message

            else
            {

                Response.Redirect("Cart.aspx");

            }

            //List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            //Hepler hepler = new Hepler();



            
            //string amount = hepler.TongThanhTien(lstGioHang).ToString();
            //string ma = GenerateRandomString(4);
            //string orderId = ma+countQR.ToString()+ Shop.CH;
            //maDHQR = orderId;
            ////        < add key = "vietQRapiKey" value = "c80d2dd7-13a5-4ab2-9d8d-745da3356fad" />

            ////< add key = "vietQRclientKey" value = "f46c9c31-d300-46d5-80c6-a92fd4079891" />

            ////< add key = "vietQRreturn" value = "http://localhost:52718/Success.asp?GD=QR" />
            //string vietQRlink = $"https://api.vietqr.io/image/970454-9021053350473-BIsgDhE.jpg?accountName=NGUYEN%20HOANG%20DUC&amount={amount}&orderid={orderId}&return_url=http://localhost:52718/Success.asp?GD=QR";
            ////string vietQRlink = $"https://sandbox.vnpayment.vn/token_ui/create-token.html?vnp_app_user_id={SignIn.makh}&vnp_cancel_url=http://localhost:52718/Pay.aspx&vnp_card_type=01&vnp_command=token_create&vnp_create_date={DateTime.Now}&vnp_ip_addr=192:168:1:11&vnp_locale=vi&vnp_return_url=http://localhost:52718/Success.asp?GD=QR&vnp_tmn_code=B9KOCLN0&vnp_txn_desc=Tao moi token&vnp_txn_ref=286&vnp_version=2.0.1&vnp_secure_hash={{value}}\r\n";

            //Bitmap qrCodeImage = GenerateMomoQRCode( vietQRlink);
            //imgMomoQRCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(ImageToByte(qrCodeImage));
        }
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        // Phương thức giả định để lấy giá trị MaTK từ một nguồn nào đó

        public byte[] ImageToByte(System.Drawing.Image img)
        {
            using (var ms = new MemoryStream())
            {
                img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                return ms.ToArray();
            }
        }

        public Bitmap GenerateMomoQRCode( string vietQRlink)
        {
            string paymentInfo = $"{vietQRlink}";
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(paymentInfo, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(20);
          
            return qrCodeImage;
        }
        private int GetMaTKFromSomeSource()
        {
            // Ví dụ: Giả sử bạn lấy giá trị MaTK từ phiên đăng nhập của người dùng
            if (Session["MaKH"] != null)
            {
                int maKH;
                if (int.TryParse(Session["MaKH"].ToString(), out maKH))
                {
                    return maKH;
                }
            }

            // Trong trường hợp không có giá trị MaTK nào được tìm thấy hoặc không hợp lệ, bạn có thể trả về một giá trị mặc định hoặc thực hiện xử lý khác tùy thuộc vào yêu cầu của ứng dụng của bạn.
            return 0; // Ví dụ: Trả về -1 nếu không có giá trị MaTK được tìm thấy
        }

        private string GenerateRandomString(int length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var result = new string(
                Enumerable.Repeat(chars, length)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            return result;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int makh = GetMaTKFromSomeSource(); // Giả định rằng bạn đã có phương thức này để lấy giá trị MaTK

            // Chuyển đổi giá trị MaTK thành chuỗi
            string kh = makh.ToString();

            ChiNhanh chiNhanh = new ChiNhanh();
            // Tăng giá trị count


            // Lưu giá trị count vào session
            string url = HttpContext.Current.Request.Url.ToString();
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            //DonHang donHang = new DonHang();

            string ma = GenerateRandomString(4);
            if (makh != 0 && lstGioHang != null && lstGioHang.Any())
            {
                // Tạo một đơn hàng mới
                DonHang donHang = new DonHang
                {
                    MaDH = ma,
                    KH = kh,
                    Ngay = DateTime.Now,
                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                };
                //    donHang.MaDH = ma;
                ////donHang.MaKH = makh;

                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                //    donHang.KH = kh;

                //    // Tiếp tục xử lý khác ở đây...

                //donHang.Ngay = DateTime.Now;
                //donHang.MaCN = Shop.CH;
                //donHang.ChiTietDonHangs = lstGioHang;
                //donHang.MaKH = Account.makh;

                dbcontext.DonHangs.Add(donHang);
                dbcontext.SaveChanges();
                string maDonHang = donHang.MaDH;
                int count = 1;
                foreach (var item in lstGioHang)
                {
                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                    {
                        KH = donHang.KH,
                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                        MaCTDH = mact,
                        MaSP = item.MaSP,
                        TenSP = item.TenSP,
                        DuongDan = item.DuongDan,
                        SoLuong = item.SoLuong,
                        Gia = item.Gia,
                        ThanhTien = item.ThanhTien
                    };

                    //chiTietDon.KH = donHang.KH;
                    //chiTietDon.MaDH = donHang.MaDH;
                    //chiTietDon.MaCTDH = mact;
                    //chiTietDon.MaSP = item.MaSP;
                    //chiTietDon.TenSP = item.TenSP;
                    //chiTietDon.DuongDan = item.DuongDan;
                    //chiTietDon.SoLuong = item.SoLuong;
                    //chiTietDon.Gia = item.Gia;
                    //chiTietDon.ThanhTien = item.ThanhTien;
                    chiTietDon.Ngay = donHang.Ngay;
                    chiTietDon.GiaoDich = false;
                    count++;
                    madh = donHang.MaDH;
                    dbcontext.ChiTietDonHangs.Add(chiTietDon);

                }
            }

            dbcontext.SaveChanges();
            lstGioHang.Clear();
            Session["GioHang"] = lstGioHang;
            Response.Redirect("Success.aspx?GD=TM");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }


    }



}
