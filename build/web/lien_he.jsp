<%-- 
    Document   : lien_he
    Created on : Sep 10, 2019, 11:53:13 AM
    Author     : chinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Liên hệ</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/lien_he.css">
	<script src="js/lien_he.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" media="screen and (max-width: 765px)" href="css/danh_sach.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            function check_lh(){
                var check_full_name = /^[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?0123456789]*$/;
                var check_email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                var full_name = document.getElementById("full_name").value;
                var email = document.getElementById("email").value;

                if (full_name == "") {
                        document.getElementById("er_full_name").innerHTML="Nhập họ tên";
                        return false;
                }else if(check_full_name.test(full_name)){
                        document.getElementById("er_full_name").innerHTML="Sai định dạng họ tên";
                        return false;
                }else{
                        document.getElementById("er_full_name").style.display="none";
                }

                if(email = ""){
                    document.getElementById("er_emails").innerHTML="Nhập email";
                    return false;
                } else if(!check_email.test(email)){
                        document.getElementById("er_email").innerHTML="Sai định dạng email";
                        return false;
                } else{
                    document.getElementById("er_email").style.display="none";
                    alert("Gửi liên hệ thành công")
                }

            }
        </script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<!-- <body> -->
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-sm-2 col-xs-1"></div>
			<div class="col-md-8 col-sm-8 col-xs-10" id="lien_he">
                            <form action="LienHeServlet" method="get" accept-charset="utf-8" onsubmit="return check_lh()">
					<div>Họ tên</div>
					<input type="text" name="full_name" class="lien_he">
                                        <div id="er_full_name"></div>
					<div>Email</div>
                                        <input type="email" name="email" class="lien_he">
                                        <div id="er_email"></div>
					<div>Tiêu đề</div>
                                        <input type="text" name="title" class="lien_he">
					<div>Nội dung</div>
                                        <textarea rows="10" name="description"></textarea><br><br>
					<br>
                                        <input type="submit" value="Gửi liên hệ" id="btn_lien_he">
				</form>
			</div>
			<div class="col-md-2 col-sm-2 col-xs-1"></div>
		</div>
	</div>
	<!-- </body> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
