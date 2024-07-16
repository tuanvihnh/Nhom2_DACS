﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class ManagerRevenue : System.Web.UI.Page
    {
        public int Year { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_BTSEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || (p.Quyen == "Admin" || p.Quyen == "Manager") && p.TrangThai == true && p.Email == SignIn.email))
            {

            }
            // Otherwise, display an error message

            else
            {
                //Response.Write("<script>alert('Bạn không có quyền truy cập');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Bạn không có quyền truy cập!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");
                Response.Redirect("Error.aspx");

            }
            if (!IsPostBack)
            {
                Year = DateTime.Now.Year; // Sử dụng năm hiện tại làm mặc định
                BindData();
                BindDataBieuDoTron();
            }
        }

        //protected void BindData()
        //{
        //    DataTable dt = new DataTable();
        //    string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
        //    string initialCatalog = "QL_BTS";
        //    string sqlTK = "sa";
        //    string sqlMK = "1";
        //    string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT MONTH(ChiTietDonHang.Ngay) AS Month, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP WHERE YEAR(Ngay) = @Year GROUP BY MONTH(Ngay)", con);
        //        cmd.Parameters.AddWithValue("@Year", Year);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(dt);
        //    }

        //    GridViewMonthlyRevenue.DataSource = dt;
        //    GridViewMonthlyRevenue.DataBind();

        //    LabelTotalRevenue.Text = CalculateTotalRevenue(dt).ToString("N0")+"đ"; // Format as currency
        //}

        //protected decimal CalculateTotalRevenue(DataTable dt)
        //{
        //    decimal totalRevenue = 0;
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        totalRevenue += Convert.ToDecimal(row["Revenue"]);
        //    }
        //    return totalRevenue;
        //}
        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public IQueryable<ChiTietDonHang> GetDeparments()
        {
            IQueryable<ChiTietDonHang> order = dbcontext.ChiTietDonHangs;

            return order;
        }


        private QL_BTSEntities dbcontext = new QL_BTSEntities();
       
        private DataTable GetData(string query)
        {
            string dataSource = "LAPTOP-3RMJC24I";
            string initialCatalog = "QL_BTS";
            string sqlTK = "sa";
            string sqlMK = "123456";
            //string dataSource = "SQL9001.site4now.net";
            //string initialCatalog = "db_aa6a91_sa";
            //string sqlTK = "db_aa6a91_sa";
            //string sqlMK = "26072003Duc";
            string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Year", Year);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }
        //private void RegisterScript(string chartName, DataTable dt)
        //{
        //    string jsonLabels = Newtonsoft.Json.JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r[0].ToString()));
        //    string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r[1]));

        //    string script = $@"
        //    <script>
        //    document.addEventListener('DOMContentLoaded', (event) => {{
        //        var labels = {jsonLabels};
        //        var data = {jsonData};
        //        var backgroundColors = labels.map(() => {{
        //            var letters = '0123456789ABCDEF';
        //            var color = '#';
        //            for (var i = 0; i < 6; i++) {{
        //                color += letters[Math.floor(Math.random() * 16)];
        //            }}
        //            return color;
        //        }});

        //        var ctx = document.getElementById('myPieChart{chartName}').getContext('2d');
        //        new Chart(ctx, {{
        //            type: 'pie',
        //            data: {{
        //                labels: labels,
        //                datasets: [{{
        //                    data: data,
        //                    backgroundColor: backgroundColors,
        //                }}],
        //            }},
        //            options: {{
        //                responsive: true,
        //                legend: {{
        //                    position: 'top',
        //                }},
        //                animation: {{
        //                    animateScale: true,
        //                    animateRotate: true
        //                }}
        //            }}
        //        }});
        //    }});
        //    </script>";

        //    ClientScript.RegisterStartupScript(this.GetType(), $"PieChartScript{chartName}", script);
        //}
        private void RegisterScript(string chartName, DataTable dt)
        {
            string jsonLabels = Newtonsoft.Json.JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r[0].ToString()));
            string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(dt.AsEnumerable().Select(r => r[1]));

            string script = $@"
    <script>
    document.addEventListener('DOMContentLoaded', (event) => {{
        var labels = {jsonLabels};
        var data = {jsonData};
        var backgroundColors = labels.map(() => {{
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++) {{
                color += letters[Math.floor(Math.random() * 16)];
            }}
            return color;
        }});

        function formatCurrency(value) {{
            return value.toLocaleString('vi-VN', {{ style: 'currency', currency: 'VND' }});
        }}

        var ctx = document.getElementById('myPieChart{chartName}').getContext('2d');
        new Chart(ctx, {{
            type: 'pie',
            data: {{
                labels: labels,
                datasets: [{{
                    data: data,
                    backgroundColor: backgroundColors,
                }}],
            }},
            options: {{
                responsive: true,
                legend: {{
                    position: 'top',
                }},
                tooltips: {{
                    callbacks: {{
                        label: function(tooltipItem, data) {{
                            var label = data.labels[tooltipItem.index] || '';
                            var value = data.datasets[0].data[tooltipItem.index];
                            return label + ': ' + formatCurrency(value);
                        }}
                    }}
                }},
                animation: {{
                    animateScale: true,
                    animateRotate: true
                }}
            }}
        }});
    }});
    </script>";

            ClientScript.RegisterStartupScript(this.GetType(), $"PieChartScript{chartName}", script);
        }

        protected void BindDataBieuDoTron()
        {
            DataTable dtLoai = GetData("SELECT Loai.TenLoai, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP INNER JOIN Loai ON SanPham.MaLoai = Loai.MaLoai WHERE YEAR(ChiTietDonHang.Ngay) = @Year GROUP BY Loai.TenLoai");

            //DataTable dtNhom = GetData("SELECT Nhom.TenNhom, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP INNER JOIN Nhom ON SanPham.MaNhom = Nhom.MaNhom WHERE YEAR(ChiTietDonHang.Ngay) = @Year GROUP BY Nhom.TenNhom");

            DataTable dtAlbum = GetData("SELECT SanPham.TenSP, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP INNER JOIN Loai ON SanPham.MaLoai = Loai.MaLoai WHERE Loai.TenLoai LIKE '%album%' AND YEAR(ChiTietDonHang.Ngay) = @Year GROUP BY SanPham.TenSP ORDER BY Revenue DESC");

            DataTable dtChiNhanh = GetData("SELECT ChiNhanh.TenCN, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN DonHang ON ChiTietDonHang.MaDH = DonHang.MaDH INNER JOIN ChiNhanh ON DonHang.MaCN = ChiNhanh.MaCN WHERE YEAR(ChiTietDonHang.Ngay) = @Year GROUP BY ChiNhanh.TenCN");

            RegisterScript("Loai", dtLoai);
            //RegisterScript("Nhom", dtNhom);
            RegisterScript("Album", dtAlbum);
            RegisterScript("ChiNhanh", dtChiNhanh);
        }

        protected void BindData()
        {
            string dataSource = "LAPTOP-3RMJC24I";
            string initialCatalog = "QL_BTS";
            string sqlTK = "sa";
            string sqlMK = "123456";
            //string dataSource = "SQL9001.site4now.net";
            //string initialCatalog = "db_aa6a91_sa";
            //string sqlTK = "db_aa6a91_sa";
            //string sqlMK = "26072003Duc";
            string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";
            DataTable dt = new DataTable();
            //string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
            //string initialCatalog = "QL_KPOPStore";
            //string sqlTK = "sa";
            //string sqlMK = "1";
            //string dataSource = Shop.SQL_dataSource /*"DUC-LAPTOP\\NGUYENHOANGDUC"*/;
            //string initialCatalog = Shop.SQL_initialCatalog /*"QL_KPOPStore"*/;
            //string sqlTK = Shop.SQL_sqlTK /*"sa"*/;
            //string sqlMK = Shop.SQL_sqlMK  /*"1"*/;
            //string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT MONTH(ChiTietDonHang.Ngay) AS Month, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP WHERE YEAR(Ngay) = @Year GROUP BY MONTH(Ngay)", con);
                cmd.Parameters.AddWithValue("@Year", Year);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            //GridViewMonthlyRevenue.DataSource = dt;
            //GridViewMonthlyRevenue.DataBind();
            var paidOrderCount = dbcontext.ChiTietDonHangs
                    .Where(s => s.GiaoDich == true)
                    .Select(s => s.MaDH)
                    .Distinct()
                    .Count();

            // Count unpaid orders
            var unpaidOrderCount = dbcontext.ChiTietDonHangs
                .Where(s => s.GiaoDich == false)
                .Select(s => s.MaDH)
                .Distinct()
                .Count();
            var isSignin = dbcontext.TKs.Any(s => s.Email == SignIn.email);
            var accountPer = dbcontext.TKs.Any(s => s.Email == SignIn.email && (s.Quyen == "Admin" || s.Quyen == "Manager"));
            if (!isSignin && SignIn.email == null)
            {
                Response.Redirect("Error/401");
            }
            else
            {
                if (accountPer)
                {
                    var account = dbcontext.TKs.FirstOrDefault(s => s.Email == SignIn.email && (s.Quyen == "Admin" || s.Quyen == "Manager"));
                }
                else
                {
                    Response.Redirect("Error/401");
                }
            }

            // Update the labels with the counts
            //lbSDDTT.Text = paidOrderCount.ToString();
            //lbSDCTT.Text = unpaidOrderCount.ToString();

            var doanhso = dbcontext.DoanhThus.Any();
            //if (doanhso)
            //    lbTotalRevenue.Text = dbcontext.DoanhThus.Sum(s => s.DoanhThuNgay).ToString("N0") + "đ";
            ////LabelTotalRevenue.Text = CalculateTotalRevenue(dt).ToString("N0") + "đ"; // Format as currency
            //else
            //    lbTotalRevenue.Text = "0đ";

        }

        protected decimal CalculateTotalRevenue(DataTable dt)
        {
            decimal totalRevenue = 0;
            foreach (DataRow row in dt.Rows)
            {
                totalRevenue += Convert.ToDecimal(row["Revenue"]);
            }
            return totalRevenue;
        }
        
        public double GetTotalRevenue()
        {
            var total = dbcontext.ChiTietDonHangs.Where(s => s.GiaoDich == true).Sum(s => s.ThanhTien);
            double totalRevenue = total;
            return totalRevenue;
        }

        private int startRowIndex, maximumRows;

        protected void SearchButtonGetDeparments_Click(object sender, EventArgs e)
        {
            //ListView1.DataSource = null;
            //ListView1.DataSourceID = null;
            //ListView1.DataBind();
            GetDeparmentsRevenue();



        }
        public IQueryable<ChiTietDonHang> GetDeparmentsRevenue()
        {
            IQueryable<ChiTietDonHang> order = dbcontext.ChiTietDonHangs;

            return order.OrderBy(e => e.Ngay);
        }
        //public  IQueryable<DoanhThu>  GetRevernue()
        //{
        //    // Lấy dữ liệu doanh thu từ tháng hiện tại cho năm hiện tại
        //    var doanhThu = dbcontext.DoanhThus
        //      /*.Where(d => d.Nam == DateTime.Now.Year && d.Ngay <= DateTime.Now.Day)*/.AsQueryable();

        //    return doanhThu;
        //}

        public IQueryable<DoanhThu> GetRevernueRevenue()
        {
            // Lấy dữ liệu doanh thu từ tháng hiện tại cho năm hiện tại
            var doanhThu = dbcontext.DoanhThus
                .Where(d => d.Nam == DateTime.Now.Year) // Ensure the year filter is applied correctly
                .OrderBy(d => d.Ngay)
                .ThenBy(d => d.Thang);

            return doanhThu.Take(15);
        }










        protected void ListView1Branch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public IQueryable<ChiNhanh> GetDeparmentsBranch()
        {
            IQueryable<ChiNhanh> branch = dbcontext.ChiNhanhs;

            return branch;
        }

        protected void btnCPass_Click(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var tk = user.SingleOrDefault(p => p.Email == SignIn.email);

            Response.Redirect("ChangePassword.aspx?Deptid=" + tk.Email);
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;

            using (var dbContext = new QL_BTSEntities())
            {
                var disabledTKs = dbContext.TKs.FirstOrDefault(p => p.TrangThai == true && p.Email == SignIn.email);

                var disabledKhs = dbContext.KhachHangs.FirstOrDefault(p => p.TrangThai == true && p.Email == SignIn.email);
                disabledTKs.TrangThai = false;

                var Khs = dbContext.KhachHangs.Any(p => p.TrangThai == true && p.Email == SignIn.email);
                var Tks = dbContext.TKs.Any(p => p.TrangThai == true && p.Email == SignIn.email);



                if (Tks)
                {

                    disabledTKs.TrangThai = false;
                    if (Khs)
                        disabledKhs.TrangThai = false;
                }

                else
                {

                }
                //var disabledKHs = dbContext.KhachHangs.Where(p => p.TrangThai == true).ToList();
                //foreach (var kh in disabledKHs)
                //{
                //    kh.TrangThai = false;
                //}


                // Lưu thay đổi vào cơ sở dữ liệu
                dbContext.SaveChanges();
                dbcontext.SaveChanges();
            }
            if (Request.Cookies["UserAccount"] != null)
            {

                Response.Cookies.Clear();
            }
            if (Request.Cookies["UserAccount"] != null)
            {
                HttpCookie cookie = new HttpCookie("UserAccount");
                cookie.Expires = DateTime.Now.AddMonths(-1); // Đặt thời hạn về một ngày trong quá khứ
                Response.Cookies.Add(cookie);
            }
            //Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác');</script>");
            Session.Remove("Password");
            Session.Remove("Email");
            SignIn.email = null;
            SignIn.pass = null;
            Session.Remove("TenTaiKhoan");
            Session.Remove("MatKhau");
            Session.Remove("User");
            Session.Remove("Password");
            Session.Remove("Email");
            //Session["MaKH"] = "";
            Session.Remove("MaKH");
            //Session.Clear();
            Response.Redirect("Sign.aspx");

        }


    }
}