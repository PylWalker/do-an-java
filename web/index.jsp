<%-- 
    Document   : index
    Created on : Aug 28, 2019, 11:47:30 PM
    Author     : chinh
--%>

<%@page import="get.UsersGet"%>
<%@page import="get.SanPhamGet"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
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
        SanPhamGet sanPhamGet = new SanPhamGet();
        UsersGet usersGet = new UsersGet();
        int quantity = 0;
        if(session.getAttribute("user")!=null){
            user = (Users)session.getAttribute("user");
        }
        if(session.getAttribute("giohang")==null){
            gioHang = new GioHang();
            session.setAttribute("giohang", gioHang);
        } else if(session.getAttribute("giohang")!=null){
            gioHang = (GioHang)session.getAttribute("giohang");
            quantity = gioHang.getList().size();
        }
        ArrayList<SanPham> listAoSoMiMoi = new ArrayList<SanPham>();
        listAoSoMiMoi = sanPhamGet.getAoSoMiMoi();
        ArrayList<SanPham> listAoVestMoi = new ArrayList<SanPham>();
        listAoVestMoi = sanPhamGet.getAoVestMoi();
        ArrayList<SanPham> listQuanDaiMoi = new ArrayList<SanPham>();
        listQuanDaiMoi = sanPhamGet.getQuanDaiMoi();
        ArrayList<SanPham> listSanPhamMoi = new ArrayList<SanPham>();
        listSanPhamMoi = sanPhamGet.getSanPhamMoi();
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
                                                        <input placeholder="Số điện thoại" name="so_dien_thoai" type="text" required="" style="margin-top: 1em;">
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
<!--                            <div class="col-md-4 modal_body_right modal_body_right1">
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
                            </div>-->
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
                    <a href="gio_hang.jsp">
                        <div class="total">
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
                                                <li>&nbsp;</li><li>&nbsp;</li>
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
		<!-- banner -->
		<div class="banner" id="home1">
				<div class="container">
					<h3>fashions fade, <span>style is eternal</span></h3>
				</div>
		</div>
		<!-- end banner -->
		<!-- banner-bottom -->
		<div class="banner-bottom">
                <div class="container">
                    <div class="col-md-5 wthree_banner_bottom_left">
                        <div class="video-img"></div>		
                    </div>
                    <div class="col-md-7 wthree_banner_bottom_right">
                        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                            <ul id="myTab" class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home">Áo sơ mi mới</a></li>
                                <li role="presentation"><a href="#watches" role="tab" id="watches-tab" data-toggle="tab" aria-controls="watches">Áo vest mới</a></li>
                                <li role="presentation"><a href="#sandals" role="tab" id="sandals-tab" data-toggle="tab" aria-controls="sandals">Quần dài mới</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                                    <div class="agile_ecommerce_tabs">
                                        <% for(int i = 0; i<listAoSoMiMoi.size(); i++){ %>
                                        <div class="col-md-4 agile_ecommerce_tab_left">
                                            <div class="hs-wrapper">
                                                <img src="<% out.print(listAoSoMiMoi.get(i).getAnh()); %>" alt="Sale" class="img-responsive" />
                                                <div class="w3_hs_bottom">
                                                    <ul>
                                                        <li>
                                                            <a href="#" data-toggle="modal" data-target="#myModal<% out.print(listAoSoMiMoi.get(i).getId_sanpham()); %>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                                <h5><a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(listAoSoMiMoi.get(i).getId_sanpham()); %>"><% out.print(listAoSoMiMoi.get(i).getTensanpham()); %></a></h5>
                                            <div class="simpleCart_shelfItem">
                                                <p><span><% out.print(listAoSoMiMoi.get(i).getGia() + 100000); %></span> <i class="item_price"><% out.print(listAoSoMiMoi.get(i).getGia()); %> VND</i></p>
                                                <p><a class="item_add" href="GioHangServlet?command=add&size=L&id_sanpham=<% out.print(listAoSoMiMoi.get(i).getId_sanpham()); %>">Thêm Giỏ Hàng</a></p>
                                            </div>
                                        </div>
                                        <% } %>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="watches" aria-labelledby="watches-tab">
                                    <div class="agile_ecommerce_tabs">
                                        <% for(int i = 0; i<listAoVestMoi.size(); i++){ %>
                                        <div class="col-md-4 agile_ecommerce_tab_left">
                                            <div class="hs-wrapper">
                                                <img src="<% out.print(listAoVestMoi.get(i).getAnh()); %>" alt=" " class="img-responsive" />
                                                <div class="w3_hs_bottom">
                                                    <ul>
                                                        <li>
                                                            <a href="#" data-toggle="modal" data-target="#myModal<% out.print(listAoVestMoi.get(i).getId_sanpham()); %>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h5><a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(listAoVestMoi.get(i).getId_sanpham()); %>"><% out.print(listAoVestMoi.get(i).getTensanpham()); %></a></h5>
                                            <div class="simpleCart_shelfItem">
                                                <p><span><% out.print(listAoVestMoi.get(i).getGia() + 100000); %></span> <i class="item_price"><% out.print(listAoVestMoi.get(i).getGia()); %> VND</i></p>
                                                <p><a class="item_add" href="GioHangServlet?command=add&size=L&id_sanpham=<% out.print(listAoVestMoi.get(i).getId_sanpham()); %>">Thêm Giỏ Hàng</a></p>
                                            </div>
                                        </div>
                                        <% } %>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="sandals" aria-labelledby="sandals-tab">
                                    <div class="agile_ecommerce_tabs">
                                        <% for(int i = 0; i<listQuanDaiMoi.size(); i++){ %>
                                        <div class="col-md-4 agile_ecommerce_tab_left">
                                            <div class="hs-wrapper">
                                                <img src="<% out.print(listQuanDaiMoi.get(i).getAnh()); %>" alt=" " class="img-responsive" />
                                                <div class="w3_hs_bottom">
                                                    <ul>
                                                        <li>
                                                            <a href="#" data-toggle="modal" data-target="#myModal<% out.print(listQuanDaiMoi.get(i).getId_sanpham()); %>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h5><a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(listQuanDaiMoi.get(i).getId_sanpham()); %>"><% out.print(listQuanDaiMoi.get(i).getTensanpham()); %></a></h5>
                                            <div class="simpleCart_shelfItem">
                                                <p><span><% out.print(listQuanDaiMoi.get(i).getGia() + 100000 + " VND"); %></span> <i class="item_price"><% out.print(listQuanDaiMoi.get(i).getGia()); %> VND</i></p>
                                                <p><a class="item_add" href="GioHangServlet?command=add&size=L&id_sanpham=<% out.print(listQuanDaiMoi.get(i).getId_sanpham()); %>">Thêm Giỏ Hàng</a></p>
                                            </div>
                                        </div>
                                        <% } %>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--modal-video-->
                        <% for(int i = 0; i<listAoSoMiMoi.size(); i++){ %>
                            <div class="modal video-modal fade" id="myModal<% out.print(listAoSoMiMoi.get(i).getId_sanpham()); %>" tabindex="-1" role="dialog" aria-labelledby="myModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                                        </div>
                                        <section>
                                            <div class="modal-body">
                                                <div class="col-md-5 modal_body_left">
                                                    <img src="<% out.print(listAoSoMiMoi.get(i).getAnh()); %>" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="col-md-7 modal_body_right">
                                                    <h4><% out.print(listAoSoMiMoi.get(i).getTensanpham()); %></h4>
                                                    <p><% out.print(listAoSoMiMoi.get(i).getMieuta()); %></p>
                                                    <div class="rating">
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="modal_body_right_cart simpleCart_shelfItem">
                                                        <p><span><% out.print(listAoSoMiMoi.get(i).getGia() + 100000); %></span> <i class="item_price"><% out.print(listAoSoMiMoi.get(i).getGia() + " VND"); %></i></p>
                                                        
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                        <% for(int i = 0; i<listAoVestMoi.size(); i++){ %>
                            <div class="modal video-modal fade" id="myModal<% out.print(listAoVestMoi.get(i).getId_sanpham()); %>" tabindex="-1" role="dialog" aria-labelledby="myModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                                        </div>
                                        <section>
                                            <div class="modal-body">
                                                <div class="col-md-5 modal_body_left">
                                                    <img src="<% out.print(listAoVestMoi.get(i).getAnh()); %>" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="col-md-7 modal_body_right">
                                                    <h4><% out.print(listAoVestMoi.get(i).getTensanpham()); %></h4>
                                                    <p><% out.print(listAoVestMoi.get(i).getMieuta()); %></p>
                                                    <div class="rating">
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="modal_body_right_cart simpleCart_shelfItem">
                                                        <p><span><% out.print(listAoVestMoi.get(i).getGia() + 100000 + " VND"); %></span> <i class="item_price"><% out.print(listAoVestMoi.get(i).getGia() + " VND"); %></i></p>
                                                        
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                        <% for(int i = 0; i<listQuanDaiMoi.size(); i++){ %>
                            <div class="modal video-modal fade" id="myModal<% out.print(listQuanDaiMoi.get(i).getId_sanpham()); %>" tabindex="-1" role="dialog" aria-labelledby="myModal">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                                        </div>
                                        <section>
                                            <div class="modal-body">
                                                <div class="col-md-5 modal_body_left">
                                                    <img src="<% out.print(listQuanDaiMoi.get(i).getAnh()); %>" alt=" " class="img-responsive" />
                                                </div>
                                                <div class="col-md-7 modal_body_right">
                                                    <h4><% out.print(listQuanDaiMoi.get(i).getTensanpham()); %></h4>
                                                    <p><% out.print(listQuanDaiMoi.get(i).getMieuta()); %></p>
                                                    <div class="rating">
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star-.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="rating-left">
                                                            <img src="images/index/star.png" alt=" " class="img-responsive" />
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="modal_body_right_cart simpleCart_shelfItem">
                                                        <p><span><% out.print(listQuanDaiMoi.get(i).getGia() + 100000 + " VND"); %></span> <i class="item_price"><% out.print(listQuanDaiMoi.get(i).getGia() + " VND"); %></i></p>
                                                        
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
<!-- //banner-bottom -->


	<!-- banner-bottom1 -->
	<div class="banner-bottom1">
		<div class="agileinfo_banner_bottom1_grids">
			<div class="col-md-7 agileinfo_banner_bottom1_grid_left">
			</div>
			<div class="col-md-5 agileinfo_banner_bottom1_grid_right">
				<h4>HOT DEAL</h4>
				<div class="timer_wrap">
					<div id="counter"> </div>
				</div>
				<script src="js/jquery.countdown.js"></script>
				<script src="js/script.js"></script>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //banner-bottom1 -->







<!-- new-products -->
    <div class="new-products">
        <div class="container">
            <h3>Sản Phẩm Mới Nhất</h3>
            <div class="agileinfo_new_products_grids">
                <% for(int i = 0;i<listSanPhamMoi.size();i++){ %>
                <div class="col-md-3 agileinfo_new_products_grid">
                    <div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
                        <div class="hs-wrapper hs-wrapper1">
                            <img src="<% out.print(listSanPhamMoi.get(i).getAnh()); %>" alt=" " class="img-responsive" />

                            <div class="w3_hs_bottom w3_hs_bottom_sub">
                                <ul>
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#myModal<% out.print(listSanPhamMoi.get(i).getId_sanpham()); %>"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h5><a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(listSanPhamMoi.get(i).getId_sanpham()); %>"><% out.print(listSanPhamMoi.get(i).getTensanpham()); %></a></h5>
                        <div class="simpleCart_shelfItem">
                            <p><span><% out.print(listSanPhamMoi.get(i).getGia() + 100000); %></span> <i class="item_price"><% out.print(listSanPhamMoi.get(i).getGia()); %> VND</i></p>
                            <p><a class="item_add" href="GioHangServlet?command=add&size=L&id_sanpham=<% out.print(listSanPhamMoi.get(i).getId_sanpham()); %>">Thêm Giỏ Hàng</a></p>
                        </div>
                    </div>
                </div>
                <% } %>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
<!-- //new-products -->
<!-- top-brands -->
	<div class="top-brands">
            <div class="container">
                <h3>Nhãn Hiệu Nổi Bật</h3>
                <div class="sliderfig">
                    <ul id="flexiselDemo1">			
                        <li>
                            <img src="images/index/4.png" alt=" " class="img-responsive" />
                        </li>
                        <li>
                            <img src="images/index/5.png" alt=" " class="img-responsive" />
                        </li>
                        <li>
                            <img src="images/index/6.png" alt=" " class="img-responsive" />
                        </li>
                        <li>
                            <img src="images/index/7.png" alt=" " class="img-responsive" />
                        </li>
                        <li>
                            <img src="images/index/46.jpg" alt=" " class="img-responsive" />
                        </li>
                    </ul>
                </div>
                <script type="text/javascript">
                    $(window).load(function() {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,    		
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: { 
                                portrait: { 
                                    changePoint:480,
                                    visibleItems: 1
                                }, 
                                landscape: { 
                                    changePoint:640,
                                    visibleItems:2
                                },
                                tablet: { 
                                    changePoint:768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            </div>
	</div>
<!-- //top-brands -->


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
					<a href="#home1" class="scroll"><img src="images/index/arrow.png" alt=" " class="img-responsive" /></a>
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
<%
    if(request.getParameter("error")!=null){
        if(request.getParameter("error").equals("1")){
            out.print("<script>");
            out.print("alert('Sai email hoặc mật khẩu!!!');");
            out.print("</script>");
        } else if(request.getParameter("error").equals("2")){
            out.print("<script>");
            out.print("alert('Đăng ký tài khoản không thành công!!!');");
            out.print("</script>");
        }
    } else {
        out.print("");
    }
%>