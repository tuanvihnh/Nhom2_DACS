using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class SignUp : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();

        string txtGT;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = txtEmailSignUp.Text;
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_BTSEntities();
            if (user.Any(p =>p.TrangThai == true && p.Email == SignIn.email))
            {
                Response.Redirect("Account.aspx");

            }
            // Otherwise, display an error message

           
        }

        protected void ddlGT_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlGT.SelectedValue == "Nam")
            {
                txtGT = "Nam";
            }
            else if (ddlGT.SelectedValue == "Nữ")
            {
                txtGT = "Nữ";
            }
            else if (ddlGT.SelectedValue == "Khác")
            {
                txtGT = "Khác";
            }
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            QL_BTSEntities tk = new QL_BTSEntities();
            if (string.IsNullOrEmpty(txtEmailSignUp.Text) ||
                string.IsNullOrEmpty(txtPasswordSignUp.Text) ||
                string.IsNullOrEmpty(txtName.Text) ||
                string.IsNullOrEmpty(txtDiachi.Text))
            {
                // Thông báo cho người dùng nhập đầy đủ thông tin
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin');</script>");

                return;
            }
            if (tk.TKs.Any(p => p.Email == txtEmailSignUp.Text))
            {

                Response.Write("<script>alert('Tài khoản đã tồn tại');</script>");

            }
            else if (tk.KhachHangs.Any(p => p.DienThoai == TextPhone.Text))
            {

                Response.Write("<script>alert('Số điện thoại đã tồn tại');</script>");

            }
            else if (TextPhone.Text.Length!=10)
            {

                Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại');</script>");

            }
            else if (txtDiachi.Text.Length<=4)
            {

                Response.Write("<script>alert('Vui lòng nhập địa chỉ cụ thể');</script>");

            }
            else {using (var db = new QL_BTSEntities())
            {
                
                // input
                if (string.IsNullOrWhiteSpace(txtEmailSignUp.Text) || string.IsNullOrWhiteSpace(txtPasswordSignUp.Text))
                {
                    throw new Exception("All fields are required.");
                }

                // Check if email already exists
                var existingUser = db.TKs.FirstOrDefault(u => u.Email == txtEmailSignUp.Text);
                var existingHoTen = db.KhachHangs.FirstOrDefault(t => t.HoTen == txtName.Text);
                var existingDiaChi = db.KhachHangs.FirstOrDefault(d => d.DiaChi == txtDiachi.Text);
                
                    var existingPhone = db.KhachHangs.FirstOrDefault(s => s.DienThoai == TextPhone.Text);
                    if (existingPhone != null)
                    {
                        throw new Exception("Phone already exists.");
                    }
                
                
                if (ddlGT.SelectedValue == "Nam")
                {
                    txtGT = "Nam";
                }
                else if (ddlGT.SelectedValue == "Nữ")
                {
                    txtGT = "Nữ";
                }
                else if (ddlGT.SelectedValue == "Khác")
                {
                    txtGT = "Khác";
                }
                var existingGioiTinh = db.KhachHangs.FirstOrDefault(d => d.GioiTinh == txtGT);

                if (existingUser != null)
                {
                    throw new Exception("Email already exists.");
                }
                // Add new user to database
                var newUser = new TK
                {
                    Email = txtEmailSignUp.Text,
                    MatKhau = txtPasswordSignUp.Text,
                    TrangThai = true,
                    


                };
                var newClient = new KhachHang
                {
                    HoTen = txtName.Text,
                    DienThoai = TextPhone.Text,
                    GioiTinh = txtGT,
                    DiaChi = txtDiachi.Text,
                    Email = txtEmailSignUp.Text,
                    MatKhau = txtPasswordSignUp.Text,
                    TrangThai = true,

                };

                db.TKs.Add(newUser);
                db.KhachHangs.Add(newClient);
                db.SaveChanges();

                // Redirect to login page
                Response.Redirect("Account.aspx");
            } }
            
        }
    }
}