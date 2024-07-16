﻿<%@ Page Title="Gmilk Tea" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TH03_WebBanHang.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <%--   <h2><%: Title %>.</h2>--%>
    <%--<h2><img src="Content/logo/logo.png" id="img-logo"/><style>#img-logo{width:180px;}</style></h2>--%>
   
   
                 
     <h1 class="fw-bolder mb-4 tenSP-ls-h3"><p class="tenSP-ls-p">Thành Viên Thành Lập Gmilk Tea</p></h1>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .tenSP-ls-h3 {
            text-align: center;
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #CCBEB1;
          
        }

        .tenSP-ls-p {
            width: max-content;
            padding-bottom:1.5rem;
            margin: auto;
            padding-top:1rem;
            border-bottom-color: #000;
            border: 1px solid;
            border-top-style: none;
            border-left-style: none;
            border-right: none;
            
        }
        .shop_intro {
            text-align: center;
            margin-bottom: 50px;
            background-image: url('https://i.pinimg.com/originals/fd/e1/5b/fde15b91df9f9bcda0a5d00d6a3b1d48.jpg');
            background-size: cover;
            background-position: center;
            padding: 60px 20px;
            border-radius: 10px;
            color: #fff;
        }
        .shop_intro h2 {
           font-size: 32px;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            color : antiquewhite;
        }
        .shop_intro p {
           font-size: 18px;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
            color : antiquewhite;

        }
    </style>
   
<div class="container bg-grey">
        <div class="row justify-content-center">
        <div class="col-12">
            <div class="shop_intro">
                <h2>Chào mừng đến với cửa hàng của chúng tôi</h2>
                <p>
                    Tại cửa hàng của chúng tôi, chúng tôi cung cấp nhiều loại sản phẩm chất lượng cao để đáp ứng mọi nhu cầu của bạn. 
                    Nhóm của chúng tôi tận tâm cung cấp dịch vụ khách hàng xuất sắc và đảm bảo bạn có 
                    trải nghiệm mua sắm tốt nhất có thể. Duyệt qua lựa chọn của chúng tôi và khám phá 
                    mặt hàng hoàn hảo cho bạn. Cảm ơn vì đã chọn chúng tôi!
                </p>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-12 col-sm-8 col-lg-6">
            <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                <div class="line"></div>
            </div>
        </div>
    </div>
    <div class="row element show">
          <div class="col-12 col-sm-8 col-lg-6">
            <!-- Section Heading-->
            <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
               
              <div class="line"></div>
            </div>
          </div>
        </div>
        <div class="row element show">
             <div class="col-12 col-sm-6 col-lg-3 element show">
            <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
              <!-- Team Thumb-->
              <div class="advisor_thumb"><img src="https://i.pinimg.com/originals/0e/65/e7/0e65e7640340a16068734dd46468fb9f.png" alt="">
                <!-- Social Info-->
                <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
              </div>
              <!-- Team Details-->
              <div class="single_advisor_details_info">
                <h6>Huỳnh Tuấn Vĩ</h6>
                <p class="designation">2105CT0113</p>
              </div>
            </div>
          </div>
          <!-- Single Advisor-->
          <div class="col-12 col-sm-6 col-lg-3 element show">
            <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
              <!-- Team Thumb-->
              <div class="advisor_thumb"><img src="https://i.pinimg.com/736x/1d/e6/a8/1de6a87343236c698bd5e3bbc602a787.jpg" alt="">
                <!-- Social Info-->
                <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
              </div>
              <!-- Team Details-->
              <div class="single_advisor_details_info">
                <h6>Nguyễn Thành Đạt</h6>
                <p class="designation">2105CT0095</p>
              </div>
            </div>
          </div>
          <!-- Single Advisor-->
          <div class="col-12 col-sm-6 col-lg-3 element show">
            <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
              <!-- Team Thumb-->
              <div class="advisor_thumb"><img src="https://i.pinimg.com/736x/f5/1d/ee/f51dee402bd3594560a0e4639d35e733.jpg" alt="">
                <!-- Social Info-->
                <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
              </div>
              <!-- Team Details-->
              <div class="single_advisor_details_info">
                <h6>Trần Minh Tuấn Tú </h6>
                <p class="designation">2105CT0084</p>
              </div>
            </div>
          </div>
          <!-- Single Advisor-->     
        </div>
      </div>
    <style>
      

     .element {
  transform: translateY(100%);
  transition: transform 0.5s ease; /* Áp dụng hiệu ứng cho transform */
}

