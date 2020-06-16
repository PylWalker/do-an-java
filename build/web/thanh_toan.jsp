<%-- 
    Document   : thanh_toan
    Created on : Sep 10, 2019, 12:54:59 PM
    Author     : chinh
--%>

<%@page import="model.Users"%>
<%@page import="get.NhanHieuGet"%>
<%@page import="java.util.List"%>
<%@page import="model.ItemGioHang"%>
<%@page import="model.GioHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Thanh toán</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/thanh_toan.css">
	<script src="js/thanh_toan.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%
    session = request.getSession();
    GioHang gioHang = (GioHang) session.getAttribute("giohang");
    if(gioHang == null||gioHang.getList().size()==0){
        response.sendRedirect("danh_sach_sp.jsp");
    }
    Users user = (Users) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("gio_hang.jsp?error=1");
    }
    List<ItemGioHang> list = gioHang.getList();
    int totalBill = 0;
    for(ItemGioHang itemGioHang : list){
        totalBill += itemGioHang.getPrice()*itemGioHang.getQuantity();
    }
    NhanHieuGet nhanHieuGet = new NhanHieuGet();    
%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-7 col-sm-12 col-xs-12" id="thanh_toan_left">		
				<div><a href="index.jsp"><img src="images/unnamed.png"></a></div>	
				<!--giao diện giỏ hàng điện thoại -->
				<div class="hidden-md hidden-lg order_summary">
					<button type="button" data-toggle="collapse" data-target="#order_summary">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i><h5>Order_summary</h5>
					</button>
					<div id="order_summary" class="collapse">
                                                <% for(int i = 0; i<list.size(); i++){ %>
						<table class="col-xs-12">
							<tr class="col-xs-2">
								<td rowspan="2">
									<img src="<% out.print(list.get(i).getSanPham().getAnh()); %>">
								</td>
							</tr>
							<tr class="col-xs-10" style="padding: 0px;">
								<td colspan="3">
									<h4><b><% out.print(list.get(i).getSanPham().getTensanpham()); %></b></h4>
								</td>
							</tr>
							<tr class="col-xs-10"style="padding: 0px;">
								<td>
									<div>
										<b>Số lượng: </b>
										<span><% out.print(list.get(i).getQuantity()); %></span>
									</div>
								</td>
								<td>
									<div>											
										<b>Size: </b>
										<span><% out.print(list.get(i).getSize()); %></span>
									</div>
								</td>
								<td>
									<div>
										<b>Giá: </b>
										<span><% out.print(list.get(i).getQuantity()*list.get(i).getPrice() + " VND"); %></span>
									</div>
								</td>
							</tr>
						</table>
						<div style="clear: both;"></div>
						<div style="width: 100%;border-top: 1px solid;margin-top: 10px;"></div>
                                                <% } %>
						<div>
							<h4  style="display: inline; float: left;">Tổng tiền: </h4>
							<h4  style="display: inline; float: right;"><% out.print(totalBill + " VND"); %></h4>
						</div>
					</div>
				</div>
				<!--/giao diện giỏ hàng điện thoại -->
				<div style="clear: both;"></div>
				<div id="thanh_toan_tai_nha">
                                    <h5><strong>Thanh toán nhanh</strong></h5>
                                    <form action="ThanhToanServlet" method="get" onsubmit="return check_pay1()">
                                            <div><input type="text" name="card_number" id="card_number0" placeholder="Số thẻ"></div>
                                            <div id="er_card_number" style="color: red;"></div>
                                            <div><input type="text" name="name" id="name0" placeholder="Tên trên thẻ"></div>
                                            <div id="er_name"  style="color: red;"></div>
                                            <div><input type="text" name="expire_date" id="expire_date0" placeholder="Ngày hết hạn - MM/YY"></div>
                                            <div id="er_expire_date"></div>
                                            <div><input type="number" name="cvv" id="cvv0" placeholder="CVV"></div>
                                            <div id="er_cvv"></div>
                                            <div><input type="text" name="phone" id="phone0" placeholder="Số điện thoại"></div>
                                            <div id="er_phone0"></div>
                                            <div><input type="text" name="address" id="address0" placeholder="Địa chỉ"></div>
                                            <div id="er_address0"></div>
                                            <div><textarea name="note" placeholder="Ghi chú" rows="3"></textarea></div>
                                            <div id="btn_shipping">
                                                <input type="hidden" name="command" value="quick-payment">
                                                <input type="submit" value="Đặt hàng">
                                                <a href="gio_hang.jsp"><img src="https://img.icons8.com/ios-glyphs/15/000000/arrow-pointing-left--v2.png"> Quay lại giỏ hàng </a>
                                            </div>
					</form>
				</div>
				<div class="or">
					<h5>Hoặc</h5>
				</div>
				<div id="thanh_toan_tai_nha">
                                    <h5><strong>Thanh toán khi nhận hàng</strong></h5>
					<form action="ThanhToanServlet" method="get" onsubmit="return check_pay()">
                                            <div><input type="text" name="name" id="full_name" placeholder="Họ và tên"></div>
                                            <div id="er_full_name"></div>
                                            <div><input type="text" name="phone" id="phone" placeholder="Số điện thoại"></div>
                                            <div id="er_phone"></div>
                                            <div><input type="text" name="address" id="address" placeholder="Địa chỉ"></div>
                                            <div id="er_address"></div>
                                            <div><textarea name="note" placeholder="Ghi chú" rows="3"></textarea></div>
                                            <div id="btn_shipping">
                                                <input type="hidden" name="command" value="cash">
                                                <input type="submit" value="Đặt hàng">
                                                <a href="gio_hang.jsp"><img src="https://img.icons8.com/ios-glyphs/15/000000/arrow-pointing-left--v2.png"> Quay lại giỏ hàng </a>
                                            </div>
					</form>
				</div>
			</div>
			<div class="col-md-5 hidden-sm hidden-xs" id="thanh_toan_right">
				<% for(int i = 0; i<list.size(); i++){ %>
						<table class="col-xs-12">
							<tr class="col-xs-2">
								<td rowspan="2">
									<img src="<% out.print(list.get(i).getSanPham().getAnh()); %>">
								</td>
							</tr>
							<tr class="col-xs-10" style="padding: 0px;">
								<td colspan="3">
									<h4><b><% out.print(list.get(i).getSanPham().getTensanpham()); %></b></h4>
								</td>
							</tr>
							<tr class="col-xs-10"style="padding: 0px;">
								<td>
									<div>
										<b>Số lượng: </b>
										<span><% out.print(list.get(i).getQuantity()); %></span>
									</div>
								</td>
								<td>
									<div>											
										<b>Size: </b>
										<span><% out.print(list.get(i).getSize()); %></span>
									</div>
								</td>
								<td>
									<div>
										<b>Giá: </b>
										<span><% out.print(list.get(i).getQuantity()*list.get(i).getPrice() + " VND"); %></span>
									</div>
								</td>
							</tr>
						</table>
						<div style="clear: both;"></div>
						<div style="width: 100%;border-top: 1px solid;margin-top: 10px;"></div>
                                                <% } %>
				<div>
					<h4  style="display: inline; float: left;">Tổng tiền: </h4>
					<h4  style="display: inline; float: right;"><% out.print(totalBill + " VND"); %></h4>
				</div>
			</div>
		</div>
	</div>
</body>
</html>