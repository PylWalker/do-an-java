<%-- 
    Document   : index
    Created on : Aug 28, 2019, 11:47:30 PM
    Author     : chinh
--%>

<%@page import="model.GioHang"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fashion For Men </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="https://img.icons8.com/ios-filled/50/000000/circled-f.png">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> 
            addEventListener("load", function(){ setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ 
                window.scrollTo(0,1);
            }
        </script>
        <style>
            .danh_sach_sp >a>img{
    width:100%;
    height:300px;
}
        </style>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/index.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="js/jquery.min.js"></script>
        <!-- //js -->
        <!-- countdown -->
        <link rel="stylesheet" href="css/jquery.countdown.css" />
        <!-- //countdown -->
        <!-- cart -->
        <!-- <script src="js/simpleCart.min.js"></script> -->
        <!-- cart -->
        <!-- for bootstrap working -->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <!-- <link href='//fonts.googleapis.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'> -->
        <!-- start-smooth-scrolling -->
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){		
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                });
            });
        </script>
        <!-- //end-smooth-scrolling -->
    </head>
    <%
        Users user = null;
        GioHang gioHang = null;
        int quantity = 0;
        if(session.getAttribute("user")!=null){
            user = (Users)session.getAttribute("user");
        }
        if(session.getAttribute("giohang")!=null){
            gioHang = (GioHang)session.getAttribute("giohang");
            quantity = gioHang.getList().size();
        }
    %>
    <body>
	<!-- header -->
        <div class="modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88" aria-hidden="true">
        
            <div class="modal-dialog modal-lg">
                
                <div class="modal-content">
                    
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
                        <h4 class="modal-title" id="myModalLabel"> Đăng nhập ngay! </h4>
                    </div>
                    <div class="modal-body modal-body-sub">
                        <div class="row">
                            <div class="col-md-8 modal_body_left modal_body_left1" style="border-right: 1px dotted #C2C2C2;padding-right:3em;">
                                <div class="sap_tabs">	
                                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                                        <ul>
                                            <li class="resp-tab-item" aria-controls="tab_item-0"><span>Đăng nhập</span></li>
                                            <li class="resp-tab-item" aria-controls="tab_item-1"><span>Đăng ký</span></li>
                                        </ul>
                                        <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                            <div class="facts">
                                                <div class="register">
                                                    <form action="UsersServlet" method="get">
                                                        <input placeholder="Email" name="email" type="email" required="">	
                                                        <input placeholder="Mật khẩu" name="mat_khau" type="password" required="">
                                                        <input type="hidden" name="command" value="login">
                                                        <div class="sign-up">
                                                            <input type="submit" value="Đăng nhập"/>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                                            <div class="facts">
                                                <div class="register">
                                                    <form action="UsersServlet" method="get">			
                                                        <input placeholder="Tên" name="ten" type="text" required="">
                                                        <input placeholder="Email" name="email" type="email" required="">	
                                                        <input placeholder="Mật khẩu" name="mat_khau" type="password" required="">	
                                                        <input placeholder="Xác nhận mật khẩu" name="mat_khau_2" type="password" required="">
                                                        <input type="hidden" name="command" value="insert">
                                                        <div class="sign-up">
                                                            <input type="submit" value="Tạo tài khoản"/>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div> 			        					            	      
                                    </div>
                                </div>
                                <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('#horizontalTab').easyResponsiveTabs({
                                            type: 'default', //Types: default, vertical, accordion           
                                            width: 'auto', //auto or any width like 600px
                                            fit: true   // 100% fit in a container
                                        });
                                    });
                                </script>
                                <div id="OR" class="hidden-xs"></div>
                            </div>
                            <div class="col-md-4 modal_body_right modal_body_right1">
                                <div class="row text-center sign-with">
                                    <div class="col-md-12">
                                        <h3 class="other-nw"> Đăng nhập với </h3>
                                    </div>
                                    <div class="col-md-12">
                                        <ul class="social">
                                            <li class="social_facebook"><a href="#" class="entypo-facebook"></a></li>
                                            <li class="social_dribbble"><a href="#" class="entypo-dribbble"></a></li>
                                            <li class="social_twitter"><a href="#" class="entypo-twitter"></a></li>
                                            <li class="social_behance"><a href="#" class="entypo-behance"></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
                            
		</div>

        <!--<script>
            $('#myModal88').modal('show');
        </script> -->
        <div class="header">
            <div class="container">
                <% if(user == null){ %>
                    <div class="w3l_login">
                        <a style="border: 1px solid #BEBEBE;" href="<% if(user==null) out.print('#'); else out.print("khach_hang.jsp?id_user=" + user.getId_user()); %>" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                    </div>
                <% } else { %>
                    <div class="w3l_login">
                        <a style="border: none" href="<% if(user==null) out.print('#'); else out.print("khach_hang.jsp?id_user=" + user.getId_user()); %>"><img class="ava" src="images/index/user.png"></a>
                    </div>
                <% } %>
                <div class="w3l_logo">
                    <h1><a href="index.jsp">Fashion For Men<span>For Fashion Lovers</span></a></h1>
                </div>
                <div class="cart box_1">
                    <!-- <a href="checkout.html"> -->
                    <a href="gio_hang.jsp">
                        <div class="total">
                        <!-- <span class="simpleCart_total">$300</span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items) -->
                        <span><% out.print(quantity); %> sản phẩm</span>
                        </div>
                        <img src="images/index/bag.png" alt="bag"/>
                    </a>
                    <p><a href="GioHangServlet?command=remove-all" class="simpleCart_empty">Xóa giỏ hàng</a></p>
                    <div class="clearfix"> </div>
                </div>
                <div class="search" style="position: relative; float: left;">
                    <a href="/projectbanhang/admin/index.jsp"><img src="https://img.icons8.com/dotty/30/000000/admin-settings-male.png"></a>
                </div>
                <div class="clearfix"> </div>
            </div>
		</div>
        <div class="navigation">
            <div class="container">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp" class="act"> Trang chủ </a></li>	
                            <!-- Mega Menu -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Sản phẩm <b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <ul class="multi-column-dropdown">
                                                <h6>Áo</h6>
                                                <li><a href="ao_so_mi.jsp">Áo Sơ Mi<span>Mới</span></a></li>
                                                <li><a href="ao_vest.jsp">Áo Vest</a></li>
                                                <li><a href="ao_phong.jsp">Áo Phông<span>Mới</span></a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-5">
                                            <ul class="multi-column-dropdown">
                                                <h6>Quần</h6>
                                                <li><a href="quan_dai.jsp">Quần Dài</a></li>
                                                <li><a href="quan_short.jsp">Quần Short<span>Mới</span></a></li>
                                                <li></li>
                                                <li><a href="danh_sach_sp.jsp"><i>Tất cả sản phẩm</i></a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="w3ls_products_pos">
                                                <h4>Up to 50% Off</h4>
                                                <img src="images/index/product.png" alt="" class="img-responsive" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li><a href="gioi_thieu.jsp">Giới Thiệu</a></li>
                            <li><a href="lien_he.jsp">Liên Hệ</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
		</div>
		<!-- end header -->
</body>
</html>