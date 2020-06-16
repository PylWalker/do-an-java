<%-- 
    Document   : chi_tiet_sp
    Created on : Aug 12, 2019, 1:36:53 PM
    Author     : chinh
--%>

<%@page import="model.Users"%>
<%@page import="model.NhanHieu"%>
<%@page import="get.NhanHieuGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SanPham"%>
<%@page import="get.SanPhamGet"%>
<%@page import="connect.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/chi_tiet_sp.css">
    <script src="js/javascript.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="screen and (max-width: 765px)" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .checked {
          color: orange;
        }
    </style>
</head>
<%
    int id_user;
    if(session.getAttribute("user")==null){
        id_user = -2;
    } else {
        Users user = (Users)session.getAttribute("user");
        id_user = user.getId_user();
    }
    ConnectDB connectDB = new ConnectDB();
    SanPhamGet sanPhamGet = new SanPhamGet();
    NhanHieuGet nhanHieuGet = new NhanHieuGet();
    SanPham sanPham = new SanPham();
    String id_sanpham_1 = request.getParameter("id_sanpham");
    int id_sanpham = Integer.parseInt(id_sanpham_1);
    sanPham = sanPhamGet.getSanPhamById(id_sanpham);
    NhanHieu nhanHieu = nhanHieuGet.getNhanHieuById(sanPham.getId_nhanhieu());
    int sao = sanPhamGet.getSao(id_sanpham);
    int check = sanPhamGet.checkUser(id_user, id_sanpham);
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            
                <div class="col-md-6 col-sm-6 col-xs-12" id="chi_tiet_sp_right">
                    <a href="#">
                        <img src="<% out.println(sanPham.getAnh()); %>">
                    </a>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12" id="chi_tiet_sp_left">
                    <form action="GioHangServlet" method="get" accept-charset="utf-8">
                    <h1><b><% out.println(sanPham.getTensanpham()); %></b></h1>
                    <% for(int i = 1;i<=5;i++){
                        if(i<=sao)
                            out.print("<span class='fa fa-star checked'></span>");
                        else
                            out.print("<span class='fa fa-star'></span>");} %>
                    <a href="#"><b><% out.println(nhanHieu.getTenhang()); %></b></a>
                    <p><b>Mô tả:</b> <% out.println(sanPham.getMieuta()); %> </p>

                    <input type="radio" name="size" id="size_s" value="S">
                    <label for="size_s" id="s">S</label>

                    <input type="radio" name="size" id="size_m" value="M">
                    <label for="size_m" id="m">M</label>

                    <input type="radio" name="size" id="size_l" value="L" checked>
                    <label for="size_l" id="l">L</label>

                    <input type="radio" name="size" id="size_xl" value="XL">
                    <label for="size_xl" id="xl">XL</label>
                    
                    <br>
                    <br>
                    <div><b>Giá: </b> <% out.println(sanPham.getGia()+ " VND"); %></div>
                    <input type="hidden" value="<% out.print(sanPham.getId_sanpham()); %>" name="id_sanpham">
                    <input type="hidden" value="add" name="command">
                    <input type="submit" value="THÊM VÀO GIỎ HÀNG">
                    </form>
                    <br><br>
                    <% if(id_user == check){ %>
                    <span style="float: left;"><b>Đánh giá sản phẩm</b></span><br>
                    <style>
                        .rate {
                            float: left;
                            height: 20px;
                            padding: 0;
                        }
                        .rate:not(:checked) > input {
                            position:absolute;
                            top:-9999px;
                        }
                        .rate:not(:checked) > label {
                            float:right;
                            width:1em;
                            overflow:hidden;
                            white-space:nowrap;
                            cursor:pointer;
                            font-size:35px;
                            color:#ccc;
                        }
                        .rate:not(:checked) > label:before {
                            content: '★ ';
                        }
                        .rate > input:checked ~ label {
                            color: #ffc700;
                            background: none;
                        }
                        .rate:not(:checked) > label:hover,
                        .rate:not(:checked) > label:hover ~ label {
                            color: #deb217;
                            background: none;
                        }
                        .rate > input:checked + label:hover,
                        .rate > input:checked + label:hover ~ label,
                        .rate > input:checked ~ label:hover,
                        .rate > input:checked ~ label:hover ~ label,
                        .rate > label:hover ~ input:checked ~ label {
                            color: #c59b08;
                            background: none;
                        }
                    </style>
                    <form action="ReviewServlet" method="get">
                        <div class="rate">
                            <input type="radio" id="star5" name="rate" value="5" />
                            <label for="star5" title="text">5 stars</label>
                            <input type="radio" id="star4" name="rate" value="4" />
                            <label for="star4" title="text">4 stars</label>
                            <input type="radio" id="star3" name="rate" value="3" />
                            <label for="star3" title="text">3 stars</label>
                            <input type="radio" id="star2" name="rate" value="2" />
                            <label for="star2" title="text">2 stars</label>
                            <input type="radio" id="star1" name="rate" value="1" />
                            <label for="star1" title="text">1 star</label><br><br>
                            <input type="hidden" value="<% out.print(sanPham.getId_sanpham()); %>" name="id_sanpham">
                            <button type="submit" style="border: none;background: #FF9B05;color: white;padding: 8px 55px;font-size: 18px;">Đánh giá</button>
                        </div>
                    </form>
                    <% } %>
                </div>
            
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%
    if(request.getParameter("rated")!=null){
        if(request.getParameter("rated").equals("true")){
            out.print("<script>");
            out.print("alert('Bạn đã đánh giá thành công!!!');");
            out.print("</script>");
        } else if(request.getParameter("rated").equals("false")){
            out.print("<script>");
            out.print("alert('Đánh giá không thành công!!!');");
            out.print("</script>");
        }
    } else {
        out.print("");
    }
%>