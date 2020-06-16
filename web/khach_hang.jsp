<%-- 
    Document   : khach_hang
    Created on : Sep 11, 2019, 11:54:33 PM
    Author     : chinh
--%>

<%@page import="model.HoaDon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.HoaDonGet"%>
<%@page import="model.Users"%>
<%@page import="get.UsersGet"%>
<%@page import="connect.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Khách hàng</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/khach_hang.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<%
    ConnectDB connectDB = new ConnectDB();
    UsersGet usersGet = new UsersGet();
    HoaDonGet hoaDonGet = new HoaDonGet();
    String id_user_tmp = request.getParameter("id_user");
    int id_user = Integer.parseInt(id_user_tmp);
    Users user = usersGet.getInfo(id_user);
    ArrayList<HoaDon> list = hoaDonGet.getHoaDonByUser(id_user);
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<div class="container"  id="thong_tin_khach_hang">
		<div class="row">
			<div class="col-md-12 col-xs-12 col-xs-12">
                            <h1>&nbsp;Thông tin khách hàng</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<form method ="POST" action="cap_nhat_thong_tin.jsp?id_user=<% out.print(user.getId_user()); %>">
					<input type="text" value="<% out.print(user.getUser_name()); %>" readonly>
					<input type="text" value="<% out.print(user.getUser_email()); %>" readonly>
					<input type="text" value="<% out.print(user.getUser_phone()); %>" readonly>
					<input type="password" value="********" readonly>
                                        <input type="submit" value="Cập nhập thông tin">&nbsp;&nbsp;<a href="dang_xuat.jsp"><input type="button" value="Đăng xuất"></a>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-xs-12">
				<h1>Lịch sử mua hàng</h1>
				<table class="table">
					<tr>
						<th>#</th>
						<th>Mã hóa đơn</th>
						<th>Tổng hóa đơn</th>
						<th>Thanh toán</th>
						<th>Địa chỉ</th>
						<th>Ngày mua</th>
					</tr>
                                        <% for(int i = 0; i<list.size(); i++){ %>
					<tr>
                                            <td><% out.print(i); %></td>
						<td><% out.print("<a href=chi_tiet_hoa_don.jsp?id_hoadon=" + list.get(i).getId_hoadon()+ ">" + list.get(i).getId_hoadon() + "</a>"); %></td>
						<td><% out.print(list.get(i).getId_hoadon());%></td>
						<td><% out.print(list.get(i).getPhuongthucthanhtoan()); %></td>
						<td><% out.print(list.get(i).getDiachi()); %></td>
						<td><% out.print(list.get(i).getNgaymua()); %></td>
					</tr>
					<% } %>
				</table>
			</div>
		</div>
	</div>
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</html>
