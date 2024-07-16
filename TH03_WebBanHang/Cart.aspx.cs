using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class Cart : System.Web.UI.Page
    {
        private QL_BTSEntities dbcontext = new QL_BTSEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //lbTongThanhToan.Text = "0";
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();
            lbTongThanhToan.Text = hepler.TongThanhTien(lstGioHang).ToString();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<TH03_WebBanHang.Models.ChiTietDonHang> GetCart()
        {
            Item item = new Item();
            // Lấy giở hàng
            IQueryable<ChiTietDonHang> lstGioHang2 = item.LayGioHang().AsQueryable();

            return lstGioHang2;

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Get the button that raised the event
            ImageButton btnDelete = (ImageButton)sender;
            // Get the CommandArgument, which should be the ID of the item to delete
            string itemId = btnDelete.CommandArgument;

            // Example: Delete the item from the cart
            // You'll need to replace this with your actual logic
            DeleteItemFromCart(itemId);

            // Optionally, refresh the ListView to reflect the changes
            ListView1.DataBind();
            // Update the total price label
            UpdateTotalPrice();
        }
        private void ItemFromCart(string itemId)
        {
            // Retrieve the cart from the session
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            if (lstGioHang != null)
            {
                // Find the item to update
                ChiTietDonHang itemToUpdate = lstGioHang.FirstOrDefault(item => item.MaSP == itemId);
                if (itemToUpdate != null)
                {
                    // Check if the item's quantity is greater than  1


                    // Decrease the quantity by  1
                    itemToUpdate.SoLuong++;



                    itemToUpdate.ThanhTien = itemToUpdate.SoLuong * itemToUpdate.Gia;

                    // Update the session with the new cart list
                    Session["GioHang"] = lstGioHang;

                    // Optionally, refresh the ListView to reflect the changes
                    ListView1.DataBind();
                    // Update the total price label
                    UpdateTotalPrice();
                }
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            ImageButton btnChange = (ImageButton)sender;
            // Get the CommandArgument, which should be the ID of the item to delete
            string itemId = btnChange.CommandArgument;
            ItemFromCart(itemId);
            // Optionally, refresh the ListView to reflect the changes
            ListView1.DataBind();
            // Update the total price label
            UpdateTotalPrice();
        }

        private void DeleteItemFromCart(string itemId)
        {
            // Retrieve the cart from the session
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            if (lstGioHang != null)
            {
                // Find the item to update
                ChiTietDonHang itemToUpdate = lstGioHang.FirstOrDefault(item => item.MaSP == itemId);
                if (itemToUpdate != null)
                {
                    // Check if the item's quantity is greater than  1
                    if (itemToUpdate.SoLuong > 1)
                    {
                        // Decrease the quantity by  1
                        itemToUpdate.SoLuong--;

                    }
                    else
                    {
                        // If the quantity is  1, remove the item from the cart
                        lstGioHang.Remove(itemToUpdate);
                    }
                    itemToUpdate.ThanhTien = itemToUpdate.SoLuong * itemToUpdate.Gia;

                    // Update the session with the new cart list
                    Session["GioHang"] = lstGioHang;

                    // Optionally, refresh the ListView to reflect the changes
                    ListView1.DataBind();
                    // Update the total price label
                    UpdateTotalPrice();
                }
            }
        }



        private void UpdateTotalPrice()
        {
            // Calculate the total price of items in the cart
            // This is just a placeholder method
            Hepler hepler = new Hepler();
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;

            lbTongThanhToan.Text = hepler.TongThanhTien(lstGioHang).ToString();

        }

        protected void btnDathang_Click(object sender, EventArgs e)
        {
            // Query the database for the user with the given username and password
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from kh in dbcontext.KhachHangs select kh;
            if (user.Any(p => (p.TrangThai == true && p.Email == SignIn.email)) && Session["GioHang"] != null)
            {
                Response.Redirect("Pay.aspx");

            }
            // Otherwise, display an error message

            else
            {
                Response.Redirect("SignIn.aspx");

            }
        }
    }
}