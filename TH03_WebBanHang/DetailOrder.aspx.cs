using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class DetailOrder : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        //public string emailKH;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var str = Request.QueryString["Order"].ToString();
                var maSP = Request.QueryString["SP"].ToString();
                var maloai = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == maSP);
                ChiTietDonHang chitet = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == str && p.MaSP == maSP);
                if (chitet.GiaoDich == true)
                {
                    Response.Write("<style>.text-gd{color:green;}</style>");
                }
                else { Response.Write("<style>.text-gd{color:red;}</style>"); }
                int clientId;

                if (!int.TryParse(chitet.KH, out clientId))
                {

                    clientId = 0;
                }
                KhachHang deparments = dbcontext.KhachHangs.SingleOrDefault(p => p.MaKH == clientId);

                lbDeptid.Text = clientId.ToString();
                lbEmail.Text = deparments.Email;
                lbName.Text = deparments.HoTen;
                lbPhone.Text = deparments.DienThoai;
                lbLocate.Text = deparments.DiaChi;
                lbMD.Text = chitet.MaCTDH;
                lbSP.Text = chitet.TenSP;
                lbSL.Text = chitet.SoLuong.ToString();
                lbGia.Text = chitet.Gia.ToString("N0") + "đ";
                lbThanhTien.Text = chitet.ThanhTien.ToString("N0") + "đ";
                lbImg.ImageUrl = chitet.DuongDan;
                lbSize.Text = chitet.SanPham.KichThuoc.TenSize;
                //emailKH = deparments.Email;
                if (chitet.GiaoDich == true)
                {

                    Response.Write(" <style>                #btnXN {\r\n                    display:none;\r\n                }\r\n            </style>");
                    lbGiaoDich.Text = "Đã Thanh Toán";
                    lbGiaoDich.Style.Add(HtmlTextWriterStyle.Color, "green");

                }
                else
                {
                    var user = from u in dbcontext.TKs
                               select u;
                    if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || ((p.Quyen == "Admin" || p.Quyen == "Manager") && p.TrangThai == true && p.Email == SignIn.email)))
                    {
                        Response.Write(" <style>                #btnXN {\r\n                    display:block;\r\n                }\r\n            </style>");

                    }
                    else Response.Write(" <style>                #btnXN {\r\n                    display:none;\r\n                }\r\n            </style>");

                    lbGiaoDich.Text = "Đợi Thanh Toán";
                    lbGiaoDich.Style.Add(HtmlTextWriterStyle.Color, "red");
                }
                SanPham sanPhamSL = dbcontext.SanPhams.Where(p => p.MaSP != chitet.MaSP && p.TenSP == chitet.TenSP).FirstOrDefault();


            }
        }
        public void SendEmail(string to, string subject, string body, string imagePath)
        {
            var str = Request.QueryString["Order"].ToString();

            ChiTietDonHang maDH = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == str);

            try
            {
                // Tạo một đối tượng SmtpClient
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new System.Net.NetworkCredential("2105ct0098@dhv.edu.vn", "beduc102"),
                    EnableSsl = true
                };

                // Tạo một đối tượng MailMessage
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("2105ct0098@dhv.edu.vn");
                mailMessage.To.Add(new MailAddress(to));
                mailMessage.Subject = subject;

                // Thêm hình ảnh vào email
                LinkedResource inline = new LinkedResource(imagePath, MediaTypeNames.Image.Jpeg);
                inline.ContentId = Guid.NewGuid().ToString(); // Đặt ContentId để tham chiếu đến hình ảnh trong HTML
                string styleColor;
                if (maDH.GiaoDich == true)
                {
                    styleColor = "<p>Giao dịch: <span style=\"color: green;\">Đã Thanh Toán</span></p>";
                }
                else styleColor = "<p>Giao dịch: <span style=\"color: red;\">Đợi Thanh Toán</span></p>";
                // Tạo nội dung HTML tùy chỉnh
                string htmlBody = $"<html><body><img style=\"max-width: 100%; border-radius:20px;\" src='cid:{inline.ContentId}' alt='Gmilk Tea' /><h1>Thông báo đơn hàng!</h1><p>Xin chào bạn đây là thông báo về đơn hàng với mã là <strong>{maDH.MaCTDH}</strong> đã được chúng tôi xác nhận.{styleColor}<p>Vào lúc: {maDH.Ngay}</p></p><p>Cảm ơn vì bạn đã mua hàng.</p></body></html>";

                AlternateView avHtml = AlternateView.CreateAlternateViewFromString(htmlBody, null, MediaTypeNames.Text.Html);
                avHtml.LinkedResources.Add(inline);
                mailMessage.AlternateViews.Add(avHtml);

                // Gửi email
                smtpClient.Send(mailMessage);
                Console.WriteLine("Đã gửi email.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi gửi email: " + ex.Message);
            }
        }

        protected void btDone_Click(object sender, EventArgs e)
        {
            var str = Request.QueryString["Order"].ToString();
            var maSP = Request.QueryString["SP"].ToString();
            ChiTietDonHang chitet = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == str && p.MaSP == maSP);
            int clientId;

            if (!int.TryParse(chitet.KH, out clientId))
            {

                clientId = 0;
            }
            KhachHang deparments = dbcontext.KhachHangs.SingleOrDefault(p => p.MaKH == clientId);

            var db = new QL_BTSEntities();
            string imagePath = Server.MapPath("Content\\image-bg\\Gmilk-Tea.png");
            DoanhThu doanhThu = new DoanhThu();

            if (chitet.GiaoDich == false)
            {

                chitet.GiaoDich = true;
                if (dbcontext.DoanhThus.Any(s => s.Nam == DateTime.Now.Year && s.Thang == DateTime.Now.Month && s.Ngay == DateTime.Now.Day))
                {
                    doanhThu = dbcontext.DoanhThus.FirstOrDefault(s => s.Nam == DateTime.Now.Year && s.Thang == DateTime.Now.Month && s.Ngay == DateTime.Now.Day);
                    doanhThu.DoanhThuNgay += chitet.ThanhTien;

                }
                else
                {
                    doanhThu = new DoanhThu
                    {

                        Ngay = DateTime.Now.Day,
                        Nam = DateTime.Now.Year,
                        Thang = DateTime.Now.Month,
                        DoanhThuNgay = chitet.ThanhTien,
                    };
                    dbcontext.DoanhThus.Add(doanhThu);

                }


                SendEmail(deparments.Email, "Gmilk Tea", str, imagePath);


            }
            dbcontext.SaveChanges();
            db.SaveChanges();

        }
    }
}