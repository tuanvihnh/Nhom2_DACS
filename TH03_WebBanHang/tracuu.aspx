<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tracuu.aspx.cs" Inherits="TH03_WebBanHang.tracuu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <div class="search-container container mt-3" style="border: 0.3px solid #ccc;">
                            <asp:TextBox ID="searchinput" Text="" runat="server" Style="border: 0.1px solid #FFFFFF; touch-action: none;"></asp:TextBox>
                            <asp:Button runat="server" ID="btnSearch" CssClass="searchbutton"  Text="" />
                            <style>
                                .searchbutton {
                                    background-image: url('Content/icon/loupe.png');
                                    background-repeat: no-repeat;
                                    background-size: contain; /* Thay đổi kích thước ảnh nếu cần */
                                    width: 18px; /* Độ rộng của nút */
                                    height: 18px; /* Độ cao của nút */
                                    border: none; /* Xóa viền của nút */
                                    cursor: pointer; /* Biểu tượng con trỏ khi rê chuột vào nút */
                                    margin-top: 4%;
                                    margin-left: 2%;
                                }
                            </style>
                        </div>
    </form>
</body>
</html>
