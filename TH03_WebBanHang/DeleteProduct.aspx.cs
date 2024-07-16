using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class DeleteProduct : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                string str = Request.QueryString["Deptid"].ToString();
                SanPham deparments = dbcontext.SanPhams.SingleOrDefault(p => p.MaSP == str);
                lbDeptid.Text = str;
                lbName.Text = deparments.TenSP;
            }
        }

        protected void btDel_Click(object sender, EventArgs e)
        {
            //TK deparment = dbcontext.TKs.SingleOrDefault(p => p.Email == lbDeptid.Text);
            //try
            //{
            //    if (deparment.KhachHang.Count > 0)
            //    {
            //        ICollection<TK> employees = deparment.TKs;
            //        for (int i = 0; i < employees.Count; i++)
            //        {
            //            dbcontext.Employees.Remove(employees.ElementAt(i));
            //            dbcontext.SaveChanges();
            //        }
            //    }
            //    dbcontext.TKs.Remove(deparment);
            //    dbcontext.SaveChanges();
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            //Response.Redirect("Phong.aspx");
            string deptId = lbDeptid.Text;
            string deptName = lbName.Text;
            SanPham deparment = dbcontext.SanPhams.SingleOrDefault(p => p.MaSP == deptId);
            SanPham namesp = dbcontext.SanPhams.SingleOrDefault(p => p.TenSP == deptName && p.MaSP == deptId); //lọc trong xem có email nào == lbDeptid đang được hiện (TK)
            try
            {
                if (deparment.MaSP == lbDeptid.Text && namesp.TenSP == lbName.Text)
                {
                    ICollection<SanPham> eMSP = deparment.SPs;
                    foreach (var employeeMSP in eMSP.ToList())
                    {

                        dbcontext.SanPhams.Remove(employeeMSP);
                        dbcontext.SaveChanges();

                    }
                    ICollection<SanPham> eTSP = namesp.TSPs;
                    foreach (var employeeTSP in eTSP.ToList())
                    {

                        dbcontext.SanPhams.Remove(employeeTSP);
                        dbcontext.SaveChanges();

                    }
                    dbcontext.SanPhams.Remove(deparment);
                    dbcontext.SanPhams.Remove(namesp);

                    dbcontext.SaveChanges();

                }



                dbcontext.SaveChanges();



            }
            catch (Exception)
            {
                throw;
            }
            Response.Redirect("ManagerProduct.aspx");
        }
    }
}