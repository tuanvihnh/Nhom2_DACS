<%@ Page Title="Gmilk Tea" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="TH03_WebBanHang.Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMxSf9b3X6ZGtdlU8A6UPLbn+6dNq0v6Z4n7A9s" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMxSf9b3X6ZGtdlU8A6UPLbn+6dNq0v6Z4n7A9s" crossorigin="anonymous">

    <style>
        .notification {
            display: none;
            position: fixed;
            top: 15%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 0 50px;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

            .notification img {
                width: 70%;
            }
    </style>
     <script>
         function hideLSRating() {

             var ratingElement = document.getElementById('idRating');
             var divDetailProduct = document.getElementById('divDetailProduct');

             ratingElement.style.display = 'none';
             divDetailProduct.style.paddingBottom = '0';

             localStorage.setItem('ratingElementDisplay', 'none');
         };

     </script>
         <style>
             #idRating,#divDetailProduct{
                 transition:0.5s;

             }
            
         </style>
    <div id="notification" class="notification">
        <img src="Content/icon/Success.gif" alt="">
        <p>Thêm vào giỏ hàng thành công!</p>
    </div>
    <script>
        // JavaScript để hiển thị thông báo sau khi ấn nút
        document.addEventListener("DOMContentLoaded", function () {
            // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click
            const addToCartBtn = document.querySelector('.btn-gio');
            const notification = document.getElementById('notification');

            addToCartBtn.addEventListener('click', function () {
                // Hiển thị thông báo
                notification.style.display = 'flex';

                // Ẩn thông báo sau 2 giây
                setTimeout(function () {
                    notification.style.display = 'none';
                }, 2000);
            });
        });
    </script>
    
    <section class="py-0">
        <h1 style="text-align:center">Sản Phẩm</h1><br />
        <br />
        <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
            margin: 0;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            width: 80%;
            margin: 20px auto;
        }
        .grid-item {
            text-align: center;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .grid-item img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .grid-item p {
            padding: 5px;
            margin: 5px 0;
            font-size: 16px;
            color: #333;
        }
    </style>
<body>
    <div class="grid-container">
        <div class="grid-item">
            <img src="Content/image-banner/1.png" alt="Đầm">
            <p>Đầm</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/2.png" alt="Áo">
            <p>Áo</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/3.png" alt="Chân váy">
            <p>Chân váy</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/4.png" alt="Quần">
            <p>Quần</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/5.png" alt="Jumpsuit">
            <p>Jumpsuit</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/6.png" alt="Homewear">
            <p>Homewear</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/7.png" alt="Áo khoác">
            <p>Áo khoác</p>
        </div>
        <div class="grid-item">
            <img src="Content/image-banner/8.png" alt="Phụ kiện">
            <p>Phụ kiện</p>
        </div>
    </div>
</body>
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                
                <asp:FormView ID="productDetail" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetDetails" RenderOuterTable="false" OnPageIndexChanging="productDetail_PageIndexChanging">
                    <ItemTemplate>
                        <div class="col-md-6" id="slSP">
                            <img class="card-img-top mb-5 mb-md-0" src="<%#:Item.DuongDan%>" alt="..." />

                        </div>
                        <div class="col-md-6">
                            <div class="small mb-1"></div>
                            <h1 class="display-5 fw-bolder"><%#:Item.TenSP%></h1>
                            <div class="fs-5 mb-5">
                                <span class="<%--text-decoration-line-through--%>"><%# string.Format("{0:N0}", Item.Gia) %>đ</span>
                                <%--<asp:Label ID="lbPrice" runat="server" Text='<%# string.Format("{0:N0}", Item.Gia) %>đ' />--%>

                                <%--                                <span>$40.00</span>--%>
                            </div>
                            <p class="lead"><%#:Item.MoTa%></p>
                            <style>
                              .btn-size {
        padding: 0.75rem 1.5rem;
        border: none;
        color: #fff;
        font-size: 1rem;
        font-weight: bold;
        text-transform: uppercase;
        cursor: pointer;
        outline: none;
        transition: all 0.3s;
        border-radius: 1rem;
    }

    .btn-size:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .btn-size-m {
        background: linear-gradient(135deg, #4bcffa, #cfd9df);
    }

    .btn-size-l {
        background: linear-gradient(135deg, #7f8fa6, #a6b1e1);
    }

    .btn-size-xl {
        background: linear-gradient(135deg, #f093fb, #f5576c);
    }
                            </style>
                            


                            <div id="size" style="gap: 1rem; margin: 1rem 0;">
    
                                <asp:Button ID="btnSizeM" runat="server" Text="M" OnClick="SizeM_Click" class="btn-size btn-size-m" />
                                <asp:Button ID="btnSizeL" runat="server" Text="L" OnClick="SizeL_Click" class="btn-size btn-size-l" />
                                <asp:Button ID="btnSizeX" runat="server" Text="X" OnClick="SizeX_Click" class="btn-size btn-size-x" />
                            </div>
                            
                            <!--thêm-->
                            <p><b>Colors : </b></p>
                            <ul id="colors" style="display: flex; gap: 1rem; padding: 0; list-style: none;">
                                 <li style="background-color: #bfb1a4; width: 2rem; height: 2rem; border-radius: 50%; cursor: pointer;" class="active"></li>
                                 <li style="background-color: #9c2f46; width: 2rem; height: 2rem; border-radius: 50%; cursor: pointer;"></li>
                                 <li style="background-color: #000000; width: 2rem; height: 2rem; border-radius: 50%; cursor: pointer;"></li>
                            </ul>

                            <div class="d-flex" style="gap: 1rem;">
                                <asp:Button ID="BuyNow" runat="server" Text="Mua Ngay" OnClick="BuyNow_Click" class="btn btn-outline-dark flex-shrink-0 btn-mua-ngay" />

                                <asp:ImageButton ID="Button1" runat="server" Style="width: 3.5rem;" OnClick="AddToCart_Click" class="btn btn-outline-dark flex-shrink-0 btn-gio" ImageUrl="~/Content/icon/add-cart.png" />

                                <i class="bi-cart-fill me-1"></i>
                            </div>
                            <p class="note" style="color: #777; font-size: 0.9rem; margin-top: 1rem; font-size: 20px">
                Lưu ý: Sản phẩm có thể có sự khác biệt về màu sắc so với hình ảnh do ánh sáng và màn hình hiển thị.
            </p>
               <style>
    .social-buttons {
        display: flex;
        gap: 10px;
    }

    .social-icon {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #007bff; /* Màu sắc của nút, thay đổi tùy ý */
        color: white;
        font-size: 20px;
        transition: background-color 0.3s, color 0.3s, opacity 0.3s;
        text-decoration: none;
    }

    .social-icon:hover {
        background-color: #0056b3; /* Màu sắc khi hover, thay đổi tùy ý */
    }

    .fab {
        font-size: 24px;
    }
</style>
    <div class="social-buttons" style="margin-top: 1rem;">
     <p style="font-size:20px;"><b>chia sẻ :</b></p><div class="social-buttons" style="margin-top: 1rem;">
    <a href="https://www.facebook.com/your-page-url" target="_blank" class="social-icon">
        <i class="fab fa-facebook"></i>
    </a>
    <a href="https://twitter.com/your-page-url" target="_blank" class="social-icon">
        <i class="fab fa-twitter"></i>
    </a>
    <a href="https://www.pinterest.com/your-page-url" target="_blank" class="social-icon">
        <i class="fab fa-pinterest"></i>
    </a>
 </div>
        </div>
                
                            <style>
                                .frame {
        border: 2px solid #000;
        padding: 20px;
        width: 900px;
        height: 300px;
        margin: 20px;
    }
  .icon-container {

            padding: 20px; /* Padding around the container */
            border-radius: 10px; /* Optional: Rounded corners */
            display: flex;
            margin-top: 20px; /* Space above the icon container */
        }

        .icon-section {
            display: flex;
            justify-content: center; /* Center the columns horizontally */
            gap: 20px; /* Adjust the gap between columns as needed */
        }

        .icon-column {
            display: flex;
            flex-direction: column;
            gap: 10px; /* Space between items in a column */
        }

        .icon-item {
            display: flex;
            align-items: center; /* Center items vertically */
            gap: 10px; /* Space between the icon and text */
            padding: 10px; /* Add padding for more space inside each item */
            white-space: nowrap; /* Prevent text from wrapping to the next line */
        }

        .icon-item img {
            width: 30px; /* Fixed width for the images */
            height: 30px; /* Fixed height for the images */
        }

        .icon-item p, .icon-item span {
            margin: 0; /* Remove default margins */
            display: inline-block; /* Ensure text is inline */
            white-space: nowrap;
        }
                            </style>
<div class="frame">
<div class="icon-container">
        <div class="icon-section">
            <div class="icon-column">
                <div class="icon-item">
                    <img src="Content/icon/fast_delivery_icon.png" alt="Giao hàng nhanh">
                    <div>
                        <p>Giao hàng nhanh</p><br />
                        <p>Từ 2 - 5 ngày</p>
                    </div>
                </div>
                <div class="icon-item">
                    <img src="Content/icon/free_shipping_icon.png" alt="Miễn phí vận chuyển">
                    <div>
                        <p>Miễn phí vận chuyển</p><br />
                        <p>Đơn hàng từ 399K</p>
                    </div>
                </div>
            </div>
            <div class="icon-column">
                <div class="icon-item">
                    <img src="Content/icon/order_tracking_icon.png" alt="Theo dõi đơn hàng">
                    <div>
                        <p>Theo dõi đơn hàng</p><br />
                        <p>Một cách dễ dàng</p>
                    </div>
                </div>
                <div class="icon-item">
                    <img src="Content/icon/flexible_return_icon.png" alt="Đổi trả linh hoạt">
                    <div>
                        <p>Đổi trả linh hoạt</p><br />
                        <p>sản phẩm không áp dụng khuyến mãi</p>
                    </div>
                </div>
            </div>
            <div class="icon-column">
                <div class="icon-item">
                    <img src="Content/icon/easy_payment_icon.png" alt="Thanh toán dễ dàng">
                    <div>
                        <p>Thanh toán dễ dàng</p><br />
                        <p>Nhiều hình thức</p>
                    </div>
                </div>
                <div class="icon-item">
                    <img src="Content/icon/support_hotline_icon.png" alt="Hotline hỗ trợ">
                    <div>
                        <p>Hotline hỗ trợ</p><br />
                        <p>039 9999 365</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>                     
                        </div>



                    </ItemTemplate>
                </asp:FormView>
                                     <script>
                                         function changeMainImage(src) {
                                             document.querySelector('.card-img-top').src = src;

                                         }
 </script>     
                                <div class="div-bottom-product-content <%--d-flex--%> py-1" style="margin:0.5rem; gap:20px; margin-bottom:2rem; flex-wrap:wrap;">
                                <asp:ListView ID="lvImages" runat="server" ItemType="TH03_WebBanHang.Models.SanPhamData" SelectMethod="GetImages">
    <ItemTemplate>
        <div class="d-grid" style="width:100%;">
        <div id="listImageDetailt" class="div-bottom-product-content" style=" gap:20px; flex-wrap:wrap;">
       <img src="<%#:Item.DuongDan1%>" class='product-image' onclick='changeMainImage(this.src)' />
       <img src="<%#:Item.DuongDan2%> " class='product-image' onclick='changeMainImage(this.src)' />
       <img src="<%#:Item.DuongDan3%>" class='product-image' onclick='changeMainImage(this.src)' />
       <img src="<%#:Item.DuongDan4%>" class='product-image' onclick='changeMainImage(this.src)' />
       <img src="<%#:Item.DuongDan5%>" class='product-image' onclick='changeMainImage(this.src)' />
        <%--<%# IfNotNullOrEmpty(Item.DuongDan6, "<img src='" + Item.DuongDan6 + "' class='product-image' onclick='changeMainImage(this.src)' />") %>--%>

                <div style="text-align:center; justify-content:center;">
           <script type="text/javascript">
               function toggleAdditionalContent() {
                   var additionalContent = document.getElementById('divNoiDung');

                   if (additionalContent.style.display === "grid") {
                       additionalContent.style.display = "none";
                       document.getElementById('btnViewMore').innerHTML = 'Xem nội dung bên trong sản phẩm';


                   } else {
                       additionalContent.style.display = "grid";
                       document.getElementById('btnViewMore').innerHTML = 'Ẩn bớt nội dung bên trong sản phẩm';

                   }
               }

               function closeAdditionalContent() {
                   document.getElementById('additionalContent').style.display = "none";

               }

           </script>

            <style>
                .img-close-ViewMore {
                    width: 24px;
                }

                #additionalContent {
                    border: 1px solid #ccc;
                    padding: 20px;
                    background: linear-gradient(to right, #522A77, #2a2e77);
                    width: 60%; /* Adjust the width as needed */
                    height: 600px;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    margin: auto;
                    border-radius: 10px;
                    z-index: 1000;
                }

                .product-image-AnhNote {
                    width: 100%;
                    height: 100%;
                    padding-bottom: 1rem;
                }

                #overlay {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5); /* Black background with 50% opacity */
                    z-index: 9999; /* Ensure it's above other content */
                }
                #divNoiDung{
                    display:none;
                }
            </style>
                   



        </div>
           
 </div>
            <style>
                #btnViewMore{display:none; }
                #btnViewMore:hover,#toggleRating:hover{
                    color:#000;
                    box-shadow:0 0 50px #636363;
                   
                }

            </style> 

                             <div class="" id="divNoiDung" style=" margin-top:-6.2rem; padding-right:16px;">
                                <div id="divNoteContentText" style="justify-content:center; text-align:center; justify-items:center; font-size:14px">
                                </div>
                                 <div  style="justify-content:right; text-align:right; justify-items:right; display:grid;">
                                     <p id="lbNoiDung" style=" text-align:center; justify-content:right;float:right; justify-items:right;">Nội dung bên trong sản phẩm</p>
                                     
<style>@media only screen and  (min-width: 768px) {\r\n    #divSL{top:25.35rem !important;}} @media only screen and  (max-width: 768px) { #divSL{bottom:19.438rem !important;height:43px !important;}}  #btnViewMore{display:block;}</style> <img title="Ảnh minh họa" loading='lazy' id='anhNote'  src="<%#:Item.AnhNote%>" style=' height:auto; border-radius:10px;' class='fade-in' onclick='changeMainImage(this.src)' />



</div>
 </div></div></div>
    </ItemTemplate>

</asp:ListView> </div></div>
        
        

                        <div id="idRating" class="flex-column flex-md-row fade-out" style="padding:10px; background: linear-gradient(to right, #522A77 //#3468A0, #2a2e77); border-radius:10px;  height:max-content; margin:auto;  margin:1rem auto; gap:1rem;">
                                        <asp:HiddenField ID="ratingValue" runat="server" />
                    <script>



                        window.onload = function () {
                            selectStar(5);
                        };
                    </script>

                   
                  <script>
                      function selectStar(starNumber) {
                          // Loại bỏ class 'selected' từ tất cả các ngôi sao
                          var stars = document.getElementsByClassName('star');
                          for (var i = 0; i < stars.length; i++) {
                              stars[i].classList.remove('selected');
                          }

                          // Thêm class 'selected' vào tất cả các ngôi sao trước đó
                          for (var i = 1; i <= starNumber; i++) {
                              document.getElementById('star' + i).classList.add('selected');
                          }


                          // Lưu giá trị đánh giá được chọn vào một hidden field để lấy từ code-behind
                          document.getElementById('<%= ratingValue.ClientID %>').value = starNumber;
                      }
                  </script>

                    <style>
    #ratingDiv th, #ratingDiv tr,  #ratingDiv td {
        border: none !important;
    }
    .star.hover {
    color: #ffc107; /* Màu vàng khi di chuột qua */
   
}
    .star:hover{
    
    }

</style>

                    <script>
                        function hoverStar(starNumber) {
                            // Loại bỏ class 'hover' từ tất cả các ngôi sao
                            var stars = document.getElementsByClassName('star');
                            for (var i = 0; i < stars.length; i++) {
                                stars[i].classList.remove('hover');
                            }
                            // Thêm class 'hover' vào tất cả các ngôi sao trước đó
                            for (var i = 1; i <= starNumber; i++) {
                                document.getElementById('star' + i).classList.add('hover');
                            }
                        }
                        function removeHover() {
                            // Loại bỏ class 'hover' từ tất cả các ngôi sao

                            var stars = document.getElementsByClassName('star');
                            for (var i = 0; i < stars.length; i++) {
                                stars[i].classList.remove('hover');
                            }
                        }
                    </script>
                    
                    
                    <style>       
                        *{
                            scroll-behavior: smooth;
                        }
                        .div-DG::-webkit-scrollbar-thumb {
                             border-radius: 30px;
                        }
                        .div-DG::-webkit-scrollbar-track {
    
                                  border-radius: 20px;                             background:#00000040;

                                
}
                        .div-DG::-webkit-scrollbar {
                          
                            
  
}
                      
                        @media (max-width: 768px) {
                             #idRating{
                                 width:468px;
     
                             }
                            #lbNoiDung,
                             #anhNote{
                                 width:100%;
                             }
                            #DGshow{
                                 
                            }

                            #listImageDetailt{
                                position:absolute ;
                                bottom:7.5rem;
                                max-width:428px;
                                overflow:hidden;
                                flex-wrap:wrap;
                                
                                


                            }
                            #DGshow{
    max-height:100vh;  min-height:0;  padding:30px 15px  5px 15px;
}
                            #divVer{
                                margin:16rem 0 18rem 0 !important;
                            }
                             #divSL{
                             position:absolute;
                             bottom:29rem;
                             right:8.5rem;
                         }
                           /* .toggleRating{
                                left:4.65rem; top:24.35rem;
                            }*/
                            #navLSMenu{
    padding:0px 10px; 
}
                            .div-DG{
                                padding-right:10px;
                            }
                           
    .DG {
    height:20vh !important;   
    width:100%;
}
    .showRating{
        bottom:10.5rem; left:-15rem; border-top-right-radius:20px; border-top-left-radius:20px;font-size:20px;
    }
    .cmtProfile-Non-Login{
        display:flex;
    }
    #divDetailProduct{
     padding-right:0;
}
     .div-bottom-product-content{
     display:flex;
    
    
     
 }
      .widget-container{
           right:3.25rem; 
      }
       #ratingDiv2{
     display:grid;
 }
       .comment-item{
    width:20rem;
}
       .div-Ver{
           
          /*width:50%;*/
       }
         #divSLandBtnShowRadting{
      margin-top:-10rem;
      margin-left:3rem;
      
  }

         .divSLandbtnDGShow{
    display:flex;
   margin-left:1rem;
   
    
}
         #divBtnShowDG{
             margin-top:-1rem;
             justify-content:center;
             align-content:center;
             margin-left:1rem;
         }
               .image-container, .video-container {
    width: 60px;
    
}

     #divUserComentShow{
     width:100%;
    
 }

}

                         @media (max-height: 538px){

                             .showRating{
                               display:none;
                            }
                             .divSLandbtnDGShow{
                                display:none;
                            }
                             .widget-container{
                                 top:7.5rem;
                                right:2.5rem; 
                            }
                             
                         }
                                                @media (min-width: 768px) {
                                                    #idRating{
                                                        width:1223px;
                                                        
                                                    }
                                                    #lbNoiDung,
                                                    #anhNote{
                                                        width:585px;
                                                    }
                                                    #divButtonMuaGioDG{
                                                        margin-bottom:-8rem !important;
                                                        margin-top:8rem !important;
                                                        
                                                    }
                                                    #DGshow{
                                                        max-height:74vh;  min-height:0vh;  padding:30px 15px  5px 15px;
                                                    }
                                                    #divVer{
                                                        margin-top:8rem !important;
                                                    }
                                                    #divSL{
                                                        position:absolute;
                                                        top:21rem;
                                                        right:39.15rem;
                                                    }
                                                    /*.toggleRating{
                                                        left:31.5rem; top:12.55rem;
                                                    }*/
                                                    #navLSMenu{
                                                        padding:5px 10px; 
                                                    }
                                                    .DG{
                                                         width:100%;
                                                    }
   
    .showRating{
        top:5rem; left:-10rem;   border-top-left-radius:20px; border-top-right-radius:20px;height:max-content;font-size:24px;
    }
    .cmtProfile-Non-Login{
        display:flex;
    }
    #divDetailProduct{
         /*padding-bottom:12rem;*//* padding-right:1rem;*/
    }
    .div-bottom-product-content{
        display:flex;
    }
     .widget-container{
         right:2.5rem; 
     }
     #ratingDiv2{
         display:flex;
         gap:1rem;
     }
     .comment-item{
         width:40rem;
     }
     #divSLandBtnShowRadting{
        margin-top:0.5rem;
     }
     .divSLandbtnDGShow{
         display:grid;
         margin-left:0.35rem;
     }
      #divBtnShowDG{
     margin-top:2.5rem;
 }
      .image-container, .video-container {
    width: 80px; 
    
}
      #divUserComentShow{
          width:max-content;
      }
      .product-detail-Img{
          width:596px;
      }


}
                                                
                    </style>
                    <style>
    select option {
        color: black;
    }
