﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TH03_WebBanHang.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <%-- <h2><%: Title %>.</h2>
   <h3>Gmilk Tea</h3>
   <address>
       Hùng Vương, Số 736<br />
       Đường Nguyễn Trãi, Quận 5<br />
       <abbr title="Phone">Số Điện Thoại:</abbr>
       0389800308
   </address>

   <address>
       <strong>Hỗ Trợ:</strong>   <a href="mailto:Support@example.com">gmilktea@example.com</a><br />
       <strong>Tiếp Thị:</strong> <a href="mailto:Marketing@example.com">gmilktea@example.com</a>
   </address>--%>

   
    <meta name="robots" content="noindex, follow">
    <link href="Content/css/animate.css" rel="stylesheet" />
    <link href="Content/css/animsition.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/daterangepicker.css" rel="stylesheet" />
    <link href="Content/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/css/hamburgers.min.css" rel="stylesheet" />
    <link href="Content/css/icon-font.min.css" rel="stylesheet" />
    <link href="Content/css/main.css" rel="stylesheet" />
    <link href="Content/css/select2.min.css" rel="stylesheet" />
    <link href="Content/css/style.css" rel="stylesheet" />
    <link href="Content/css/util.css" rel="stylesheet" />
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
   
    border-bottom-color: #000;
    border: 1px solid;
    border-top-style: none;
    border-left-style: none;
    border-right: none;
}
.search-container{
    display:none;
}
#ddlBranches{
    display:none;
}
*{
   font-family: var(--bs-body-font-family) !important;
}
.footer-title{
    font-family: Baloo !important;
}
    </style>
    <div class="container-contact100" style="margin-top:1rem;">
        <div class="wrap-contact100" style="border-radius:20px;">
            <div class="contact100-form validate-form">
                <span class="contact100-form-title tenSP-ls-h3 tenSP-ls-p">Gửi Phản Hồi Cho Chúng Tôi

</span>
                <label class="label-input100" for="first-name">Họ tên của bạn *</label>
                <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Type first name">
                    <asp:TextBox ID="firstName" runat="server" CssClass="input100" placeholder="Họ"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Type last name">
                    <asp:TextBox ID="lastName" runat="server" CssClass="input100" placeholder="Tên"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <label class="label-input100" for="email">Email của bạn *</label>
                <div class="wrap-input100 validate-input" data-validate="Hãy nhập email hợp lệ: ex@abc.xyz">
                    <asp:TextBox ID="email" runat="server" CssClass="input100" placeholder="example@email.com"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <label class="label-input100" for="phone">Số điện thoại</label>
                <div class="wrap-input100">
                    <asp:TextBox ID="phone" runat="server" CssClass="input100" placeholder="+84 038 9800308"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <label class="label-input100" for="message">Lời nhắn *</label>
                <div class="wrap-input100 validate-input" data-validate="Message is required">
                    <asp:TextBox ID="message" runat="server" CssClass="input100" TextMode="MultiLine" placeholder="Nhập lời nhắn bạn muốn gửi cho chúng tôi"></asp:TextBox>
                    <span class="focus-input100"></span>
                </div>
                <div class="container-contact100-form-btn">
                    <asp:Button ID="btnSend" runat="server" Text="Gửi" CssClass="contact100-form-btn" OnClick="btnSend_Click" style="background-color:#CCBEB1; border-radius:20px" />
                </div>
            </div>
            <div class="contact100-more flex-col-c-m" style="background-image: url('Content/image-bg/img-shop.jpg');">
                <div class="flex-w size1 p-b-47">
                    <div class="txt1 p-r-25">
                        <img src="Content/icon/location.png"/>
<%--                        <span class="lnr lnr-map-marker"></span>--%>
                    </div>
                    <div class="flex-col size2">
                        <span class="txt1 p-b-20">
Địa Chỉ
</span><style>           .txt1 img {
               width:18px;
               margin-top:0.2rem;
               
           }
       </style>
                        <span class="txt2"  style="color:#CCBEB1;">
736, Đường Nguyễn Trãi, Quận 5, Hồ Chí Minh.
</span>
                    </div>
                </div>
                <div class="dis-flex size1 p-b-47">
                    <div class="txt1 p-r-25">
                                                <img src="Content/icon/phone-call.png"/>

<%--                        <span class="lnr lnr-phone-handset"></span>--%>
                    </div>
                    <div class="flex-col size2">
                        <span class="txt1 p-b-20">
Liên Hệ
</span>
                        <span class="txt3" style="color:#CCBEB1;">
+84 038 9800308
</span>
                    </div>
                </div>
                <div class="dis-flex size1 p-b-47">
                    <div class="txt1 p-r-25">
                                                <img src="Content/icon/mail.png"/>

<%--                        <span class="lnr lnr-envelope"></span>--%>
                    </div>
                    <div class="flex-col size2">
                        <span class="txt1 p-b-20">
Hỗ Trợ
</span>
                        <span class="txt3"  style="color:#CCBEB1;">shopBTS@gmail.com
<%--<a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="73101c1d0712100733160b121e031f165d101c1e">[email&#160;protected]</a>--%>
</span>
                    </div>
                </div>
                                <div class="dis-flex size1 p-b-47">
                    <div class="txt1 p-r-25">
                        <style>                            .icon-mxh {
                                width:36px !important;
                              
                            } a:hover, a:active {
     color: #CCBEB1 !important;
 }
                        </style>
                                                <img class="icon-mxh" src="Content/icon/facebook.png"/>
                        <img class="icon-mxh" style="  margin-left:1rem;" src="Content/icon/instagram.png"/>
<%--                        <span class="lnr lnr-phone-handset"></span>--%>
                    </div>
                    <%--<div class="flex-col size2">
                        <span class="txt1 p-b-20">
Liên Hệ
</span>
                        <span class="txt3" style="color:#CCBEB1;">
+84 038 9800308
</span>
                    </div>--%>
                </div>

            </div>
        </div>
    </div>
   <style>
       footer a{
           text-decoration:none;
           color:black;
       }
   </style>
</asp:Content>
