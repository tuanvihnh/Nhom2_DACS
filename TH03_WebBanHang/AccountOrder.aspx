﻿<%@ Page Title="Gmilk Tea" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="AccountOrder.aspx.cs" Inherits="TH03_WebBanHang.AccountOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%>
        <p class="tenSP-ls-p">Đơn Hàng</p>
    </h2>
    <style>
        .tenSP-ls-h3 {
            padding-bottom: 1.5rem;
            text-align: center;
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #CCBEB1;
            width: 100%;
        }

        .tenSP-ls-p {
            width: max-content;
            padding: 8px;
            margin: auto;
            border-bottom-color: #000;
            border: 1px solid;
            border-top-style: none;
            border-left-style: none;
            border-right: none;
        }

        body {
            text-align: center;
            justify-content: center;
        }

        .btn-color:hover {
            color: #CCBEB1;
        }

        .td-longer {
            width: 12rem;
        }

        .btn-w {
            width: 6rem;
        }

        #linksContainer {
            display: none;
        }

        td, tr, th {
            
            text-align: center;
        }

        .ListView1 {
            display: flex;
            text-align: center;
            justify-content: center;
        }
    </style>

             
    <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang"
        SelectMethod="GetDeparments" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" class="text-center ListView1">
        <EmptyDataTemplate>
            <table style="text-align:center; margin:auto;">
                <tr style="text-align:center; margin:auto;">
                    <td>Chưa có đơn hàng</td>
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
            <%--						<td><%#:TH03_WebBanHang.Pay.kh%></td>--%>
            <td><%#:Item.MaCTDH%></td>


            <td class="td-longer"><%#:Item.Ngay%></td>
            <td class="td-longer" style="text-align:left;"><%#:Item.TenSP%></td>
            <td style="width:max-content;"><%#:Item.SoLuong%></td>
            <td><%# string.Format("{0:N0}", Item.Gia) %>đ</td>
            <td><%# string.Format("{0:N0}", Item.ThanhTien) %>đ</td>



            <td>
								<a class="btn btn-default btn-color btn-w" href="DetailOrder.aspx?Order=<%#:Item.MaDH%>&SP=<%#:Item.MaSP%>">Chi tiết</a>

                <%--<a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>--%>
<%--                <a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>--%>
            </td>
        </ItemTemplate>
        <LayoutTemplate><div class="d-flex justify-content-center align-content-center">
            <table class="table" id="groupPlaceholderContainer" runat="server" style="width: 80%;">
                <thead>
                    <tr>
                        <th>Mã Đơn</th>

                        <th>Thời Gian</th>
                        <th>Chi Tiết</th>
                        <th>Số Lượng</th>
                        <th>Giá</th>
                        <th>Thành Tiền</th>


                        <%--						<th>Mã Khách Hàng</th>--%>

                      <%--  <th></th>--%>
                    </tr>
                </thead>
                <tbody>
                    <tr id="groupPlaceholder"></tr>
                </tbody>
            </table></div>
        </LayoutTemplate>
    </asp:ListView>

</asp:Content>
