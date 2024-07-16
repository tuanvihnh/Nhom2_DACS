<%@ Page Title="QSCshop" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TH03_WebBanHang._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Header-->
    <header class="bg-white  py-0 px-0 ">

        <header class="bg-white py-0 px-0">
    <div class="container-fluid px-0">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                <li data-target="#carouselExampleControls" data-slide-to="2"></li>
                <li data-target="#carouselExampleControls" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="Content\image-bg\bg-image-1.png" class="d-block w-100" alt="Background Image 1">
                </div>
                <div class="carousel-item">
                    <img src="Content\image-bg\bg-image-2.png" class="d-block w-100" alt="Background Image 2">
                </div>
                <div class="carousel-item">
                    <img src="Content\image-bg\bg-image-3.png" class="d-block w-100" alt="Background Image 3">
                </div>
                <div class="carousel-item">
                    <img src="Content\image-bg\bg-image-4.png" class="d-block w-100" alt="Background Image 4">
                </div>

            </div>
        </div>
    </div>



        <script>

            var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'), {
                interval: 2000, // Thời gian chuyển ảnh (5 giây)
                wrap: true // Tự động quay vòng ảnh

            });
        </script>

        
        
        <style>
            
            .carousel-item {
                transition-duration: 0.1s !important; /* Tốc độ chuyển cảnh là 0.5 giây */
            
            }


            .container .btn-mua:hover {
                background-color: #FBF4F1;
                color: #212529;
            }

            .container .btn-mua:active {
                background-color: #CCBEB1 !important;
                color: #212529 !important;
            }
            /**/ .bg-dark {
                position: relative;
            }

                .bg-dark .container {
                    position: relative;
                    overflow: hidden;
                }

                .bg-dark img {
                    filter: brightness(35%);
                }

            .position-absolute {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 1;
            }

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

        </style>
    </header>
    <section class="py-5">
        <style>
            #list-type {
                 display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
         height: 100%;
            }

#ul-l-type {
    list-style-type: none;
    padding: 0;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px; /* Space between items */
}

#ul-l-type li {
    text-align: center;
}

#ul-l-type li a {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-decoration: none;
    color: black;
}

#ul-l-type li a img.img-dm {
    width: 150px; /* Adjust size as needed */
    height: 150px; /* Adjust size as needed */
}

#ul-l-type li:active {
    background-color: rgba(204, 190, 177, 0.5); /* Thêm một chút màu sắc khi button được nhấn */
}

#ul-l-type a {
    text-decoration: none;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 1rem;
    color: rgba(255, 255, 255, 0.8); /* Màu chữ trong suốt */
    transition: color 0.3s;
}

#ul-l-type a:hover {
    color: rgba(0, 0, 0, 1); /* Màu chữ tối khi hover */
}

