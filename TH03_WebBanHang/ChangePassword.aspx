<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="TH03_WebBanHang.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%>
    <p class="tenSP-ls-p">Đổi Mật Khẩu</p>
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

    body {
        text-align: center;
        justify-content: center;
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

    #div-content {
        text-align: center;
       
        width:100%;
       
    }
    .search-container{
        display:none;
    }
</style>
<div id="div-content" class="justify-content-center  align-content-center">
    
    <div style="display: inline-grid; width: max-content; text-align: center;">
        <asp:Label ID="lbEmail" runat="server" placeholder="Email" CssClass="input-field w-more" style="margin-bottom:0.5rem;"></asp:Label>
        <asp:TextBox ID="txtPasswordSignUp" runat="server" TextMode="Password" placeholder="Nhập mật khẩu mới" CssClass="input-field w-more"></asp:TextBox>
         <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" placeholder="Xác nhận mật khẩu" CssClass="input-field w-more"></asp:TextBox>

       
        <style>
            #ddlGT {
                padding: 8px !important;
                text-align: center !important;
                margin-bottom: 10px !important;
                border-radius: 5px !important;
            }

            #btChange {
                background-color: #CCBEB1;
            }


            .w-more {
                width: 100%;
                text-align: center;
                
            }

            .btn-more {
                width: max-content !important;
                padding: 0.5rem 2rem !important;
                background-color:#6361617c;
                

            }


            input[type="text"],
            input[type="password"] {
                width: 12rem;
                padding:5px 10px !important;
                margin-bottom: 10px;
                border-radius: 50px;
                border: 1px solid #ccc;
                box-sizing: border-box;
                margin-top:0.6rem;

            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #4CAF50;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

                input[type="submit"]:hover {
                    background-color: #45a049;
                }

            #btChange, .btn-more {
                background-color: #CCBEB1 !important;
            }

                #btChange:hover, .btn-more:hover {
                    background-color: #cbb39c !important;
                    color: #636161;
                }
        </style>
        
    </div>
</div>

<asp:Button ID="btChange" runat="server" Text="Xác Nhận" OnClick="btChange_Click" class="btn-more"  />
</asp:Content>