</style>



                    
                                <%--<script>
                                    document.getElementById('showAllRatingButton').addEventListener('click', function () {
                                        // Lấy phần tử có class 'DG'
                                        var dgElement = document.getElementById('DGshow');
                                        if (dgElement) {
                                            // Thay đổi max-height thành 100%
                                            dgElement.style.maxHeight = '100%';
                                        }
                                    });
                                </script>--%>
                                            <style>
                                                #DGshow, #idRating{
                                                    display:none;
                                                }
                                            </style>

                <div id="DGshow" class="col-12 col-md-6 fade-out DG" style="background-color:#ffffff2e;border-top-left-radius:10px; border-top-right-radius:10px;  /* height:max-content;*/ /*max-height:100%;*/    /*border-bottom-left-radius: 20px; border-bottom-right-radius:20px; */">
                   <asp:Label ID="lblMostRatedStar" Visible="false" runat="server" CssClass="showRating justify-content-center align-content-center" style="width:100px; background:#6d3e99;  color:#ffc107; position:absolute;border-bottom-right-radius:5px; border-bottom-left-radius:5px;   box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);  padding: 10px;letter-spacing: 3px;   "></asp:Label></div>

                    <asp:DropDownList ID="ddlRatingFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRatingFilter_SelectedIndexChanged" style="width: max-content; color:#fff;   border:none; position:absolute; right:25px; margin-top:5px; background:#0000; text-align:left; padding-left:1rem;">
                  
    <asp:ListItem ID="lsItemRatingAll" Value="0"></asp:ListItem>
    <asp:ListItem ID="lsItemRating1" Value="1"></asp:ListItem>
    <asp:ListItem ID="lsItemRating2" Value="2"></asp:ListItem>
    <asp:ListItem ID="lsItemRating3" Value="3"></asp:ListItem>
    <asp:ListItem ID="lsItemRating4" Value="4"></asp:ListItem>
    <asp:ListItem ID="lsItemRating5" Value="5"></asp:ListItem>
