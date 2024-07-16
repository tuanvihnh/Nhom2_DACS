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
    public partial class AccountOrder : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();
        public int MaKH;
        protected void Page_Load(object sender, EventArgs e)
        {

            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_BTSEntities();
            if (user.Any(p => p.TrangThai == true && p.Email == SignIn.email))
            {
                if (!IsPostBack)
                {
                    var str = Request.QueryString["Deptid"].ToString();



                    KhachHang deparments = dbcontext.KhachHangs.SingleOrDefault(p => p.MaKH == Account.makh);
                    ChiTietDonHang chitet = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.KH == str);
                }
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

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public IQueryable<ChiTietDonHang> GetDeparments()
        {
            KhachHang deparments = dbcontext.KhachHangs.SingleOrDefault(p => p.MaKH == Account.makh);
            MaKH = Account.makh - 1;

            string kh = MaKH.ToString();
            var don = dbcontext.ChiTietDonHangs.Where(s => s.KH == kh);

            return don;
        }


    }
}