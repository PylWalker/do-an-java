<%-- 
    Document   : footer
    Created on : Aug 19, 2019, 2:42:03 PM
    Author     : chinh
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Users user = null;
    if(session.getAttribute("user")!=null){
        user = (Users)session.getAttribute("user");
    }
%>
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>Liên Hệ</h3>
                                        <img style="margin-left: 30px;" src="https://img.icons8.com/wired/50/000000/detective.png"><a href="#" style="text-decoration: none;"><p style="color: #ff9b05; font-weight: bold">Fashion For Men</p></a>
					<ul class="address">
                                            <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i><a href="https://maps.google.com/maps?ll=21.001338,105.804636&z=13&t=m&hl=en-US&gl=US&mapclient=embed&q=98%20Ng%E1%BB%A5y%20Nh%C6%B0%20Kon%20Tum%20Thanh%20Xu%C3%A2n%20Trung%20Thanh%20Xu%C3%A2n%20H%C3%A0%20N%E1%BB%99i">98 Ngụy Như Kon Tum, Hà Nội</a></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:hieuvip444@gmail.com">hieuvip444@gmail.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>0902132511</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
                                    <h3>Thông tin</h3>
                                    <ul class="info"> 
                                        <li><a href="gioi_thieu.jsp">Về chúng tôi</a></li>
                                        <li><a href="lien_he.jsp">Liên hệ</a></li>
                                    </ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
                                    <h3>Thể loại</h3>
                                    <ul class="info"> 
                                        <li><a href="ao_so_mi.jsp">Áo Sơ Mi</a></li>
                                        <li><a href="ao_phong.jsp">Áo Phông</a></li>
                                        <li><a href="ao_vest.jsp">Áo Vest</a></li>
                                        <li><a href="quan_dai.jsp">Quần Dài</a></li>
                                        <li><a href="quan_short.jsp">Quần Short</a></li>
                                    </ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
                                    <% if(session.getAttribute("user")!=null){ %>
                                    <h3>Khách hàng</h3>
                                    <ul class="info"> 
                                        <li><a href="khach_hang.jsp?id_user=<% out.println(user.getId_user()); %>">Thông tin cá nhân</a></li>
                                        <li><a href="gio_hang.jsp">Giỏ hàng</a></li>
                                    </ul>
                                    <% } %>
                                    <h4>Giới thiệu</h4>
                                    <div class="agileits_social_button">
                                        <ul>
                                            <li><a href="#" class="facebook"> </a></li>
                                            <li><a href="#" class="twitter"> </a></li>
                                            <li><a href="#" class="google"> </a></li>
                                            <li><a href="#" class="pinterest"> </a></li>
                                        </ul>
                                    </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="footer-copy">
                    <div class="footer-copy1">
                        <div class="footer-copy-pos">
                            <a href="#"><img src="images/index/arrow.png" alt=" " class="img-responsive" /></a>
                        </div>
                    </div>
                    <div class="container">
                        <p>&copy; 2019 Fashion For Men. All rights reserved | Design by <a href="http://facebook.com/hieubomhahaa">Hiếu Bom Haha</a></p>
                    </div>
		</div>
	</div>
<!-- //footer -->
</body>
</html>
