<%-- 
    Document   : ao_phong
    Created on : Aug 2, 2019, 4:12:12 PM
    Author     : chinh
--%>

<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.SanPhamGet"%>
<%@page import="connect.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Áo phông</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/danh_sach.css">
	<script src="js/javascript.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" media="screen and (max-width: 765px)" href="css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%
    ConnectDB connectDB = new ConnectDB();
    SanPhamGet sanPhamGet = new SanPhamGet();
    ArrayList<SanPham> list = new ArrayList<SanPham>();
    
    String sortKey = "";
    if(request.getParameter("sortKey")!=null){
        sortKey = request.getParameter("sortKey");
    }
    list = sanPhamGet.getAoPhong(sortKey);
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<!-- <body> -->
		<div class="container">
			<div class="row">
				<br>
				<div class="col-md-12 col-sm-12 hidden-xs sap_xep">
					<div>
						<a href="index.jsp">
							<i class="fa fa-long-arrow-left" aria-hidden="true"></i> Trang chủ
						</a>
					</div>
					<span>Sắp xếp</span>
					<select id="sap_xep" onChange="window.location.href=this.value">
                                            <option value="ao_phong.jsp?sortKey=bestseller" <% if(sortKey.equals("bestseller")) out.print("selected"); %>>Bán nhiều nhất</option>
                                            <option value="ao_phong.jsp?sortKey=newest" <% if(sortKey.equals("newest")) out.print("selected"); %>>Mới nhất</option>
                                            <option value="ao_phong.jsp?sortKey=maxtomin" <% if(sortKey.equals("maxtomin")) out.print("selected"); %>>Giá: Từ cao đến thấp</option>
                                            <option value="ao_phong.jsp?sortKey=mintomax" <% if(sortKey.equals("mintomax")) out.print("selected"); %>>Giá: Từ thấp đến cao</option>
                                            <option value="ao_phong.jsp?sortKey=atoz" <% if(sortKey.equals("atoz")) out.print("selected"); %>>A-Z</option>
                                            <option value="ao_phong.jsp?sortKey=ztoa" <% if(sortKey.equals("ztoa")) out.print("selected"); %>>Z-A</option>
					</select>
				</div>
				<div class="clear"><br><br></div>
				<div class="col-md-12 col-sm-12 col-xs-12">
                                    <%
                                        for(int i = 0; i<list.size(); i++){
                                            out.println("<div class='col-md-3 col-sm-4 col-xs-6 danh_sach_sp'>");
                                            out.println("<a href='chi_tiet_sp.jsp?id_sanpham=" + list.get(i).getId_sanpham() + "'>");
                                            out.println("<img src='" + list.get(i).getAnh() + "'>");
                                            out.println("</a>");
                                            out.println("<h3><a href='#'>" + list.get(i).getTensanpham() + "</a></h3>");
                                            out.println("<div>" + list.get(i).getGia() + " VND</div>");
                                            out.println("<a href='GioHangServlet?size=L&id_sanpham=" + list.get(i).getId_sanpham() + "&command=add'><button>Thêm vào giỏ hàng</button></a>");
                                            out.println("</div>");
                                        }
                                    %>
				</div>
			</div>
		</div>
	<!-- </body> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>