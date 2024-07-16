<%@ Page Title="Gmilk Tea" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ManagerRevenue.aspx.cs" Inherits="TH03_WebBanHang.ManagerRevenue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            
	
	
	
	
	
	
	 <script src="https://code.jquery.com/jquery-latest.js"></script>

        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="Content/logo/K.png" rel="shortcut icon" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <style>
        ::-webkit-scrollbar {
            width: 5px;
        }

        ::-webkit-scrollbar-thumb {
            background: #5e17a2ff;
        }

        ::-webkit-scrollbar-track {
            background: #202020;
        }
        *{
            font-family:Roboto;
        }
    </style>
    <style>
        #loader {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 99999;
            width: 100%;
            height: 100%;
            background-color: #FFFF;
            transition: all 0.3s ease-in-out;
            text-align: center;
            justify-content: center;
            align-content: center;
            align-items: center;
            justify-items: center;
            text-align: center;
        }

        .circle {
            justify-content: center;
            align-content: center;
            align-items: center;
            justify-items: center;
            text-align: center;
            height: 40px;
            margin: auto;
            position: relative;
            text-align: center;
            width: 40px;
            -webkit-animation: circle_dot 2.0s infinite linear;
            animation: circle_dot 2.0s infinite linear;
        }

        .circle1, .circle2 {
            height: 60%;
            display: inline-block;
            background-color: #6c38ef;
            border-radius: 100%;
            position: absolute;
            top: 0;
            width: 60%;
            -webkit-animation: circle_bounce 2.0s infinite ease-in-out;
            animation: circle_bounce 2.0s infinite ease-in-out;
        }

        .circle2 {
            bottom: 0;
            top: auto;
            -webkit-animation-delay: -1.0s;
            animation-delay: -1.0s;
        }

        @-webkit-keyframes circle_dot {
            100% {
                -webkit-transform: rotate(360deg)
            }
        }

        @keyframes circle_dot {
            100% {
                transform: rotate(360deg);
                -webkit-transform: rotate(360deg)
            }
        }

        @-webkit-keyframes circle_bounce {
            0%, 100% {
                -webkit-transform: scale(0.0)
            }

            50% {
                -webkit-transform: scale(1.0)
            }
        }

        @keyframes circle_bounce {
            0%, 100% {
                -webkit-transform: scale(0.0);
                transform: scale(0.0);
            }

            50% {
                -webkit-transform: scale(1.0);
                transform: scale(1.0);
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script>



    <div id="form1"  class="d-flex justify-content-center align-items-center flex-column"> 
        <section id="Revenue" class="content-Manager" style="height:max-content">
        <style>
            #footer, #header{
                display:none !important;
            }
            .ListView1Account{
			 display:flex;
			text-align:center;
			justify-content:center;
                }
        </style>

   
        <style>
            .table *{
                border:none !important;
            }
            .adminul li {
                    width: 100%;
                    text-align: left;
                    
                    border-bottom:1px solid #242426;
                    border-radius:0;
                   background:#FFFF !important; 
                    padding:5px;
                  
                  
                }
           
             .adminul nav-item {
                 font-size:16px;
       
       
             }
            .adminul *{
                transition:linear 0.5s, opacity 0.5s linear;
                color:#000 !important;
            }
            .adminul li a{
                font-size:16px;
                padding:5px 15px;
            }
             .adminul li:hover .dropdown-item, #adminul .nav-item:hover .nav-link{
         
                transition: 0.25s ease-in;
                
                
             }
             
             .smallul li a{
                 padding:5px 15px;

             }
             /* CSS cho phần tử <li> cha */
            .nav-item:hover > ul {
                display: block;
    
            }

            /* CSS cho phần tử <ul> con */
            .adminul.smallul {
                display: none; /* Ban đầu, các phần tử <ul> con sẽ không hiển thị */
            }

            /* CSS cho phần tử <li> con khi hover lên */
            .nav-item:hover > ul > li {
                display: block; /* Hiển thị các phần tử <li> con khi hover lên */
            }

        </style>
         
       
                <style>
                    .card-header{
                        font-size:12px;
                    }

                    .tenSP-ls-h3 {
                        padding-bottom: 1.5rem;
                        text-align: center;
                        font-weight: bolder;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        color: #9b51e0;
                        width: 100%;
                    }

                    .tenSP-ls-p {
                        color: #9b51e0;
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
                        color: #9b51e0;
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
                        border: 2px solid #fff !important;
                        text-align: center;
                    }

                    .ListView1 {
                        display: flex;
                        text-align: center;
                        justify-content: center;
                    }

                    .pagerImage {
                        width: 24px; /* Độ rộng mong muốn */
                        height: 24px; /* Độ cao mong muốn */
                    }

                    .btn-num-page:hover {
                        color: #9B51E0;
                    }

                    .pagerGap {
                        margin: 0 5px; /* Thêm khoảng cách giữa các phần tử */
                    }

                    .numericPagerField a {
                        margin-right: 10px;
                        padding-bottom: 2rem;
                    }

                        /* To ensure the last button doesn't have an extra margin on the right */
                        .numericPagerField a:last-child {
                            margin-right: 0;
                        }

                    .currentPage {
                        font-weight: bold;
                        color: #9B51E0;
                    }

                    .table-card h3 *{
                        padding:0;
                    }

                    .table-card * {
                        border: none !important;
                        text-align: left !important;
                        padding: 10px;
                        color:#000;
                    }

                    .table-card {
                        border: none !important;
                    }

                    a {
                        text-decoration: none;
                        color: #fff;
                    }

                    .card {
                        text-align: center;
                    }

                    .row {
                        display: flex;
                        flex-wrap: nowrap;
                        justify-content: space-between;
                    }

                    .card-body {
                        padding: 0;
                    }

                    canvas {
                        margin: auto;
                    }
                    .div-TotalText{
                       
                       
                        background:#FFFFFF;
                        width: 100%; height: max-content;
                        border: 1px solid #636363; border-radius: 10px;
                    }
                    a{
                        text-decoration:none !important;
                    }
                </style> 
                <asp:ListView ID="ListView2" runat="server" ItemType="TH03_WebBanHang.Models.DoanhThu" SelectMethod="GetRevernueRevenue">
                    <LayoutTemplate>
                        <div id="data-container" style="display: none;">
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <span class="data-item" data-ngay="<%#: Item.Ngay %>" data-thang="<%#: Item.Thang %>" data-doanhthungay="<%#: Item.DoanhThuNgay %>"></span>
                    </ItemTemplate>
                </asp:ListView>
                <section  style="max-width: 100%; margin: 2.5rem auto 2rem auto;">
                    <div class="container px-5 px-lg-5">
                        <div class="div-TotalText" style="">
                            <table style="width: 100%;" class="table-card">                                        
                                <tr>
                                    <%--<th>
                                        <h5>Tài khoản đang truy cập:</h5>
                                    </th>
                                    <th>
                                        <h5><asp:Label ID="lbAccountCheck" runat="server" CssClass="LabelTotalRevenue" Text="" Style="font-weight: bold;"></asp:Label></h5>
                                    </th>--%>
                                    <th>
                                        <h5>Tổng doanh thu cửa hàng:</h5>
                                    </th>
                                    <th>
                                        <h5><asp:Label ID="lbTotalRevenue" runat="server" CssClass="LabelTotalRevenue" Text="" Style="font-weight: bold;"></asp:Label></h5>
                                    </th>
                                     <th>
                                        <h5>Số tiền trong tài khoản:</h5>
                                    </th>
                                     <th>
                                         <h5><asp:Label ID="Label1" runat="server" CssClass="LabelTotalRevenue" Text="" Style="font-weight: bold;"></asp:Label></h5>
                                     </th>
                                </tr>
                               

                                <tr>
                                <tr>
                                    <th>
                                        <h5>Số đơn đã thanh toán:</h5>
                                    </th>
                                     <th>
                                         <h5><asp:Label ID="lbSDDTT" runat="server" CssClass="LabelTotalRevenue" Text="" Style="font-weight: bold;"></asp:Label></h5>
                                     </th>
                               
                                     <th>
                                         <h5>Số đơn chưa thanh toán:</h5>
                                     </th>
                                      <th>
                                          <h5><asp:Label ID="lbSDCTT" runat="server" CssClass="LabelTotalRevenue" Text="" Style="font-weight: bold;"></asp:Label></h5>
                                      </th>
                                 </tr>
                            </table>

                        </div>
                    </div>
                </section>
            <div>
                <section class="" style="max-width: 100%;">
                        <main>
                            <div class="container-fuild px-5 px-lg-5" style="">
                                <div class="row">
                                    <div class="col-lg-6" style="text-align: center; padding:0 10px;">
                                        <div style="background:#fff; width:575px; height:max-content; justify-content:center; align-content:center; align-items:center; justify-items:center; border-radius:10px; padding-left:10px; padding-top:10px;">
                                        <asp:ListView ID="ListView1Branch" runat="server" ItemType="TH03_WebBanHang.Models.ChiNhanh"
	                                        SelectMethod="GetDeparmentsBranch" OnSelectedIndexChanged="ListView1Branch_SelectedIndexChanged" class="text-center ListView1Branch">
	                                        <EmptyDataTemplate>
		                                        <table>
			                                        <tr>
				                                        <td></td>
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
		                                        <td class="justify-content-center align-content-center"><%#:Item.MaCN%></td>
		                                        <td class="justify-content-center align-content-center"><%#:Item.TenCN%></td>
		                                        <td class="justify-content-center align-content-center" style="width:200px;"><%#:Item.DiaChiCN%></td>
		                                    <td class="justify-content-center align-content-center" style="text-align:center;"><%#:Item.DonHangs.Count%></td>
		
		                                       <%-- <td class="justify-content-center align-content-center">
			                                        <a class="btn btn-default btn-color btn-w" href="BrandOrder.aspx?Deptid=<%#:Item.MaCN%>">Chi Tiết</a>
			                                        <%--<a class="btn btn-default btn-color btn-w" href="DeleteBranch.aspx?Deptid=<%#:Item.MaCN%>">Xóa</a>--%>
		                                       <%-- </td>--%>
	                                        </ItemTemplate>
	                                        <LayoutTemplate>
		                                        <div class="d-flex justify-content-center align-content-center "><table class="table" id="groupPlaceholderContainer" runat="server" style="">
			                                        <thead>
				                                        <tr>
					                                        <th class="justify-content-center align-content-center">Mã</th>
					                                        <th class="justify-content-center align-content-center">Khu vực</th>
					                                        <th class="justify-content-center align-content-center">Địa chỉ</th>
					                                        <th class="justify-content-center align-content-center">Lượng đơn</th>
					
					                                       <%-- <th></th>--%>
				                                        </tr>
			                                        </thead>
			                                        <tbody>
				                                        <tr id="groupPlaceholder"></tr>
			                                        </tbody>
		                                        </table></div>
		
	                                        </LayoutTemplate>
                                        </asp:ListView></div>
                                       <%-- <div class="" style="margin-top: 1rem;">
                                            <h2>TỔNG DOANH THU
                                                <asp:Label ID="LabelTotalRevenue" runat="server" CssClass="LabelTotalRevenue" Text="" Style="font-weight: bold;"></asp:Label>

                                            </h2>

                                        </div>--%>
                                    </div>
                                    <div id="layoutSidenav_content" class="col-lg-6" style="">


                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-chart-area me-1"></i>TỔNG DOANH THU THEO NGÀY
                                            </div>
                                            <div class="card-body">
                                                <canvas id="myAreaChart" style="width: 100%; height: 250px;"></canvas>
                                            </div>
                                            <div class="card-footer small  text-dark">Updated yesterday at 11:59 PM</div>
                                        </div>



                                    </div>
                                </div>

                            </div>

                        </main>
                    </section>
           
                <section>
                        <div id="layoutSidenav_content2" style="">
                            <main>

                                <div class="container-fuild px-5 px-lg-5" style="padding: 3rem;">
                                    <link href="Content/css/stylesChart.css" rel="stylesheet" />
                                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>


                                    <script src="Scripts/js/script.js"></script>
                                    <script src="Scripts/js/scriptsChart.js"></script>
                                    <script src="Scripts/js/datatables-simple-demo.js"></script>
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-pie me-1"></i>DOANH SỐ THEO LOẠI SẢN PHẨM
                                                </div>
                                                <div class="card-body">
                                                    <canvas id="myPieChartLoai" style="width: 150px; height: 150px;"></canvas>
                                                </div>
                                                <div class="card-footer small  text-dark text-dark">Updated yesterday at 11:59 PM</div>
                                            </div>
                                        </div>
                                       <%-- <div class="col-md-3">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-pie me-1"></i>DOANH SỐ THEO HÃNG ĐỒ HIỆU
                                                </div>
                                                <div class="card-body">
                                                    <canvas id="myPieChartNhom" style="width: 150px; height: 150px;"></canvas>
                                                </div>
                                                <div class="card-footer small  text-dark">Updated yesterday at 11:59 PM</div>
                                            </div>
                                        </div>--%>
                                        <div class="col-lg-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-area me-1"></i>TỔNG DOANH THU THEO THÁNG
                                                </div>
                                                <div class="card-body">
                                                    <canvas id="myMonthlyAreaChart" style="width: 100%; height: 250px;"></canvas>
                                                </div>
                                                <div class="card-footer small  text-dark">Updated yesterday at 11:59 PM</div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </main>
                        </div>
                </section>           
                <section style="max-width: 100%;">
                    <div class="container-fuild px-4 px-lg-5">
                        <div class="row">
                            <%--<div class="col-md-3">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>DOANH SỐ THEO SỐ LƯỢNG SẢN PHẨM
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myPieChartAlbum" style="width: 150px; height: 150px;"></canvas>
                                    </div>
                                    <div class="card-footer small  text-dark">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>--%>
                            <div class="col-md-3">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>DOANH SỐ THEO CHI NHÁNH
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myPieChartChiNhanh" style="width: 150px; height: 150px;"></canvas>
                                    </div>
                                    <div class="card-footer small  text-dark">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>TỔNG DOANH THU THEO NĂM
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myYearlyAreaChart" style="width: 100%; height: 250px;"></canvas>
                                    </div>
                                    <div class="card-footer small  text-dark">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                </div>

              

                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        //var dataItems = document.querySelectorAll('.data-item');

                        //// Initialize arrays for 15 days, 12 months, and 5 years
                        //var currentMonth = new Date().getMonth() + 1;
                        //var labelsDaily = Array.from({ length: 15 }, (v, i) => `${i + 1}/${currentMonth}`);
                        //var dataDaily = Array(15).fill(0);
                        ////var labelsDaily = Array.from({ length: 15 }, (v, i) => (i + 1).toString());
                        ////var dataDaily = Array(15).fill(0);

                        ////var currentYear = new Date().getFullYear();
                        ////var labelsMonthly = Array.from({ length: 12 }, (v, i) => `${i + 1}/${currentYear}`);
                        ////var dataMonthly = Array(12).fill(0);
                        //var labelsMonthly = Array.from({ length: 12 }, (v, i) => (i + 1).toString());
                        //var dataMonthly = Array(12).fill(0);

                        //var currentYear = new Date().getFullYear();
                        //var labelsYearly = Array.from({ length: 5 }, (v, i) => (currentYear - i).toString()).reverse();
                        //var dataYearly = Array(5).fill(0);

                        //// Update arrays with actual data
                        //dataItems.forEach(function (item) {
                        //    var ngay = parseInt(item.getAttribute('data-ngay'));
                        //    var thang = parseInt(item.getAttribute('data-thang'));
                        //    var doanhThuNgay = parseFloat(item.getAttribute('data-doanhthungay'));

                        //    // Update daily data
                        //    if (ngay >= 1 && ngay <= 15) {
                        //        dataDaily[ngay - 1] += doanhThuNgay; // Adjust this logic if you need to sum or average data
                        //    }

                        //    // Update monthly data
                        //    if (thang >= 1 && thang <= 12) {
                        //        dataMonthly[thang - 1] += doanhThuNgay; // Adjust this logic if you need to sum or average data
                        //    }

                        //    // Update yearly data
                        //    var yearIndex = labelsYearly.indexOf(currentYear.toString());
                        //    if (yearIndex !== -1) {
                        //        dataYearly[yearIndex] += doanhThuNgay; // Adjust this logic if you need to sum or average data
                        //    }
                        //});
                        var dataItems = document.querySelectorAll('.data-item');

                        // Initialize arrays for 15 days, 12 months, and 5 years
                        var currentDate = new Date();
                        var currentMonth = currentDate.getMonth() + 1;
                        var currentDay = currentDate.getDate();

                        // Generate dynamic labels for the last 15 days
                        var labelsDaily = [];
                        for (var i = 0; i < 15; i++) {
                            var date = new Date();
                            date.setDate(currentDay - 14 + i);
                            labelsDaily.push(`${date.getDate()}/${date.getMonth() + 1}`);
                        }
                        var dataDaily = Array(15).fill(0);

                        var labelsMonthly = Array.from({ length: 12 }, (v, i) => (i + 1).toString());
                        var dataMonthly = Array(12).fill(0);

                        var currentYear = new Date().getFullYear();
                        var labelsYearly = Array.from({ length: 5 }, (v, i) => (currentYear - i).toString()).reverse();
                        var dataYearly = Array(5).fill(0);

                        // Update arrays with actual data
                        dataItems.forEach(function (item) {
                            var ngay = parseInt(item.getAttribute('data-ngay'));
                            var thang = parseInt(item.getAttribute('data-thang'));
                            var doanhThuNgay = parseFloat(item.getAttribute('data-doanhthungay'));

                            // Update daily data
                            var itemDate = new Date(currentYear, thang - 1, ngay);
                            for (var i = 0; i < 15; i++) {
                                var date = new Date();
                                date.setDate(currentDay - 14 + i);
                                if (itemDate.getDate() === date.getDate() && itemDate.getMonth() === date.getMonth()) {
                                    dataDaily[i] += doanhThuNgay;
                                    break;
                                }
                            }

                            // Update monthly data
                            if (thang >= 1 && thang <= 12) {
                                dataMonthly[thang - 1] += doanhThuNgay;
                            }

                            // Update yearly data
                            var yearIndex = labelsYearly.indexOf(currentYear.toString());
                            if (yearIndex !== -1) {
                                dataYearly[yearIndex] += doanhThuNgay;
                            }
                        });

                        if (typeof Chart !== 'undefined') {
                            // Format numbers as currency VND
                            function formatCurrency(value) {
                                return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                            }

                            // Common options for all charts
                            var commonOptions = {
                                tooltips: {
                                    callbacks: {
                                        label: function (tooltipItem, data) {
                                            return formatCurrency(tooltipItem.yLabel);
                                        }
                                    }
                                },
                                scales: {
                                    xAxes: [{
                                        gridLines: {
                                            display: false
                                        }
                                    }],
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true,
                                            callback: function (value) {
                                                return value.toLocaleString('vi-VN');
                                            }
                                        },
                                        gridLines: {
                                            color: "rgba(0, 0, 0, .125)",
                                        }
                                    }]
                                },
                                legend: {
                                    display: false
                                }
                            };

                            // Daily revenue chart
                            var ctxDaily = document.getElementById('myAreaChart').getContext('2d');
                            var myDailyChart = new Chart(ctxDaily, {
                                type: 'line',
                                data: {
                                    labels: labelsDaily,
                                    datasets: [{
                                        label: "TỔNG DOANH THU NGÀY",
                                        data: dataDaily,
                                        backgroundColor: "rgba(131, 2, 216, 0.2)",
                                        borderColor: "rgba(147, 2, 216, 1)",
                                        borderWidth: 1
                                    }]
                                },
                                options: commonOptions
                            });

                            // Monthly revenue chart
                            var ctxMonthly = document.getElementById('myMonthlyAreaChart').getContext('2d');
                            var myMonthlyChart = new Chart(ctxMonthly, {
                                type: 'line',
                                data: {
                                    labels: labelsMonthly,
                                    datasets: [{
                                        label: 'Doanh thu theo tháng',
                                        data: dataMonthly,
                                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: commonOptions
                            });

                            // Yearly revenue chart
                            var ctxYearly = document.getElementById('myYearlyAreaChart').getContext('2d');
                            var myYearlyChart = new Chart(ctxYearly, {
                                type: 'line',
                                data: {
                                    labels: labelsYearly,
                                    datasets: [{
                                        label: 'Doanh thu theo năm',
                                        data: dataYearly,
                                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                        borderColor: 'rgba(255, 99, 132, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: commonOptions
                            });
                        }
                    });
                </script>



                <script>
                         document.addEventListener('DOMContentLoaded', (event) => {
                             // Hàm để tạo màu ngẫu nhiên cho biểu đồ
                             function getRandomColor() {
                                 var letters = '0123456789ABCDEF';
                                 var color = '#';
                                 for (var i = 0; i < 6; i++) {
                                     color += letters[Math.floor(Math.random() * 16)];
                                 }
                                 return color;
                             }

                             // Dữ liệu giả lập, thay thế bằng dữ liệu thực từ server
                             var labels = [];
                             var data = [];
                             var backgroundColors = labels.map(() => getRandomColor());

                             var ctx = document.getElementById("myPieChart").getContext('2d');
                             var myPieChart = new Chart(ctx, {
                                 type: 'pie',
                                 data: {
                                     labels: labels,
                                     datasets: [{
                                         data: data,
                                         backgroundColor: backgroundColors,
                                     }],
                                 },
                                 options: {
                                     responsive: true,
                                     maintainAspectRatio: false, // Disable maintaining aspect ratio
                                     legend: {
                                         position: 'top',
                                     },
                                     animation: {
                                         animateScale: true,
                                         animateRotate: true
                                     }
                                 }
                             });
                         });
                </script>
         

       
       
    </section>
    
    </div>


	
	
	
	
	
	
	
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
			 .ListView1{
				 display:flex;
				text-align:center;
				justify-content:center;
			 }
            </style>
	<section style="display:flex; width:100%; gap:2rem; text-align:center; justify-content:center;">
	<asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang"
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
			
			<td><%#:Item.MaCTDH%></td>
			<td><%#:Item.Ngay%></td>			<td <%--class="td-longer"--%>><%#:Item.TenSP%></td>

			<td><%#:Item.SoLuong%></td>
			<td><%#:string.Format("{0:N0}", Item.Gia)%>đ</td>
									<td><%# string.Format("{0:N0}", Item.ThanhTien) %>đ</td>


			<%--<td>
				<a class="btn btn-default btn-color btn-w" href="EditAccount.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>
				<a class="btn btn-default btn-color btn-w" href="DeleteAccount.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>
			</td>--%>
		</ItemTemplate>
		<LayoutTemplate><div class="d-flex justify-content-center align-content-center">
			<table class="table" id="groupPlaceholderContainer" runat="server" style="width:100%;">
			
				<thead>
					<tr>
						
						<th>Mã Đơn</th>
						<th>Ngày</th>
						<th>Sản Phẩm</th>
						<th>Số Lượng</th>
						<th>Giá</th>
						<th>Thành Tiền</th>
						<%--<th></th>--%>
					</tr>
				</thead>
				<tbody>
					<tr id="groupPlaceholder"></tr>
				</tbody>
			</table></div>
		</LayoutTemplate>
		
	</asp:ListView>
	<div > <asp:GridView ID="GridViewMonthlyRevenue" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="Month" HeaderText="Tháng" />
                    <asp:BoundField DataField="Revenue" HeaderText="Doanh thu (VNĐ)" DataFormatString="{0:N0}" />
                </Columns>
            </asp:GridView>
            <br />
    <h6>Tổng Doanh Thu Năm <%#:Year %></h6>
            <asp:Label ID="LabelTotalRevenue" runat="server" Text="" style="font-size:20px; font-weight:bold;"></asp:Label></div>
	</section>
       
       
</asp:Content>