#ul-l-type a p {
    padding-top: 0.5rem;
    margin: 0;
}

            .carousel-item-boder img {
                /* border-top-right-radius: 10px;
                border-top-right-radius: 10px;*/
            }

            .carousel-item img {
     
        width: 100vh; /* Allow the width to adjust automatically */
        max-width: 100%; /* Ensure the image does not exceed the viewport width */
        object-fit: cover; /* Maintain aspect ratio and cover entire container */
    }

            .carousel {
                position: relative
            }

                .carousel.pointer-event {
                    -ms-touch-action: pan-y;
                    touch-action: pan-y
                }

            .carousel-inner {
                position: relative;
                width: 100%;
                overflow: hidden
            }

                .carousel-inner::after {
                    display: block;
                    clear: both;
                    content: ""
                }

            .carousel-item {
                position: relative;
                display: none;
                float: left;
                width: 100%;
                margin-right: -100%;
                -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
                transition: -webkit-transform .6s ease-in-out;
                transition: transform .6s ease-in-out;
                transition: transform .6s ease-in-out,-webkit-transform .6s ease-in-out
            }

            @media (prefers-reduced-motion:reduce) {
                .carousel-item {
                    transition: none
                }
            }

            .carousel-item-next, .carousel-item-prev, .carousel-item.active {
                display: block
            }

                .active.carousel-item-right, .carousel-item-next:not(.carousel-item-left) {
                    -webkit-transform: translateX(100%);
                    transform: translateX(100%)
                }

                .active.carousel-item-left, .carousel-item-prev:not(.carousel-item-right) {
                    -webkit-transform: translateX(-100%);
                    transform: translateX(-100%)
                }

            .carousel-fade .carousel-item {
                opacity: 0;
                transition-property: opacity;
                -webkit-transform: none;
                transform: none
            }

                .carousel-fade .carousel-item-next.carousel-item-left, .carousel-fade .carousel-item-prev.carousel-item-right, .carousel-fade .carousel-item.active {
                    z-index: 1;
                    opacity: 1
                }

            .carousel-fade .active.carousel-item-left, .carousel-fade .active.carousel-item-right {
                z-index: 0;
                opacity: 0;
                transition: opacity 0s .6s
            }

            @media (prefers-reduced-motion:reduce) {
                .carousel-fade .active.carousel-item-left, .carousel-fade .active.carousel-item-right {
                    transition: none
                }
            }

            .carousel-control-next, .carousel-control-prev {
                position: absolute;
                top: 0;
                bottom: 0;
                z-index: 1;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                -ms-flex-pack: center;
                justify-content: center;
                width: 15%;
                color: #fff;
                text-align: center;
                opacity: .5;
                transition: opacity .15s ease
            }

            @media (prefers-reduced-motion:reduce) {
                .carousel-control-next, .carousel-control-prev {
                    transition: none
                }
            }

            .carousel-control-next:focus, .carousel-control-next:hover, .carousel-control-prev:focus, .carousel-control-prev:hover {
                color: #fff;
                text-decoration: none;
                outline: 0;
                opacity: .9
            }

            .carousel-control-prev {
                left: 0
            }

            .carousel-control-next {
                right: 0
            }

            .carousel-control-next-icon, .carousel-control-prev-icon {
                display: inline-block;
                width: 20px;
                height: 20px;
                background: no-repeat 50%/100% 100%
            }

            .carousel-control-prev-icon {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e")
            }

            .carousel-control-next-icon {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e")
            }

            .carousel-indicators {
                position: absolute;
                right: 0;
                bottom: 0;
                left: 0;
                z-index: 15;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-pack: center;
                justify-content: center;
                padding-left: 0;
                margin-right: 15%;
                margin-left: 15%;
                list-style: none
            }

                .carousel-indicators li {
                    box-sizing: content-box;
                    -ms-flex: 0 1 auto;
                    flex: 0 1 auto;
                    width: 30px;
                    height: 3px;
                    margin-right: 3px;
                    margin-left: 3px;
                    text-indent: -999px;
                    cursor: pointer;
                    background-color: #fff;
                    background-clip: padding-box;
                    border-top: 10px solid transparent;
                    border-bottom: 10px solid transparent;
                    opacity: .5;
                    transition: opacity .6s ease
                }

            @media (prefers-reduced-motion:reduce) {
                .carousel-indicators li {
                    transition: none
                }
            }

            .carousel-indicators .active {
                opacity: 1
            }

            .carousel-caption {
                position: absolute;
                right: 15%;
                bottom: 20px;
                left: 15%;
                z-index: 10;
                padding-top: 20px;
                padding-bottom: 20px;
                color: #fff;
                text-align: center
            }

            .sr-only {
                position: absolute;
                width: 1px;
                height: 1px;
                padding: 0;
                margin: -1px;
                overflow: hidden;
                clip: rect(0,0,0,0);
                white-space: nowrap;
                border: 0
            }

            .sr-only-focusable:active, .sr-only-focusable:focus {
                position: static;
                width: auto;
                height: auto;
                overflow: visible;
                clip: auto;
                white-space: normal
            }

            .img-dm {
    width: 100%; /* Kích thước ảnh là 100% của button */
    height: auto; /* Chiều cao tự động điều chỉnh để không bị méo */
    border-radius: 10px; /* Bo tròn góc cho ảnh */
    background-size: cover; /* Đảm bảo ảnh sẽ đầy đủ kích thước và không bị méo */
    background-repeat: no-repeat; /* Không lặp lại hình ảnh */
}
        </style>

        <div class="container px-4 px-lg-0 mt-2" style="overflow: hidden; border: 5px solid rgba(255, 255, 255, 0.8) ; background-color: #CCBEB1; border-radius: 10px; overflow-y: scroll; overflow: auto;">
            <div class="d-flex justify-content-between align-items-center">

                <div id="list-type">
                    <style>
                        .tenSP-ls-h3-dm {
                            text-align: center;
                            font-weight: bolder;
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                            color: #000;
                            width: 100%;
                             margin-top: 20px; /* Adjust as needed */
                             margin-bottom: 20px; /* Adjust as needed */                        
                        }

                        .tenSP-ls-p-dm {
                           
                            width: max-content;
                            padding: 5px;                       
                            border-bottom-color: #000;
                            border: 1px solid;
                            border-top-style: none;
                            border-left-style: none;
                            border-right: none;
                            font-size : 30px;
                            align-items :center;
                            margin: 0 auto;

                        }
                    </style>
                    <ul id="ul-l-type">
                        <h4 class="tenSP-ls-h3-dm">
                            <p class="tenSP-ls-p-dm">Danh Mục Quần Áo</p>
                        </h4>
                        <li><a href="#TS">
                            <span class="border border-primary"><img class="img-dm" src="Content/img/ao.png" /></span>
                            <p><b>Áo</b></p>
                        </a></li>
                        <li><a href="#HT">
                          <span class="border border-success"><img class="img-dm" src="Content/img/dam.png" /></span>  
                            <p><b>Đầm</b></p>
                        </a></li>
                        <li><a href="#CP">
                           <span class="border border-danger"><img class="img-dm" src="Content/img/aokhoac.png" /></span> 

                            <p><b>Áo khoác</b></p>
                        </a></li>
                        <li><a href="#KT">
                            <span class="border border-light"><img class="img-dm" src="Content/img/phukien.png" /></span>


                            <p><b>phụ kiện</b>
                            </p>
                        </a></li>
                        <li><a href="#CP">
                            <span class="border border-dark"><img class="img-dm" src="Content/img/damcongso.png" /></span>

                            <p><b>Đàm công sở </b></p>
                        </a></li>
                        <li><a href="#CP">
                           <span class="border border-secondary"><img class="img-dm" src="Content/img/damdahoi.png" /></span> 

                            <p><b>Đàm dạ hội </b></p>
                        </a></li>
                       
                    </ul>

                </div>
            </div>
        </div>
    </section>
    <section class="py-4">
        <style>
            body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .sale-container {
            text-align: left;
            padding: 10px;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .sale-container h2 {
            font-size: 30px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .sale-slider {
            position: relative;
            display: flex;
            justify-content: center; /* Center items horizontally */
            align-items: center; /* Center items vertically */
            overflow: hidden;
            height: 400px; /* Set the desired height */
        }

        .sale-items1 {
            display: flex;
            transition: transform 0.3s ease;
            width: 110%;
            scroll-behavior: smooth;
            overflow: hidden;
            max-width: calc(300px * 4 + 30px * 3);
        }

        .section {
            min-width: 300px;
            margin: 0 10px;
            position: relative;
            width: 300px;
            height: 400px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .section:hover img {
            transform: scale(1.1);
        }

        .overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.8);
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .overlay span {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .overlay .button {
            width: 45px;
            height: 45px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #fff;
            border-radius: 50%;
            flex: 0 0 45px;
            margin-left: 10px;
            transition: all .3s ease;
        }

        .overlay .button:hover {
            background-color: #333;
            color: white;
        }

        .overlay .button svg {
            width: 20px;
            height: 20px;
        }

        .nav-button {
            background: #fff;
            color: black;
            border: none;
            font-size: 24px;
            padding: 10px;
            cursor: pointer;
        }

        .nav-button:hover {
            background: #ddd;
        }
        .apple2{
            display: flex;
            align-items: center;
            background: #fff;
        }
        </style>
        <div class="sale-container">
        <h2><span>&#8226;</span> Danh mục nổi bật</h2>
        <div class="apple2">
            <button type="button" class="nav-button prev" onclick="prevSlide1()"><</button>
            <button type="button" class="nav-button next" onclick="nextSlide1()">></button>
        </div>
    </div>
    <div class="sale-slider">
        <div class="sale-items1">
            <div class="section">
                <img src="Content/items/photo/img1.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Đầm</span>
                    <div type="button" class="button" id="actionButton1">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/images.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Áo sơ mi</span>
                    <div type="button" class="button" id="actionButton2">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/img2.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Áo kiểu</span>
                    <div type="button" class="button" id="actionButton3">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/img3.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Quần</span>
                    <div type="button" class="button" id="actionButton4">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/img4.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Chân váy</span>
                    <div type="button" class="button" id="actionButton5">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/img5.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Áo khoác</span>
                    <div type="button" class="button" id="actionButton6">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/img6.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Homewear</span>
                    <div type="button" class="button" id="actionButton7">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="section">
                <img src="Content/items/photo/img7.jpg" alt="Dress Image">
                <div class="overlay">
                    <span>Đồ lót</span>
                    <div type="button" class="button" id="actionButton8">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <script>
            let currentIndex = 0;

            function showSlide(index) {
                const slides = document.querySelectorAll('.section');
                const slideCount = slides.length;

                if (index >= slideCount) {
                    currentIndex = 0;
                } else if (index < 0) {
                    currentIndex = slideCount - 1;
                } else {
                    currentIndex = index;
                }

                const slider = document.querySelector('.sale-items1');
                slider.scrollLeft = currentIndex * 220;
            }

            function nextSlide1() {
                showSlide(currentIndex + 1);
            }

            function prevSlide1() {
                showSlide(currentIndex - 1);
            }


            const buttons = document.querySelectorAll('#actionButton1, #actionButton2, #actionButton3, #actionButton4, #actionButton5, #actionButton6, #actionButton7, #actionButton8');

            // Lặp qua từng button và thêm sự kiện click
            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    console.log('Button clicked!'); // Log ra thông báo
                    // Thêm hành động của bạn ở đây
                    window.location.href = "#"; // Chuyển hướng đến đường dẫn mong muốn
                });
            });

            // Add event listeners for other action buttons if needed...

            // Initialize slider
            showSlide(currentIndex);
        </script>
    </section>

    <section class="py-5">
        <style>
           
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .sale-container {
            text-align: left;
            padding: 20px;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .sale-container h2 {
            font-size: 24px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .sale-container h2 span {
            color: red;
        }

        .countdown-timer {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-left: 20px;
        }

        .countdown-timer div {
            background-color: red;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }

        .countdown-timer div span {
            display: block;
            font-size: 20px;
            margin-bottom: 5px;
        }

        .sale-slider {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
             
        }

        .sale-items2 {
            display: flex;
            overflow: hidden;
            width: 72%;
            scroll-behavior: smooth;
        }

        .sale-item {
            min-width: 200px;
            max-width: 200px;
            height: 200%;
            margin: 0 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            text-align: left;
            position: relative;
        }

        .sale-item img.primary-img {
            display: block;
            width: 100%;
            transition: opacity 0.5s ease-in-out;
        }

        .sale-item img.hover-img {
            display: block;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .sale-item:hover img.primary-img {
            opacity: 0;
        }

        .sale-item:hover img.hover-img {
            opacity: 1;
        }

        .discount-tag {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: red;
            color: white;
            padding: 5px;
            border-radius: 5px;
            font-size: 14px;
        }

        .sale-info {
            padding: 10px;
        }

        .sale-info h3 {
            font-size: 16px;
            margin: 10px 0;
        }

        .sale-info .price {
            font-size: 14px;
            margin: 10px 0;
        }

        .sale-info .new-price {
            color: red;
        }

        .sale-info .old-price {
            text-decoration: line-through;
            color: #777;
        }

        .sale-info .shop-now {
            background-color: red;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            width: 100%;
            border-radius: 5px;
        }

        .prev2,.next2 {
            background: #fff;
            color: black;
            border: none;
            font-size: 24px;
            padding: 10px;
            cursor: pointer;
            margin-left: 10px;
        }   
        .apple {
            display: flex;
            align-items: center;
        }
        </style>
        <div class="sale-container">
        <h2><span>&#8226;</span> MARKDOWN SALE 30%-50%</h2>
        <%--<div class="countdown-timer">
            <div><span id="days">3</span>Ngày</div>
            <div><span id="hours">00</span>Giờ</div>
            <div><span id="minutes">24</span>Phút</div>
            <div><span id="seconds">06</span>Giây</div>
        </div>--%>
        <div class="apple">
            <button type="button" class="prev2" onclick="prevSlide2()"><</button>
                <button type="button" class="next2" onclick="nextSlide2()">></button>
        </div>
    </div>
    <div class="sale-slider">
        <div class="sale-items2">
            <div class="sale-item">
                
                    <div class="discount-tag">-50%</div>
                    <img src="Content/items/oplet/a1.jpg" alt="Vest Quần" class="primary-img">
                    <img src="Content/items/oplet/a2.jpg" alt="Vest Quần Hover" class="hover-img">
                    
                <div class="sale-info">
                        <h3>Sơ mi tay dài, Dáng sơ vin 24SSME034F</h3>
                        <p class="price"><span class="new-price">769,300đ</span> <span class="old-price">1,499,000đ</span></p>
                    </div>
                </div>
            
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a3.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a4.jpg" alt="Áo kiểu Hover" class="hover-img">
        
                <div class="sale-info">
                    <h3>Sơ mi tay dài, Dáng sơ vin 24SSME034F</h3>
                    <p class="price"><span class="new-price">839,300đ</span> <span class="old-price">1,499,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a5.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a6.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Sơ mi tay ngắn, Dáng sơ vin 24SSME041X</h3>
                    <p class="price"><span class="new-price">769,300đ</span> <span class="old-price">999,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a7.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a8.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Áo vest trong bộ Vest-Quần, 24SQAE004B</h3>
                    <p class="price"><span class="new-price">1,119,300đ</span> <span class="old-price">2,499,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a9.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a10.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Váy trong bộ Vest-Váy,  23AVJE033K</h3>
                    <p class="price"><span class="new-price">599,500đ</span> <span class="old-price">2,499,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a11.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a12.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Đầm tay dài, Dáng thắt eo  23ADKE164H</h3>
                    <p class="price"><span class="new-price">999,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a13.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a14.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Quần trong bộ Vest-Quần, 23AQQE035N</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a15.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a16.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Áo kiểu, 23AOTE102B</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a17.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a18.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Chân váy Mini, Dáng A 23AVJE046S</h3>
                    <p class="price"><span class="new-price">499,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a19.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a20.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Áo vest trong bộ Vest-Váy, 24SVAE001K</h3>
                    <p class="price"><span class="new-price">1,249,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a21.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a22.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Blazer, 23ABLE037B</h3>
                    <p class="price"><span class="new-price">1,249,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
            <div class="sale-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/oplet/a23.jpg" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/oplet/a24.jpg" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Quần trong bộ Vest-Quần,  23AQQE016T</h3>
                    <p class="price"><span class="new-price">599,500đ</span> <span class="old-price">1,199,000đ</span></p>
                </div>
            </div>
        </div>
    </div>
    <script>
        let currentIndex2 = 0;

        function showSlide2(index) {
            const slides = document.querySelectorAll('.sale-item');
            const slideCount = slides.length;

            if (index >= slideCount) {
                currentIndex2 = 0;
            } else if (index < 0) {
                currentIndex2 = slideCount - 1;
            } else {
                currentIndex2 = index;
            }

            const slider = document.querySelector('.sale-items2');
            slider.scrollLeft = currentIndex2 * 220;
        }

        function nextSlide2() {
            showSlide2(currentIndex2 + 1);
        }

        function prevSlide2() {
            showSlide2(currentIndex2 - 1);
        }

        // Khởi tạo slider
        showSlide2(currentIndex2);
    </script>
    </section>

        <section class="py-5">
            <style>
                body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container3 {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .filters {
            text-align: center;
            margin-bottom: 20px;
        }
        .filters span {
            margin: 0 10px;
            font-size: 18px;
            cursor: pointer;
            border: 1px solid transparent; /* Thêm đường viền và chỉnh màu tùy ý */
            padding: 5px 10px;
        }
        .filters span.active {
            font-weight: bold;
            text-decoration: underline;
            border-color: #000; /* Màu đường viền khi được chọn */
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        .product-item {
            position: relative;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            display: block;
            

        }
        .product-item img {
            width: 100%;
            height: 464px;
            transition: opacity 0.3s ease;
        }
        .product-item .hover-img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: auto;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .product-item:hover .hover-img {
            opacity: 1;
        }
        .product-item:hover img.primary-img {
            opacity: 0;
        }
        .product-info {
            padding: 15px;
        }
        .product-info, .discount-tag {
            position: relative;
            z-index: 2;
        }
        .product-info h3 {
            font-size: 16px;
            margin: 0 0 10px;
        }
        .product-info p {
            margin: 0;
            color: #d00;
        }
        .product-info .original-price {
            text-decoration: line-through;
            color: #999;
            font-size: 14px;
        }
        .discount-tag {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #e44;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }
        .sale-info {
            text-align: center;
            padding: 10px;
        }
        .sale-info h3 {
            font-size: 16px;
            margin: 10px 0;
        }
        .sale-info .price {
            margin: 0;
            font-size: 18px;
            color: #d00;
        }
        .sale-info .new-price {
            font-weight: bold;
        }
        .sale-info .old-price {
            text-decoration: line-through;
            color: #999;
            font-size: 14px;
            margin-left: 5px;
        }
        .shop-now {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .view-all-btn {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #000;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
            </style>
            <div class="container">
            <div class="title">Hàng mới về</div>
            <div class="filters">
                <button type="button" id="new-arrival" class="active">Hàng mới về</button>
                <button type="button" id="discount-30">30%</button>
                <button type="button" id="discount-50">50%</button>
            </div>
        <div class="product-grid">
            <div class="product-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/newphoto/b1.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b2.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Chân váy Midi, Dáng ôm 24SCVE154D</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-30%</div>
                <img src="Content/items/newphoto/b3.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b4.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Đầm hai dây, 24SDKE198N</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/newphoto/b5.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b6.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Sơ mi tay ngắn, Dáng sơ vin 24SSME149F</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-30%</div>
                <img src="Content/items/newphoto/b7.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b8.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Đầm tay ngắn, Dáng thắt eo 24SDKE137Y</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/newphoto/b9.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b10.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Chân váy Midi, Xếp ly 24SCVE095F</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-30%</div>
                <img src="Content/items/newphoto/b11.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b12.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Áo vest trong bộ Vest-Quần, 24SQAE012D</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-50%</div>
                <img src="Content/items/newphoto/b13.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b14.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Đầm maxi, 24SDKE265F</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <div class="product-item">
                <div class="discount-tag">-30%</div>
                <img src="Content/items/newphoto/b15.png" alt="Áo kiểu" class="primary-img">
                <img src="Content/items/newphoto/b16.png" alt="Áo kiểu Hover" class="hover-img">
                <div class="sale-info">
                    <h3>Đầm tay ngắn, Dáng thắt eo 24SDKE136N</h3>
                    <p class="price"><span class="new-price">749,500đ</span> <span class="old-price">1,499,000đ</span></p>                   
                </div>
            </div>
            <!-- Repeat .product-item blocks as needed -->
        </div>
        <a type="button" href="Item.aspx" class="view-all-btn">Xem tất cả hàng mới về</a>
    </div>
        <script>
            var buttons = document.querySelectorAll('.filters button');

            buttons.forEach(function (button) {
                button.addEventListener('click', function () {
                    // Remove the 'active' class from all buttons
                    buttons.forEach(function (btn) {
                        btn.classList.remove('active');
                    });

                    // Add the 'active' class to the clicked button
                    this.classList.add('active');

                    // Filter the products based on the selected filter
                    filterProducts(this.textContent);
                });
            });

            function filterProducts(filterType) {
                var productItems = document.querySelectorAll('.product-item');
                productItems.forEach(function (item) {
                    var discountTag = item.querySelector('.discount-tag');
                    var discountValue = parseInt(discountTag.innerText.replace('-', '').replace('%', ''));
                    if (filterType === 'Hàng mới về' || (filterType === '30%' && discountValue === 30) || (filterType === '50%' && discountValue === 50)) {
                        // Display the matching products
                        item.style.display = 'block';
                    } else {
                        // Hide the non-matching products
                        item.style.display = 'none';
                    }
                });
            }
        </script>
        </section>

       
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-0">
            <h3 id="TS" class="tenSP-ls-h3">
                <p class="tenSP-ls-p">Các Đề xuất về Áo </p>
            </h3>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">
                
                <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetTraSua">
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
                            <%--<div class="card h-100">  --%>                      <a class="btn btn-outline-dark mt-auto btn-mua card h-100" href="item.aspx?sp=<%#:Item.MaSP%>">

                                <!-- Product image-->
                                <img class="card-img-top img-with-hover" src="<%#:Item.DuongDan%>" alt="..." style="padding: 20px; height: max-content;" />
                                <style>
                                    .img-with-hover {
                                        transition: transform 0.5s;
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
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <!-- Product price-->
                                    <p class="text-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</p>
                                    <%--                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-mua" href="item.aspx?sp=<%#:Item.MaSP%>">Mua</a></div>--%>
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
                                    </div>
                            </a><%--</div>     --%>
                        </div>
                    </ItemTemplate>
                </asp:ListView>


            </div>
            <h3 id="HT" class="tenSP-ls-h3">
                <p class="tenSP-ls-p">Áo khoác</p>
            </h3>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">

                <asp:ListView ID="ListView2" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetTea">

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
                            <%--<div class="card h-100">  --%>                      <a class="btn btn-outline-dark mt-auto btn-mua card h-100" href="item.aspx?sp=<%#:Item.MaSP%>">

                                <!-- Product image-->
                                <img class="card-img-top img-with-hover" src="<%#:Item.DuongDan%>" alt="..." style="padding: 20px; height: max-content;" />

                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%#:Item.TenSP%></h5>

                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <!-- Product price-->
                                    <p class="text-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</p>
                                    <%--                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-mua" href="item.aspx?sp=<%#:Item.MaSP%>">Mua</a></div>--%>
                                </div>
                                <%--                            </div>--%></a>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <h3 id="CP" class="tenSP-ls-h3">
                <p class="tenSP-ls-p">Quần các loại</p>
            </h3>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">

                <asp:ListView ID="ListView4" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetCoffee">

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
                            <%--<div class="card h-100">  --%>                      <a class="btn btn-outline-dark mt-auto btn-mua card h-100" href="item.aspx?sp=<%#:Item.MaSP%>">

                                <!-- Product image-->
                                <img class="card-img-top img-with-hover" src="<%#:Item.DuongDan%>" alt="..." style="padding: 20px; height: max-content;" />

                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%#:Item.TenSP%></h5>

                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <!-- Product price-->
                                    <p class="text-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</p>
                                    <%--                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-mua" href="item.aspx?sp=<%#:Item.MaSP%>">Mua</a></div>--%>
                                </div>
                                <%--                            </div>--%></a>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <h3 id="KT" class="tenSP-ls-h3">
                <p class="tenSP-ls-p">Phụ kiện
                </p>
            </h3>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">

                <asp:ListView ID="ListView3" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetIceCream">

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
                            <%--<div class="card h-100">  --%>                      <a class="btn btn-outline-dark mt-auto btn-mua card h-100" href="item.aspx?sp=<%#:Item.MaSP%>">

                                <!-- Product image-->
                                <img class="card-img-top img-with-hover" src="<%#:Item.DuongDan%>" alt="..." style="padding: 20px; height: max-content;" />

                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%#:Item.TenSP%></h5>

                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <!-- Product price-->
                                    <p class="text-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</p>
                                    <%--                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-mua" href="item.aspx?sp=<%#:Item.MaSP%>">Mua</a></div>--%>
                                </div>
                                <%--                            </div>--%></a>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
</asp:Content>
