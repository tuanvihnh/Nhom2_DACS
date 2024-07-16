using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;
using System.Data.Entity;
using System.Data.EntityClient;

namespace TH03_WebBanHang
{
    public partial class Shop : System.Web.UI.MasterPage
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        public static string CH;

        protected void Page_Load(object sender, EventArgs e)
        {
            CH = ddlBranches.SelectedValue.ToString();
        
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_BTSEntities();
            if (user.Any(p => (p.Email == "Admin" &&SignIn.email=="Admin"&&p.Email==SignIn.email) || ((p.Quyen == "Admin" || p.Quyen == "Manager") && p.Email == SignIn.email)))
            {
            Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                var admin = document.getElementById(\"li-admin\");\r\n                                admin.style.display = \"block\";\r\n                            });\r\n                        </script>");
                //if (user.Any(p => p.Quyen == "Manager"&&p.Quyen!="Admin"))
                //{
                //    Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                                            var fa1 = document.getElementById(\"f-a1\");\r\n               var fa2 = document.getElementById(\"f-a2\");\r\n                    fa1.style.display = \"none\";\r\n          fa2.style.display = \"none\";\r\n                   });\r\n                        </script>");

                //}
                //else if (user.Any(p => p.Quyen == "Admin"|| (p.Email == "Admin" && SignIn.email == "Admin")))
                //{
                    Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                                            var fa1 = document.getElementById(\"f-a1\");\r\n       var fa2 = document.getElementById(\"f-a2\");\r\n                            fa1.style.display = \"block\";\r\n          fa2.style.display = \"block\";\r\n                   });\r\n                        </script>");
                //}
            }
            // Otherwise, display an error message

            else
            {
                Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                var admin = document.getElementById(\"li-admin\");\r\n                                admin.style.display = \"none\";\r\n                            });\r\n                        </script>");


            }

            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();
            lbCart.Text = hepler.TongSoLuong(lstGioHang).ToString(); 
            if (!IsPostBack)
            {

                // Load danh sách chi nhánh khi trang được tải lần đầu tiên
                if (Session["SelectedBranch"] != null)
                {
                    string selectedValue = Session["SelectedBranch"].ToString();
                    if (ddlBranches.Items.FindByValue(selectedValue) != null)
                    {
                        ddlBranches.SelectedValue = selectedValue;
                    }
                    else LoadChiNhanh();
                }
                else LoadChiNhanh();
                CH = ddlBranches.SelectedValue.ToString();
            }
            if (IsPostBack)
            {
                if (Session["SelectedBranch"] != null)
                {
                    string selectedValue = Session["SelectedBranch"].ToString();
                    if (ddlBranches.Items.FindByValue(selectedValue) != null)
                    {
                        ddlBranches.SelectedValue = selectedValue;
                    }
                    else LoadChiNhanh();
                }
                else LoadChiNhanh();
                CH = ddlBranches.SelectedValue.ToString();
            }
            
            string searchText = Request.Form["searchinput"];



        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            
            string searchText = searchinput.Text;
            Response.Redirect("item.aspx?searchText=" + searchText);


        }


        protected void ddlBranches_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lưu giá trị đã chọn vào session
            Session["SelectedBranch"] = ddlBranches.SelectedValue;

            // Các xử lý khác nếu cần
        }

        private void LoadChiNhanh()
        {

            string query = "SELECT MaCN, TenCN FROM ChiNhanh";
            //string efConnectionString = ConfigurationManager.ConnectionStrings["QL_KPOPStoreEntities"].ConnectionString;
            string efConnectionString = ConfigurationManager.ConnectionStrings["QL_BTSEntities"].ConnectionString;
            EntityConnectionStringBuilder efBuilder = new EntityConnectionStringBuilder(efConnectionString);
            string actualConnectionString = efBuilder.ProviderConnectionString;
            using (SqlConnection connection = new SqlConnection(actualConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ddlBranches.Items.RemoveAt(0);
                    while (reader.Read())
                    {
                        string maCN = reader["MaCN"].ToString();
                        string tenCN = reader["TenCN"].ToString();

                        ListItem listItem = new ListItem(tenCN, maCN);
                        ddlBranches.Items.Add(listItem);
                    }

                    // Check if there's a selected value stored in the session
                    if (Session["SelectedBranch"] != null)
                    {
                        // Set the selected value from the session
                        ddlBranches.SelectedValue = Session["SelectedBranch"].ToString();
                    }
                    else
                    {
                        // If no value is stored in the session, select the first item
                        ddlBranches.SelectedIndex = 0;
                    }

                    connection.Close();
                }
            }

            CH = ddlBranches.SelectedValue.ToString();
        }

        //private void LoadChiNhanh()
        //{
        //    string query = "SELECT MaCN, TenCN FROM ChiNhanh";
        //    string efConnectionString = ConfigurationManager.ConnectionStrings["QL_BTSEntities"].ConnectionString;
        //    EntityConnectionStringBuilder efBuilder = new EntityConnectionStringBuilder(efConnectionString);
        //    string actualConnectionString = efBuilder.ProviderConnectionString;
        //    using (SqlConnection connection = new SqlConnection(actualConnectionString))
        //    {
        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            connection.Open();
        //            SqlDataReader reader = command.ExecuteReader();
        //            ddlBranches.Items.RemoveAt(0);
        //            while (reader.Read())
        //            {
        //                string maCN = reader["MaCN"].ToString();
        //                string tenCN = reader["TenCN"].ToString();

        //                ListItem listItem = new ListItem(tenCN, maCN);
        //                ddlBranches.Items.Add(listItem);                        
        //                ddlBranches.SelectedIndex = 0;
        //            }

        //            connection.Close();
        //        }
        //    }
        //}
    }
}