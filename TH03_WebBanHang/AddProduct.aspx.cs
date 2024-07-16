using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();

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

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            QL_BTSEntities sp = new QL_BTSEntities();
            if (sp.SanPhams.Any(p => p.MaSP == txtMaSP.Text))
            {

                //Response.Write("<script>alert('Sản phẩm đã tồn tại');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Sản phẩm đã tồn tại!</div>");
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
                var db = new QL_BTSEntities();
                string maSP = txtMaSP.Text;

                string tenSP = txtTenSP.Text;
                float gia = float.Parse(txtGia.Text);
                string moTa = txtMoTa.Text;
                string maLoai = ddlMaLoai.SelectedValue; // Giả sử bạn có một DropDownList có tên ddlMaLoai để chọn mã loại sản phẩm.
                string maSize = ddlMaSize.SelectedValue;
                string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
                string initialCatalog = "QL_BTS";
                string sqlTK = "sa";
                string sqlMK = "1";
                //string dataSource = "SQL9001.site4now.net";
                //string initialCatalog = "db_aa6a91_sa";
                //string sqlTK = "db_aa6a91_sa";
                //string sqlMK = "26072003Duc";
                string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Product_Add", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@MaSP", maSP);
                        command.Parameters.AddWithValue("@TenSP", tenSP);
                        command.Parameters.AddWithValue("@Gia", gia);
                        command.Parameters.AddWithValue("@MoTa", moTa);
                        command.Parameters.AddWithValue("@MaLoai", maLoai);
                        command.Parameters.AddWithValue("@MaSize", maSize);
                        if (fileUpload.HasFile)
                        {
                            string uploadFolderPath = Server.MapPath("Content/img/");
                            string fileName = Path.GetFileName(fileUpload.FileName);
                            string fileExtension = Path.GetExtension(fileUpload.FileName);

                            string filePath = Path.Combine(uploadFolderPath, fileName);

                            // Lấy đường dẫn từ "Content" trở đi
                            string relativePath = filePath.Substring(filePath.IndexOf("Content"));

                            command.Parameters.AddWithValue("@DuongDan", relativePath);

                            fileUpload.SaveAs(filePath);

                        }
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }


            //SanPham product = new SanPham();
            //product.MaSP = txtMaSP.Text;
            //product.TenSP = txtTenSP.Text;
            //product.MoTa = txtMoTa.Text;
            //product.Gia = double.Parse(txtGia.Text);
            //product.MaLoai = ddlMaLoai.SelectedValue;

            //if (fileUpload.HasFile)
            //{
            //    string uploadFolderPath = Server.MapPath("Content/img/");
            //    string fileName = Path.GetFileName(fileUpload.FileName);
            //    string filePath = Path.Combine(uploadFolderPath, fileName);

            //    product.DuongDan = filePath;
            //    fileUpload.SaveAs(filePath);
            //}

            //QL_BTSEntities dbcontext = new QL_BTSEntities();
            //dbcontext.SanPhams.Add(product);
            //dbcontext.SaveChanges();
            //Response.Redirect("ManagerProduct.aspx");
        }

        //protected void btnAddProduct_Click(object sender, EventArgs e)
        //{
        //    // Basic validation
        //    if (string.IsNullOrWhiteSpace(txtMaSP.Text) || string.IsNullOrWhiteSpace(txtTenSP.Text) || string.IsNullOrWhiteSpace(txtGia.Text))
        //    {
        //        // Show an error message or handle the error as needed
        //        return;
        //    }

        //    double gia;
        //    if (!double.TryParse(txtGia.Text, out gia))
        //    {
        //        // Show an error message or handle the error as needed
        //        return;
        //    }

        //    SanPham product = new SanPham();
        //    product.MaSP = txtMaSP.Text;
        //    product.TenSP = txtTenSP.Text;
        //    product.MoTa = txtMoTa.Text;
        //    product.Gia = gia;
        //    product.MaLoai = ddlMaLoai.SelectedValue.ToString();
        //    if (fileUpload.HasFile)
        //    {
        //        string uploadFolderPath = Server.MapPath("Content/img/");
        //        string fileName = Path.GetFileName(fileUpload.FileName);
        //        string filePath = Path.Combine(uploadFolderPath, fileName);


        //            fileUpload.SaveAs(filePath);

        //        product.DuongDan = filePath;

        //    }


        //    dbcontext.SanPhams.Add(product);
        //        dbcontext.SaveChanges();
        //        Response.Redirect("ManagerProduct.aspx");

        //}


    }
}