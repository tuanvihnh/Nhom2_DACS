using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class AddAccount : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        string txtGT;
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_BTSEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || (p.Quyen == "Admin" && p.TrangThai == true && p.Email == SignIn.email)))
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

        protected void btAdd_Click(object sender, EventArgs e)
        {
            QL_BTSEntities tk = new QL_BTSEntities();
            if (string.IsNullOrEmpty(txtEmailSignUp.Text) ||
               string.IsNullOrEmpty(txtPasswordSignUp.Text) ||
               string.IsNullOrEmpty(txtName.Text) ||
               string.IsNullOrEmpty(txtDiachi.Text))
            {
                // Thông báo cho người dùng nhập đầy đủ thông tin
                //Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Vui lòng điền đầy đủ thông tin!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");
                return;
            }
            if (tk.TKs.Any(p => p.Email == txtEmailSignUp.Text))
            {

                //Response.Write("<script>alert('Tài khoản đã tồn tại');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Tài khoản đã tồn tại!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

            }
            else if (tk.KhachHangs.Any(p => p.DienThoai == TextPhone.Text))
            {

                //Response.Write("<script>alert('Số điện thoại đã tồn tại');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Số điện thoại đã tồn tại!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

            }
            else if (TextPhone.Text.Length != 10)
            {

                //Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Vui lòng nhập đúng số điện thoại!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

            }
            else if (txtDiachi.Text.Length <= 4)
            {

                //Response.Write("<script>alert('Vui lòng nhập địa chỉ cụ thể');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Vui lòng nhập địa chỉ cụ thể!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

            }
            else { TK deparment = new TK();
            KhachHang client = new KhachHang();
            QL_BTSEntities db = new QL_BTSEntities();
            deparment.Email = txtEmailSignUp.Text;
            deparment.MatKhau = txtPasswordSignUp.Text;
            deparment.TrangThai = false;
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
            client.HoTen = txtName.Text;
            client.DienThoai = TextPhone.Text;
            client.GioiTinh = txtGT;
            client.DiaChi = txtDiachi.Text;
            client.Email = txtEmailSignUp.Text;
            client.MatKhau = txtPasswordSignUp.Text;
            client.TrangThai = false;


            dbcontext.TKs.Add(deparment);
            dbcontext.KhachHangs.Add(client);

            dbcontext.SaveChanges();
            Response.Redirect("Admin.aspx");}
            
        }
    }
}