.element.show {
  transform: translateY(0); /* Dịch chuyển lên trên khi hiển thị */
}
.single_advisor_profile {
    position: relative;
    margin-bottom: 50px;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    z-index: 1;
    border-radius: 15px;
    -webkit-box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
    box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
}
.single_advisor_profile .advisor_thumb {
    position: relative;
    z-index: 1;
    border-radius: 15px 15px 0 0;
    margin: 0 auto;
    padding: 30px 30px 0 30px;
    background-color: #CCBEB1;
    overflow: hidden;
}
.single_advisor_profile .advisor_thumb::after {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: absolute;
    width: 150%;
    height: 80px;
    bottom: -45px;
    left: -25%;
    content: "";
    background-color: #ffffff;
    -webkit-transform: rotate(-15deg);
    transform: rotate(-15deg);
}
@media only screen and (max-width: 575px) {
    .single_advisor_profile .advisor_thumb::after {
        height: 160px;
        bottom: -90px;
    }
}
.single_advisor_profile .advisor_thumb .social-info {
    position: absolute;
    z-index: 1;
    width: 100%;
    bottom: 0;
    right: 30px;
    text-align: right;
}
.single_advisor_profile .advisor_thumb .social-info a {
    font-size: 14px;
    color: #020710;
    padding: 0 5px;
}
.single_advisor_profile .advisor_thumb .social-info a:hover,
.single_advisor_profile .advisor_thumb .social-info a:focus {
    color: #3f43fd;
}
.single_advisor_profile .advisor_thumb .social-info a:last-child {
    padding-right: 0;
}
.single_advisor_profile .single_advisor_details_info {
    position: relative;
    z-index: 1;
    padding: 30px;
    text-align: right;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    border-radius: 0 0 15px 15px;
    background-color: #ffffff;
}
.single_advisor_profile .single_advisor_details_info::after {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: absolute;
    z-index: 1;
    width: 50px;
    height: 3px;
    background-color: #725535;
    content: "";
    top: 12px;
    right: 30px;
}
.single_advisor_profile .single_advisor_details_info h6 {
    margin-bottom: 0.25rem;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
    .single_advisor_profile .single_advisor_details_info h6 {
        font-size: 14px;
    }
}
.single_advisor_profile .single_advisor_details_info p {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    margin-bottom: 0;
    font-size: 14px;
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
    .single_advisor_profile .single_advisor_details_info p {
        font-size: 12px;
    }
}
.single_advisor_profile:hover .advisor_thumb::after,
.single_advisor_profile:focus .advisor_thumb::after {
    background-color: #725535;
}
.single_advisor_profile:hover .advisor_thumb .social-info a,
.single_advisor_profile:focus .advisor_thumb .social-info a {
    color: #ffffff;
}
.single_advisor_profile:hover .advisor_thumb .social-info a:hover,
.single_advisor_profile:hover .advisor_thumb .social-info a:focus,
.single_advisor_profile:focus .advisor_thumb .social-info a:hover,
.single_advisor_profile:focus .advisor_thumb .social-info a:focus {
    color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info,
.single_advisor_profile:focus .single_advisor_details_info {
    background-color: #725535;
}
.single_advisor_profile:hover .single_advisor_details_info::after,
.single_advisor_profile:focus .single_advisor_details_info::after {
    background-color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info h6,
.single_advisor_profile:focus .single_advisor_details_info h6 {
    color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info p,
.single_advisor_profile:focus .single_advisor_details_info p {
    color: #ffffff;
}
.advisor_thumb {
  
   height:20rem;
}
.advisor_thumb img{
  border-start-end-radius:20px;
   max-width:100%;
   
}
.designation{
    font-size:xx-large;
    font-weight:bolder;
}
    </style>


</asp:Content>
