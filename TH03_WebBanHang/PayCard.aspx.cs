using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;
using VNPAY_CS_ASPX;
using VNPAY_CS_ASPX.Models;
using System.Xml.Linq;
using log4net;
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
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Controls;
using System.Windows.Input;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;
using VNPAY_CS_ASPX.Models;
using VNPAY_CS_ASPX;
using System.Net.Mail;
using System.Net.Mime;
using System.Windows;

using System.Xml.Linq;
namespace TH03_WebBanHang
{
    public partial class PayCard : System.Web.UI.Page
    {
        public static string payOrder;
        public static string maKH;
        public static string maCN=Shop.CH;
        private static readonly ILog log =
         LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();

            amount.Text = string.Format("{0:N0}", hepler.TongThanhTien(lstGioHang).ToString());

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



                // user.Any(p =>p.MaTK == makh);
                string vnp_Returnurl = ConfigurationManager.AppSettings["vnp_Returnurl"]; //URL nhan ket qua tra ve 
                string vnp_Url = ConfigurationManager.AppSettings["vnp_Url"]; //URL thanh toan cua VNPAY 
                string vnp_TmnCode = ConfigurationManager.AppSettings["vnp_TmnCode"]; //Ma định danh merchant kết nối (Terminal Id)
                string vnp_HashSecret = ConfigurationManager.AppSettings["vnp_HashSecret"]; //Secret Key

                //Get payment input
                OrderInfo order = new OrderInfo();
                order.OrderId = DateTime.Now.Ticks; // Giả lập mã giao dịch hệ thống merchant gửi sang VNPAY
                order.Amount = TH03_WebBanHang.Pay.TongThanhTien; // Giả lập số tiền thanh toán hệ thống merchant gửi sang VNPAY 100,000 VND
                order.Status = "0"; //0: Trạng thái thanh toán "chờ thanh toán" hoặc "Pending" khởi tạo giao dịch chưa có IPN
                order.CreatedDate = DateTime.Now;
                //Save order to db

                //Build URL for VNPAY
                VnPayLibrary vnpay = new VnPayLibrary();

                vnpay.AddRequestData("vnp_Version", VnPayLibrary.VERSION);
                vnpay.AddRequestData("vnp_Command", "pay");
                vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);
                vnpay.AddRequestData("vnp_Amount", (order.Amount * 100).ToString()); //Số tiền thanh toán. Số tiền không mang các ký tự phân tách thập phân, phần nghìn, ký tự tiền tệ. Để gửi số tiền thanh toán là 100,000 VND (một trăm nghìn VNĐ) thì merchant cần nhân thêm 100 lần (khử phần thập phân), sau đó gửi sang VNPAY là: 10000000
                //if (/*bankcode_Vnpayqr.Checked == true || */ddlPay.SelectedValue == "appVNPAYQR")
                //{
                //    vnpay.AddRequestData("vnp_BankCode", "VNPAYQR");
                //}
                //if (/*bankcode_Vnbank.Checked == true*/ ddlPay.SelectedValue == "atnVNBank")
                //{
                    vnpay.AddRequestData("vnp_BankCode", "VNBANK");
                //}
                //if (/*bankcode_Intcard.Checked == true*/ ddlPay.SelectedValue == "intVNPay")
                //{
                //    vnpay.AddRequestData("vnp_BankCode", "INTCARD");
                //}
                //if (ddlPaymentVNPaySelect.SelectedValue == "VNPAYQR")
                //{
                //    vnpay.AddRequestData("vnp_BankCode", "INTCARD");
                //}
                vnpay.AddRequestData("vnp_CreateDate", order.CreatedDate.ToString("yyyyMMddHHmmss"));
                vnpay.AddRequestData("vnp_CurrCode", "VND");
                vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress());
                vnpay.AddRequestData("vnp_Locale", "vn");
                //if (locale_Vn.Checked == true)
                //{
                //    vnpay.AddRequestData("vnp_Locale", "vn");
                //}
                //else if (locale_En.Checked == true)
                //{
                //    vnpay.AddRequestData("vnp_Locale", "en");
                //}
                vnpay.AddRequestData("vnp_OrderInfo", "Thanh toan don hang:" + TH03_WebBanHang.Pay.madh);
                vnpay.AddRequestData("vnp_OrderType", "other"); //default value: other

                vnpay.AddRequestData("vnp_ReturnUrl", vnp_Returnurl);
                vnpay.AddRequestData("vnp_TxnRef", order.OrderId.ToString()); // Mã tham chiếu của giao dịch tại hệ thống của merchant. Mã này là duy nhất dùng để phân biệt các đơn hàng gửi sang VNPAY. Không được trùng lặp trong ngày

                //Add Params of 2.1.0 Version
                //Billing

                string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
                log.InfoFormat("VNPAY URL: {0}", paymentUrl);
                Response.Redirect(paymentUrl);
              


            }
            // Otherwise, display an error message

            else
            {

                Response.Redirect("Cart.aspx");

            }
        }
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        // Phương thức giả định để lấy giá trị MaTK từ một nguồn nào đó
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

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cardUser.Text) ||
        string.IsNullOrEmpty(cardNumber.Text) ||
        string.IsNullOrEmpty(cardCVC.Text) ||
        string.IsNullOrEmpty(cardExpiry.Text))
            {
                //Response.Write("<script>alert('Bạn chưa nhập đủ thông tin thẻ!');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Bạn chưa nhập đủ thông tin thẻ!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

            }
            else
            {
                // Nếu tất cả các trường dữ liệu được nhập, tiếp tục xử lý thanh toán
                // Viết mã xử lý thanh toán ở đây

                
            }
        }

    }
}