</asp:DropDownList>


                                        <div style="overflow:auto;" class="div-DG">
                                        <asp:ListView ID="ListViewComments" runat="server">
    <LayoutTemplate>
        <div runat="server" id="itemPlaceholder"></div>
    </LayoutTemplate>
    <ItemTemplate>

        <div class="grid" id="divUserComentShow" style="background:#fff; flex-wrap:wrap; border-radius:10px; height:max-content;  margin:0.5rem 0;">
            <div class="divClientCMT" style="background:#fff; flex-wrap:wrap;  border:1px solid #63636e7c; border-radius:10px; padding:15px 25px 0px 15px;">
        <div class="d-flex" style="gap:10px;">
           
            <img id="avatarCMT" src="<%# Eval("AvatarUser") %>"  style="object-fit:cover; background:#000; width:45px; height:45px; border-radius:50%; border:2px solid #9b51e0" class=""/>
               <div class="d-grid justify-content-center align-content-center" style="height:max-content;"> 
                     
               <div class="d-flex" style="flex-wrap:wrap; gap:5px; padding: 0;  margin-bottom:-1rem;">                  
              <p style=""><strong  style="color:#000; font-size:16px; "><%# Eval("TenKH") %> </strong></p>    
         <p>    <strong style="color:#000;">(</strong><strong style="width:16px; color:#ffc107;"><%# Eval("RatingValue").ToString() %></strong><span  ClientIDMode="Static" style="width:16px; color:#ffc107;">★</span><strong style="color:#000;">)</strong></p>
    </div><p  style="color:#000; flex-wrap:wrap; overflow:hidden; width:100%; font-size:16px;"><%# Eval("NoiDung") %></p> 
                 
               </div>
                         
</div>
      

                <div class="d-flex" style="width:100%; flex-wrap:wrap; gap:10px; padding:5px 0px 10px 10px; margin-top:5px;">
    <%# IfNotNullOrEmpty(Eval("Anh1"), "<div class='image-container'><a href='" + Eval("Anh1") + "' target='_blank'><img src='" + Eval("Anh1") + "' class='rating-image fade-out' /></a></div>") %>
    <%# IfNotNullOrEmpty(Eval("Anh2"), "<div class='image-container'><a href='" + Eval("Anh2") + "' target='_blank'><img src='" + Eval("Anh2") + "' class='rating-image fade-out' /></a></div>") %>
    <%# IfNotNullOrEmpty(Eval("Anh3"), "<div class='image-container'><a href='" + Eval("Anh3") + "' target='_blank'><img src='" + Eval("Anh3") + "' class='rating-image fade-out' /></a></div>") %>
    <%# IfNotNullOrEmpty(Eval("Anh4"), "<div class='image-container'><a href='" + Eval("Anh4") + "' target='_blank'><img src='" + Eval("Anh4") + "' class='rating-image fade-out' /></a></div>") %>
    <%# IfNotNullOrEmpty(Eval("Anh5"), "<div class='image-container'><a href='" + Eval("Anh5") + "' target='_blank'><img src='" + Eval("Anh5") + "' class='rating-image fade-out' /></a></div>") %>

    <%# IfNotNullOrEmpty(Eval("Video"), "<div class='video-container'><a href='" + Eval("Video") + "' target='_blank'><video src='" + Eval("Video") + "' class='rating-video fade-out' /></a></div>") %>

    <style>
        .image-container, .video-container {
            height: max-content; /* Kích thước cố định cho container */
            overflow: hidden; /* Ẩn phần của hình ảnh và video không vừa với container */
                    transition:0.5s;
                    border-radius:10px;

        }
        .rating-image, .rating-video {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Hoặc sử dụng 'contain' nếu muốn hình ảnh và video luôn hiển thị toàn bộ nội dung */
            border-radius:10px;
            transition:0.5s;

        }

        .image-container:hover, .video-container:hover {
             transform:scale(1.1);
             /*transform:translate(0,-10px);*/
            box-shadow:0 10px 50px #636363;
        }

        @media (max-width: 600px) {
            .image-container, .video-container {
                width: 60px; /* Giảm kích thước cho các thiết bị nhỏ hơn */
            }
        }
    </style>
</div>



  <div class="d-flex" style=" text-align:left;">
                        <p><small style="font-size:12px; color:#000;"><%# Eval("NgayDG") %></small></p>
<%--            <asp:Button ID="btnToggleLike" runat="server" OnClick="btnToggleLike_Click" CommandArgument='<%# Eval("MaDG") %>' />--%>


        </div></div>



        </div>
    </ItemTemplate>
</asp:ListView></div></div>
        
                                            <div style="text-align:center;">
                                                   <div class="d-grid" style="width:100%; gap:1rem;">
                                                       
                        <asp:FormView ID="ratingForm" runat="server" DefaultMode="Insert" Visible="false">
                                              <InsertItemTemplate>
                                           <div  class="justify-content-center align-content-center text-center">      
         <span class="star" id="star1" ClientIDMode="Static" onclick="selectStar(1)" onmouseover="hoverStar(1)" onmouseout="removeHover()">★</span>
         <span class="star" id="star2" ClientIDMode="Static" onclick="selectStar(2)" onmouseover="hoverStar(2)" onmouseout="removeHover()">★</span>
         <span class="star" id="star3" ClientIDMode="Static" onclick="selectStar(3)" onmouseover="hoverStar(3)" onmouseout="removeHover()">★</span>
         <span class="star" id="star4" ClientIDMode="Static" onclick="selectStar(4)" onmouseover="hoverStar(4)" onmouseout="removeHover()">★</span>
         <span class="star" id="star5" ClientIDMode="Static" onclick="selectStar(5)" onmouseover="hoverStar(5)" onmouseout="removeHover()">★</span></div>

                                              </InsertItemTemplate>
     </asp:FormView>
<asp:TextBox ID="txtComment" placeholder="Mời bạn chia sẻ thêm cảm nhận..." spellcheck="false" type="text" runat="server" TextMode="MultiLine" Rows="4" Columns="50"  Visible="false" CssClass="fa-comment comment-item" style=" width:100%; padding:10px; "></asp:TextBox>
                        
                            
                                

                                        <style>
                .custom-file-upload {
                    display: none !important;
                }
                .custom-file-label {
                    padding: .375rem .75rem;
                    font-size: 0.8rem;
                    line-height: 1.5;
                    color: #495057;
                    background-color: #ffffff00;
                    border: 1px solid #ced4da;
                    border-radius: .25rem;
                    cursor: pointer;
                    height:max-content;
                }
            </style>
           
            

            <style>
                .btn-comment,.custom-file-label{
                    transition:0.5s;
                    background: #fff;
                    color:#000;
                    width:max-content;
                    
                }
                .custom-file-label i{
                    color:#000;
                }
                .btn-comment:hover,.custom-file-label:hover{
                    
                    box-shadow:0 10px 50px #636363;
                }
                .custom-file-label:hover{
                     color:#fff;
                    background:#522A77;
                }
                .custom-file-label:hover i{
                     color:#fff;
                    
                }
            </style>
                          
             
                                <style>



                        .comment-item{
                            border-radius:10px;
                           
                          
                            color:#000;
                        }
                        .btn-comment{
                            
                            border-radius:10px;
                           
                          
                            
                            color:#fff;
                           

                           
                        }
                          .btn-comment:hover{
                                
                                
                              background: #464baa;
                        }
                          .star {
    font-size: 44px;
    color: #ccc; /* Màu sáng khi chưa chọn */
    cursor: pointer;
    transition:0.2s;
   
}

.star.selected {
    color: #ffc107; 
}


                    </style>
                            </div>
                                                       <div class="d-flex justify-content-center align-content-center text-center" style="gap:1rem; margin:1rem auto; text-align:center;">
    <asp:FileUpload ID="fileUploadImages" runat="server" AllowMultiple="true" CssClass="custom-file-upload" ClientIDMode="Static" onchange="previewImages(this)" />
    <label for="<%= fileUploadImages.ClientID %>" class="custom-file-label"><i class="fas fa-camera"></i> Gửi ảnh thực tế</label>

    <asp:FileUpload ID="fileUploadVideo" runat="server" CssClass="custom-file-upload" ClientIDMode="Static"  onchange="previewVideo(this)" />
    <label for="<%= fileUploadVideo.ClientID %>" class="custom-file-label" style=""><i class="fas fa-video"></i> Gửi video thực tế</label>
    <style>
        .custom-file-label{
            display:none;
        }
    </style>
                        

                             
                       
                        <script>
                            function previewImages(fileInput) {
                                const previewContainer = document.getElementById('imagePreviewContainer');
                                previewContainer.innerHTML = ''; // Clear previous images
                                if (fileInput.files) {
                                    for (let i = 0; i < fileInput.files.length; i++) {
                                        const file = fileInput.files[i];
                                        const img = document.createElement('img');
                                        img.src = URL.createObjectURL(file);
                                        img.style.width = '80px';
                                        img.style.height = '80px';
                                        img.style.borderRadius = '10px';
                                        img.style.objectFit = 'cover';
                                        img.style.marginRight = '10px';
                                        previewContainer.appendChild(img);
                                    }
                                }
                            }

                            function previewVideo(fileInput) {
                                const previewContainer = document.getElementById('videoPreviewContainer');
                                previewContainer.innerHTML = ''; // Clear previous videos
                                if (fileInput.files) {
                                    for (let i = 0; i < fileInput.files.length; i++) {
                                        const file = fileInput.files[i];
                                        const video = document.createElement('video');
                                        video.src = URL.createObjectURL(file);
                                        video.style.width = '80px';
                                        video.style.height = '80px';
                                        video.style.objectFit = 'cover';
                                        video.style.borderRadius = '10px';
                                        video.style.marginRight = '10px';
                                        video.controls = true; // Add controls to the video
                                        previewContainer.appendChild(video);
                                    }
                                }
                            }
                        </script>
                       
</div>
                                <div class="d-flex justify-content-center align-content-center text-center">
                               <div class="image-preview"id="imagePreviewContainer"></div>
                                <div class="video-preview" id="videoPreviewContainer"></div></div>
                            <style>                                .lb-add-pr-cmt {
                                    width:max-content;
                                  color:#fff !important;
                                    
                                }
                            </style>
                               <div class="d-flex justify-content-center align-content-center text-center" style="gap:1rem; margin-top:1rem;">
                            <asp:TextBox ID="txtHoTen" placeholder="Họ Tên (bắt buộc)" type="text" runat="server" Visible="false" style="color:#000;border-radius:10px; border:1px solid #000; width:12rem; padding:5px;"></asp:TextBox>

                            <asp:TextBox ID="txtDienThoai" placeholder="Số điện thoại (bắt buộc)"  runat="server"  Visible="false" style="color:#000; border-radius:10px;  border:1px solid #000;  width:12rem; padding:5px;"></asp:TextBox>

<asp:TextBox ID="txtEmail" placeholder="Địa chỉ Email (bắt buộc)" type="email" runat="server"  Visible="false" style="color:#000; border-radius:10px;  border:1px solid #000;  width:12rem; padding:5px;"></asp:TextBox>

                      </div>               
                   <asp:Button  ID="btnSubmitComment" runat="server" Text="Gửi đánh giá"  OnClick="btnSubmitComment_Click"  Visible="false"  CssClass="btn-comment justify-content-center align-content-center" style="padding:8px; border-radius:10px; background:#464baa; border:none; margin:1rem auto;" class="justify-content-center align-content-center text-center"/>

                                        
                                        </div>
        
        
        <style>
            .product-image-AnhNote {
                width: 100%;
                height: 100%;
                padding-bottom: 1rem;
            }
        </style>
        <style>
     .product-image {
         max-width: 100px;
         height: auto;
         cursor: pointer;
         border-radius: 10px;
     }
     .nav-link{
         color:#000
     }
 </style>
        
    </section>


    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5 mt-5">
                    <nav id="navLSMenu" class="navbar  navbar-expand-lg  navbar-dark mb-5 align-items-center fade-out" style="background:#FFFF; box-shadow:0 0 20px #636363; color:#000 !important; border-radius:10px; padding:0 10px; /*border-bottom-right-radius:20px;border-bottom-left-radius:20px;*/ ">
 
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav" style="gap:2rem; color:#000;">
        <style>
            .nav-item-inItem {
                width: max-content;
            }
        </style>
      <li class="nav-item-inItem nav-item active">
     <a class="nav-link ds-loai-sp" href="#" data-ls="0">Tất cả</a>
    </li>
      <asp:ListView ID="LoaiListView" runat="server">
    <ItemTemplate>
        
        <li class="nav-item-inItem nav-item">
    <a class="nav-link ds-loai-sp" href="#" data-ls="<%# Eval("MaLoai") %>"><%# Eval("TenLoai") %></a>
</li>
        
    </ItemTemplate>
</asp:ListView>

</ul>
      
  </div>
</nav>
             
            
            
            
            <script>
                // Lắng nghe sự kiện click trên các liên kết
                document.querySelectorAll('.ds-loai-sp').forEach(function (link) {
                    link.addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết

                        // Lấy giá trị data-ls từ liên kết được click
                        var lsValue = this.getAttribute('data-ls');

                        // Thêm &ls=value vào URL hiện tại
                        var newURL = addLsToCurrentURL(lsValue);

                        // Điều hướng đến URL mới
                        window.location.href = newURL;
                    });
                });

                // Hàm để thêm &ls=value vào URL hiện tại
                function addLsToCurrentURL(lsValue) {
                    var currentURL = window.location.href;

                    if (currentURL.indexOf('?') === -1) {
                        // Nếu URL không có query string, thêm ?ls=value mới
                        currentURL += '?ls=' + lsValue;
                    } else {
                        // Nếu URL có query string
                        var queryString = currentURL.split('?')[1]; // Lấy phần query string
                        var queryParts = queryString.split('&'); // Chia query string thành các phần

                        // Lọc các phần không chứa 'ls='
                        queryParts = queryParts.filter(function (part) {
                            return part.indexOf('ls=') !== 0;
                        });

                        // Nối lại các phần với dấu '&'
                        queryString = queryParts.join('&');

                        // Thêm &ls=value mới vào cuối query string
                        queryString += '&ls=' + lsValue;

                        // Cập nhật URL với query string mới
                        currentURL = currentURL.split('?')[0] + '?' + queryString;
                    }


                    return currentURL;
                }
            </script>

           
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">
                <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetPhones">

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

                        <div class="col mb-5">
                            <%--<div class="card h-100">--%><a class="btn btn-outline-dark mt-auto btn-mua card h-100" href="item.aspx?sp=<%#:Item.MaSP%>">
                                <!-- Product image-->

                                <img class="card-img-top img-with-hover" src="<%#:Item.DuongDan%>" alt="..." /><style>
                                                                                                                   .img-with-hover {
                                                                                                                       transition: transform 0.3s;
                                                                                                                       border-radius: 1.8rem;
                                                                                                                   }

                                                                                                                   .btn-mua:hover .img-with-hover {
                                                                                                                       transform: scale(1.05);
                                                                                                                   }

                                                                                                                   .btn-outline-dark {
                                                                                                                       --bs-btn-active-bg: #CCBEB1;
                                                                                                                       --bs-btn-disabled-color: #CCBEB1;
                                                                                                                   }
                                                                                                               </style>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%#:Item.TenSP%></h5>

                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-
                                    
                                    
                                    p-4 pt-0 border-top-0 bg-transparent">
                                    <!-- Product price-->
                                    <p class="text-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</p>

                                    <div class="text-center d-flex justify-content-center" style="gap:1rem;">
                                 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $('.btn-mua').click(function () {
                                        var url = $(this).data('href');
                                        window.location.href = url;
                                    });
                                });
                            </script>
                                                                <button class="btn btn-outline-dark mt-auto btn-mua" style="background:#fff; color:#000;" type="button" data-href="item.aspx?sp=<%#:Item.MaSP%>">Mua</button>
                                                            <asp:ImageButton ID="btnCart" CommandArgument='<%#:Item.MaSP%>' runat="server" Style="width: 57.5px; height:37.5px; background:#fff;" OnClick="btnCart_Click" class="btn btn-outline-dark flex-shrink-0 btn-gio  btn-gio-card" ImageUrl="~/Content/icon/add-cart.png" />
                                                            <script>
                                                                const btnCart = document.getElementById('btnCart');
                                                                const btnCartclass = document.querySelector('.btn-gio-card');
                                                                btnCartclass.addEventListener('click', showNotification);
                                                                btnCart.addEventListener('click', showNotification());
                                                            </script>
</div>

                                    <%--                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-mua" href="item.aspx?sp=<%#:Item.MaSP%>">Mua</a></div>--%>
                                </div>
                                <%--                            </div>--%></a>
                        </div>

                        <style>
                            .btn-mua:hover {
                                background-color: #FBF4F1;
                                color: #212529;
                            }

                            .btn-mua-ngay:hover {
                                background-color: #FBF4F1;
                                color: #212529;
                            }

                            .btn-gio:hover {
                                background-color: #FBF4F1;
                                color: #212529;
                            }
                        </style>
                    </ItemTemplate>
                </asp:ListView>

            </div>
        </div>
    </section>

</asp:Content>
