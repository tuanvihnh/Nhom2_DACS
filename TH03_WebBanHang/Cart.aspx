<%@ Page Title="Gmilk Tea" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TH03_WebBanHang.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Product section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center justify-content-center">
                <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang" SelectMethod="GetCart">


                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td style="text-align:center;"><%--No data was returned.--%>Giỏ hàng rỗng.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>

                        <td />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <tr class="cart-list">
                            <td><%#:Item.TenSP%></td>
                            <td>
                                <img style="width: 150px;" class="card-img-top h-100" src="<%#:Item.DuongDan%>" alt="..." /></td>
                            <td><%#:Item.SoLuong%></td>
                            <td><%# string.Format("{0:N0}", Item.Gia) %></td>
                            <td><%# string.Format("{0:N0}", Item.ThanhTien) %></td>
                            <!-- Add buttons for deleting and changing items -->
                            <td style=" width:max-content; text-align:center;">
                                <style>
                                    .btn-p-m{
                                        width:1.8rem;
                                        padding:0;
                                        background-color:#fff;
                                        border:none;
                                        border-radius:50%;
                                         margin:0 0.4rem;
                                        
                                    }
                                    .btn-p-m:hover{
  
                                        border:1px solid #000;
                                                                                background-color:#000;

    
}                                    .btn-p-m:active{
  
                                        border:1px solid #000;
                                        background-color:#000;
    
}
                                </style>
                                <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%#: Item.MaSP %>' OnClick="btnDelete_Click" CssClass="btn btn-danger btn-p-m" ImageUrl="~/Content/icon/minus.png" />

<asp:ImageButton ID="btnChange" runat="server" CommandArgument='<%#: Item.MaSP %>' OnClick="btnChange_Click" CssClass="btn btn-warning btn-p-m" ImageUrl="~/Content/icon/plus.png" />

                            </td>
                        </tr>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <table class="table table-bordered" id="groupPlaceholderContainer" runat="server" style="width: 100%">
                            <thead>
                                <tr class="cart-list">

                                    <th>Tên</th>
                                    <th>Ảnh</th>
                                    <th>Số Lượng</th>
                                    <th>Đơn Giá</th>
                                    <th>Thành Tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="groupPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                </asp:ListView>
                <div style="display:flex; gap:8rem; background-color:#CCBEB1; padding: 0; width:max-content; border-radius:20px; border:1px solid #808080; margin-top:1rem;" class="justify-content-center">
                <div style="padding:1rem;">
                    <style>                        
                        #tongtien {
                            border-top:none;
                            border-left:none;
                            border-right:none;
                            border-bottom:1px solid #000;
                        }
                    </style>
                    <div id="tongtien"> <b>Tổng tiền:</b>
                    <asp:Label ID="lbTongThanhToan" runat="server" Text="0"></asp:Label></div>
                   
                </div>
                <div>
                    <asp:Button ID="btnDathang" runat="server" Text="Đặt hàng" OnClick="btnDathang_Click" style="background:#e1dddd; border-radius:20px;  padding:1rem; outline-color:#fff0; border:1px solid #303030a0;"/>
                   <%-- <style>                        #btnDathang {
                            padding:10px;
                            border: 1px solid #ccc;
                            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                            b
                        }
                        #btnDathang {
            background-color:#CCBEB1;
        }
        #btnDathang:hover {
            background-color:#cbb39c;
            color:#636161;
        }
                    </style>--%>

                </div>
            </div></div>
        </div>
    </section>

</asp:Content>
