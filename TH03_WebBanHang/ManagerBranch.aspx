﻿<%@ Page Title="Gmilk Tea" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ManagerBranch.aspx.cs" Inherits="TH03_WebBanHang.ManagerBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%> <p class="tenSP-ls-p">Danh Sách Chi Nhánh</p></h2>
            <style>
                .tenSP-ls-h3 {
                padding-bottom: 1.5rem;
                text-align: center;
                font-weight: bolder;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #CCBEB1;
                width: 100%;
            }

            .tenSP-ls-p {
                width: max-content;
                padding: 8px;
                margin: auto;
                border-bottom-color:#000 ;
                border:1px solid;
                border-top-style:none;
                border-left-style:none;
                border-right:none;
            }
			body{
				text-align:center;
				justify-content:center;
								

			}
			.btn-color:hover{
				color:#CCBEB1;
			}
			.td-longer{
				width:12rem;
				
			}
			
			.btn-w{
				width:6rem;
			}#linksContainer {
            display: none;
        }
			 td,tr,th{
				 
				 text-align:center;
			 }
			  td,tr{
	 
	 text-align:left;
 }
			 .ListView1{
				 display:flex;
				text-align:center;
				justify-content:center;
			 }
            </style>
	
	<asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiNhanh"
		SelectMethod="GetDeparments" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" class="text-center ListView1">
		<EmptyDataTemplate>
			<table>
				<tr>
					<td>No data was returned.</td>
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
			<td><%#:Item.MaCN%></td>
			<td><%#:Item.TenCN%></td>
			<td><%#:Item.DiaChiCN%></td>
			<td style="text-align:center;"><%#:Item.DonHangs.Count%></td>
			
			<td>
				<a class="btn btn-default btn-color btn-w" href="BrandOrder.aspx?Deptid=<%#:Item.MaCN%>">Chi Tiết</a>
				<%--<a class="btn btn-default btn-color btn-w" href="DeleteBranch.aspx?Deptid=<%#:Item.MaCN%>">Xóa</a>--%>
			</td>
		</ItemTemplate>
		<LayoutTemplate>
			<div class="d-flex justify-content-center align-content-center"><table class="table" id="groupPlaceholderContainer" runat="server" style="width: 60%">
				<thead>
					<tr>
						<th>Mã</th>
						<th>Khu Vực</th>
						<th>Địa Chỉ</th>
						<th>Đơn Nhận</th>
						
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr id="groupPlaceholder"></tr>
				</tbody>
			</table></div>
			
		</LayoutTemplate>
	</asp:ListView>
</asp:Content>
