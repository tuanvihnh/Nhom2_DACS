using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class SignIn : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        public static string email;
        public static string pass;

        public static int makh;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            Session["User"] = txtEmailSignIn.Text;
            Session["Password"] = txtPasswordSignIn.Text;

            email = Session["User"].ToString();
            pass = Session["Password"].ToString();

            //if (!IsPostBack)
            //{
            //// Connect to the database
            //QL_BTSEntities2 dbcontext = new QL_BTSEntities2();

            //// Query the database for all users
            //var users = from u in dbcontext.TKs
            //            select u;

            //    // Bind the query results to the DropDownList
            //    DDL_Username.DataSource = users;
            //    DDL_Username.DataTextField = "Username";
            //    DDL_Username.DataValueField = "UsernameID";
            //    DDL_Username.DataBind();
            //}
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_BTSEntities();
            if (user.Any(p => p.TrangThai == true&&p.Email== email && p.MatKhau == pass))
            {
                Response.Redirect("Account.aspx");

            }
        }


        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            // Connect to the database
            QL_BTSEntities db = QL_BTSEntities();
            if (db.TKs.Any(p=>p.Email!=txtEmailSignIn.Text||p.MatKhau!=txtPasswordSignIn.Text))
            {

                Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác');</script>");


            }

            // Query the database for the user with the given username and password
            var user = from u in db.TKs
                       where u.Email == txtEmailSignIn.Text && u.MatKhau == txtPasswordSignIn.Text
                       select u;
            var client = from c in db.KhachHangs
                         where c.Email == txtEmailSignIn.Text
                         select c;

            // If a user was found, redirect to the home page
            if (user.Any(p => p.Email == txtEmailSignIn.Text))
            {

                var disabledTKs = user.Where(p => p.TrangThai == false && p.Email == txtEmailSignIn.Text).ToList();
                var disabledKHs = client.Where(p => p.TrangThai == false && p.Email == txtEmailSignIn.Text).ToList();

                foreach (var tk in disabledTKs)
                {
                    tk.TrangThai = true;
                    Session["MaKH"] = tk.MaTK-1;

                }
                foreach (var kh in disabledKHs)
                {
                    kh.TrangThai = true;
                }
                db.SaveChanges(); Response.Redirect("Default.aspx");
            }
            // Otherwise, display an error message
            //else if (txtEmailSignIn.Text == "admin" && txtPasswordSignIn.Text == "123456")
            //{
            //    Response.Redirect("Admin.aspx");

            //}
            else
            {

                ModelState.AddModelError("Password", "The password is incorrect.");
            }
        }

        private QL_BTSEntities QL_BTSEntities()
        {
            return new QL_BTSEntities();
        }
    }


}