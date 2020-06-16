<%-- 
    Document   : cap_nhat_thong_tin
    Created on : Sep 12, 2019, 3:29:13 PM
    Author     : chinh
--%>

<%@page import="model.HoaDon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page import="get.HoaDonGet"%>
<%@page import="get.UsersGet"%>
<%@page import="connect.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cập nhập thông tin</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/cap_nhat_thong_tin.css">
	<script src="js/cap_nhat_thong_tin.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<%
    ConnectDB connectDB = new ConnectDB();
    UsersGet usersGet = new UsersGet();
    String id_user_tmp = request.getParameter("id_user");
    int id_user = Integer.parseInt(id_user_tmp);
    Users user = usersGet.getInfo(id_user);
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<div class="container" id="cap_nhap_thong_tin">
		<div class="row">
			<div class="col-md-12 col-xs-12 col-xs-12">
                            <h1>&nbsp;Cập nhập thông tin tài khoản</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<form method ="get" action="UsersServlet">
                                    <input type="text" name="ten" style="margin: 10px 0px 26px;" value="<% out.print(user.getUser_name()); %>">

                                        <input type="text" value="<% out.print(user.getUser_email()); %>" id="cap_nhap_email" placeholder="Email" readonly>
					<div id="loi_cap_nhap_email"></div>

                                        <input type="text" name="so_dien_thoai" value="<% out.print(user.getUser_phone()); %>" id="cap_nhap_sdt" placeholder="Số điện thoại">
					<div id="loi_cap_nhap_sdt"></div>

                                        <input type="password" name="mat_khau" value="<% out.print(user.getUser_pass()); %>" id="cap_nhap_mk" placeholder="Mật khẩu">
					<div id="loi_cap_nhap_mk"></div>

                                        <input type="password" name="cf_mat_khau" id="cap_nhap_xac_nhan_mk" value="<% out.print(user.getUser_pass()); %>" placeholder="Xác nhận mật khẩu">
					<div id="loi_cap_nhap_xac_nhan_mk"></div>
                                        <input type="hidden" name="id_user" value="<% out.print(user.getId_user()); %>">
                                        <input type="hidden" name="command" value="update">
					<input type="submit" value="Lưu">
					<input type="button" value="Hủy" onclick="replace()">
				</form>
			</div>
		</div>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
       <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%
    if(request.getParameter("error")!=null){
        if(request.getParameter("error").equals("1")){
            out.print("<script>");
            out.print("alert('Cập nhật thông tin không thành công!!!');");
            out.print("</script>");
        }
    } else {
        out.print("");
    }
%>