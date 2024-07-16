using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using log4net;
using TH03_WebBanHang;
using TH03_WebBanHang.Models;
using System.IO;
using System.Net.Mail;
using System.Net.Mime;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Help;
using System.Data.SqlClient;

namespace VNPAY_CS_ASPX
{
    public partial class vnpay_return : System.Web.UI.Page
    {
        private static readonly ILog log =
           LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        
        public double DoanhThuNgay { get; private set; }
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

        protected void Page_Load(object sender, EventArgs e)
        {
            string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
            string initialCatalog = "QL_BTS";
            string sqlTK = "sa";
            string sqlMK = "1";
            string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";
            log.InfoFormat("Begin VNPAY Return, URL={0}", Request.RawUrl);
            if (Request.QueryString.Count > 0)
            {
                string vnp_HashSecret = ConfigurationManager.AppSettings["vnp_HashSecret"]; //Chuoi bi mat
                var vnpayData = Request.QueryString;
                VnPayLibrary vnpay = new VnPayLibrary();
                 
                foreach (string s in vnpayData)
                {
                    //get all querystring data
                    if (!string.IsNullOrEmpty(s) && s.StartsWith("vnp_"))
                    {
                        vnpay.AddResponseData(s, vnpayData[s]);
                    }
                }
                //vnp_TxnRef: Ma don hang merchant gui VNPAY tai command=pay    
                //vnp_TransactionNo: Ma GD tai he thong VNPAY
                //vnp_ResponseCode:Response code from VNPAY: 00: Thanh cong, Khac 00: Xem tai lieu
                //vnp_SecureHash: HmacSHA512 cua du lieu tra ve

                long orderId = Convert.ToInt64(vnpay.GetResponseData("vnp_TxnRef"));
                long vnpayTranId = Convert.ToInt64(vnpay.GetResponseData("vnp_TransactionNo"));
                string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
                string vnp_TransactionStatus = vnpay.GetResponseData("vnp_TransactionStatus");
                String vnp_SecureHash = Request.QueryString["vnp_SecureHash"];
                String TerminalID = Request.QueryString["vnp_TmnCode"];
                long vnp_Amount = Convert.ToInt64(vnpay.GetResponseData("vnp_Amount"))/100;
                String bankCode = Request.QueryString["vnp_BankCode"];
                double ThanhTien = 0;
                //string existingChiNhanh = dbcontext.ChiNhanhs.FirstOrDefault(cn => cn.MaCN == Shop.CH).MaCN;
                
                log.InfoFormat("Attempting to create DonHang with MaCN={0}", Shop.CH);

                bool checkSignature = vnpay.ValidateSignature(vnp_SecureHash, vnp_HashSecret);
                if (checkSignature)
                {
                    if (vnp_ResponseCode == "00" && vnp_TransactionStatus == "00")
                    {
                        //Thanh toan thanh cong
                        displayMsg.InnerText = "Giao dịch được thực hiện thành công. Cảm ơn quý khách đã sử dụng dịch vụ";
                        log.InfoFormat("Thanh toan thanh cong, OrderId={0}, VNPAY TranId={1}", orderId, vnpayTranId);
                       
                            // Nếu tất cả các trường dữ liệu được nhập, tiếp tục xử lý thanh toán
                            // Viết mã xử lý thanh toán ở đây

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
                                

                                    // Xóa ràng buộc khóa chính hiện tại
                                    //using (SqlCommand command = new SqlCommand("ALTER TABLE DonHang DROP CONSTRAINT FK_DonHang_ChiNhanh;", connection))
                                    //{
                                    //    command.ExecuteNonQuery();
                                    //}

                                    
                                    // Tạo một đơn hàng mới
                                        DonHang donHang = new DonHang
                                        {
                                            MaDH = ma,
                                            KH = kh,
                                            Ngay = DateTime.Now,
                                            MaCN = Shop.CH // Ensure Shop.CH is a valid MaCN
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
                                            chiTietDon.GiaoDich = true;
                                            count++;
                                            ThanhTien = chiTietDon.ThanhTien;

                                            dbcontext.ChiTietDonHangs.Add(chiTietDon);

                                        }
                                // Đặt lại cột cũ làm khóa chính
                                        //using (SqlCommand command = new SqlCommand("ALTER TABLE DonHang ADD CONSTRAINT FK_DonHang_ChiNhanh PRIMARY KEY (OldPrimaryKey);", connection))
                                        //{
                                        //    command.ExecuteNonQuery();
                                        //}

                                        
                            }
                            DoanhThu doanhThu;
                            if (dbcontext.DoanhThus.Any(s => s.Nam == DateTime.Now.Year && s.Thang == DateTime.Now.Month && s.Ngay == DateTime.Now.Day))
                            {
                                doanhThu = dbcontext.DoanhThus.FirstOrDefault(s => s.Nam == DateTime.Now.Year && s.Thang == DateTime.Now.Month && s.Ngay == DateTime.Now.Day);
                                doanhThu.DoanhThuNgay += ThanhTien;

                            }
                            else
                            {
                                doanhThu = new DoanhThu
                                {


                                    Ngay = DateTime.Now.Day,
                                    Nam = DateTime.Now.Year,
                                    Thang = DateTime.Now.Month,
                                    DoanhThuNgay = ThanhTien,
                                };
                                dbcontext.DoanhThus.Add(doanhThu);

                            }
                        dbcontext.SaveChanges();
                            lstGioHang.Clear();
                            Session["GioHang"] = lstGioHang;
                            Response.Redirect("../Success.aspx?GD=Card");
                        
                    


                    }
                    else
                    {
                        //Thanh toan khong thanh cong. Ma loi: vnp_ResponseCode
                        displayMsg.InnerText = "Có lỗi xảy ra trong quá trình xử lý.Mã lỗi: " + vnp_ResponseCode;
                        log.InfoFormat("Thanh toan loi, OrderId={0}, VNPAY TranId={1},ResponseCode={2}", orderId, vnpayTranId, vnp_ResponseCode);
                    }
                    displayTmnCode.InnerText = "Mã Website (Terminal ID):" + TerminalID;
                    displayTxnRef.InnerText = "Mã giao dịch thanh toán:" + orderId.ToString();
                    displayVnpayTranNo.InnerText = "Mã giao dịch tại VNPAY:" + vnpayTranId.ToString();
                    displayAmount.InnerText = "Số tiền thanh toán (VND):" + vnp_Amount.ToString();
                    displayBankCode.InnerText = "Ngân hàng thanh toán:" + bankCode;
                }
                else
                {
                    log.InfoFormat("Invalid signature, InputData={0}", Request.RawUrl);
                    displayMsg.InnerText = "Có lỗi xảy ra trong quá trình xử lý";
                }
            }

        }
    }
}