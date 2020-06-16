<%@page import="connect.ConnectDB"%>
<%@page import="model.SanPham"%>
<%--<%@page import="get.TheLoaiGet"%>--%>
<%@page import="get.SanPhamGet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ĐÁNH GIÁ SẢN PHẨM - FASHION FOR MAN</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->



<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
    </head>
    <body>
         <%
           SanPhamGet sanphamGet = new SanPhamGet();
            SanPham sanpham = new SanPham();
            String id_sanpham = "";
//            if (request.getParameter("id_sanpham") != null) {
          id_sanpham = request.getParameter("id_sanpham");
          sanpham = sanphamGet.getProductt(Integer.parseInt(id_sanpham));
            
        %>
        <jsp:include page="header.jsp"></jsp:include>
         <div class="banner-top">
	<div class="container">
		<h2 class="" data-wow-delay=".5s">ĐÁNH GIÁ SẢN PHẨM</h2>
		<h3 class="" data-wow-delay=".5s"><a href="index.jsp">Trang Chủ</a><label>/</label>Đánh giá sản phẩm</h3>
		<div class="clearfix"> </div>
	</div>
</div>
         <div class="login">
		<div class="container">
                    <div class="col-md-8 contact-grids1 animated wow fadeInRight" data-wow-delay=".5s">
                        <form action="ReviewServlet" method="post">
                                    <input type="hidden" name="id_sanpham" value="<%=sanpham.getId_sanpham()%>">
                        <input type="hidden" name="id_danhgia" value="1">
						<div class="contact-form2">
							<h4>Họ và tên</h4>
							
								<input type="text" name = "namee" placeholder="" required>
							
						</div>
						
				
						<div class="contact-form2">
							<h4>Email</h4>
						
								<input type="email" name="email" placeholder="" required>
						
						</div>
						
					<fieldset class="starability-basic">
                                   
                                    <input type="radio" id="rate5" name="rating" value="5" />
                                    <label for="rate5" title="Toẹt vời">5 stars</label>
                                    <input type="radio" id="rate4" name="rating" value="4" />
                                    <label for="rate4" title="Cũng được">4 stars</label>
                                    <input type="radio" id="rate3" name="rating" value="3" />
                                    <label for="rate3" title="Bình thường thôi">3 stars</label>
                                     <input type="radio" id="rate2" name="rating" value="2" />
                                    <label for="rate2" title="Hơi xấu đấy">2 stars</label>
                                    <input type="radio" id="rate1" name="rating" value="1" />
                                    <label for="rate1" title="Quá tệ">1 star</label>
                                    </fieldset>
			
				<div class="contact-me ">
					<h4>Đánh giá</h4>
				
                                        <textarea type="text" name="message"  placeholder="" required> </textarea>
						</div>
				<input type="hidden" name="command" value="insert">		
                                    <input type="submit" class="button" value="Gửi đánh giá">
				</form>
				
			</div>
         
         <div class="clearfix"> </div>
         </div>
	</div> 
         <div class="clearfix"> </div>
         
        
        <div class="social animated wow fadeInUp" data-wow-delay=".1s">
	<div class="container">
		<div class="col-sm-3 social-ic">
			<a href="#">FACEBOOK</a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#">TWITTER</a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#">GOOGLE+</a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#">PINTEREST</a>
		</div>
	<div class="clearfix"></div>
	</div>
</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>



