<%-- 
    Document   : gio_hang
    Created on : Sep 13, 2019, 2:15:31 AM
    Author     : chinh
--%>

<%@page import="get.NhanHieuGet"%>
<%@page import="java.util.List"%>
<%@page import="model.ItemGioHang"%>
<%@page import="model.GioHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Giỏ hàng</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/gio_hang.css">
	<script src="js/javascript.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" media="screen and (max-width: 765px)" href="css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%
        if(session.getAttribute("giohang") == null){
            GioHang gioHang = new GioHang();
            session.setAttribute("giohang", gioHang);
        }
        GioHang gioHang = (GioHang) session.getAttribute("giohang");
        if(gioHang.getList()==null||gioHang.getList().size()==0){
            response.sendRedirect("danh_sach_sp.jsp?error=1");
        }
        List<ItemGioHang> list = gioHang.getList();
        int totalBill = 0;
        for(ItemGioHang itemGioHang : list){
            totalBill += itemGioHang.getPrice()*itemGioHang.getQuantity();
        }
        NhanHieuGet nhanHieuGet = new NhanHieuGet();
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<div class="container">

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h1><b>Giỏ hàng của bạn</b></h1>
			</div>
			<div class="col-md-12 col-md-12 col-xs-12" style="padding: 0px 0px 15px;">
				<a href="danh_sach_sp.jsp" id="btn_mua_tiep">
					<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
					<span>Mua tiếp</span>
				</a>
			</div>
			<form action="GioHangServlet" method="get" accept-charset="utf-8">
                            <% for(int i = 0; i<list.size(); i++){ %>
				<div class="col-md-12 col-sm-12 col-xs-12 bd">		
					<table class="col-md-11 col-sm-11 col-xs-11 gio_hang">
                                            <tr class="col-md-2 col-sm-4 col-xs-3 anh_sp">
                                                <td rowspan="6">
                                                    <a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(list.get(i).getSanPham().getId_sanpham()); %>"><img src="<% out.print(list.get(i).getSanPham().getAnh()); %>"></a>
                                                </td>
                                            </tr>
                                            <tr class="col-md-10 col-sm-8 col-xs-9" id="ten_sp">
                                                <td colspan="3">
                                                    <strong><a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(list.get(i).getSanPham().getId_sanpham()); %>"><% out.print(list.get(i).getSanPham().getTensanpham()); %></a></strong>
                                                </td>
                                            </tr>
                                            <tr class="col-md-10 col-sm-8 col-xs-9 tt">
                                                <td style="display: inline;">Hãng sản phẩm: </td>
                                                <td style="float: right;" colspan="2"><% out.print(nhanHieuGet.getNhanHieuById(list.get(i).getSanPham().getId_nhanhieu()).getTenhang()); %></td>
                                            </tr>
                                            <!-- thay đôi class tt thành class tang_giam-->
                                            <tr class="col-md-10 col-sm-8 col-xs-9 tang_giam" id="so_luong_sp">
                                            <!-- /thay đôi class -->
                                                <td style="display: inline;"><span>Số lượng:</span></td>
                                                <td style="float: right;" colspan="2">
                                                    <div class="btn-group" role="group">
                                                        <button type="button" onclick="incrementValue_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>()">+</button>
                                                        <input type="text" name="quantity" class="so_luong" id="so_luong_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>" value="<% out.print(list.get(i).getQuantity()); %>"/>
                                                        <button type="button" onclick="decreaseValue_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>()" style="width: 38px;">-</button>  
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="col-md-10 col-sm-8 col-xs-9 tt">
                                                <td style="display: inline;">Size:</td>
                                                <td style="float: right;"><% out.print(list.get(i).getSize()); %></td>
                                                <td></td>
                                            </tr>
                                            <tr class="col-md-10 col-sm-8 col-xs-9 tt">
                                                <td style="display: inline;">Giá sản phẩm:</td>
                                                <td style="float: right;" colspan="2"><% out.print(list.get(i).getPrice() + " VND"); %></td>
                                            </tr>
                                            <tr class="col-md-10 col-sm-8 col-xs-9 tt">
                                                <td style="display: inline;">Tổng tiền:</td>
                                                <td style="float: right;" colspan="2"><% out.print(list.get(i).getQuantity()*list.get(i).getPrice() + " VND"); %></td>
                                            </tr>
					</table>
					<!-- button xóa sản phẩm -->
					<div class="col-md-1 col-sm-1 col-xs-1" id="xoa_sp">
                                            <button type="button" onclick="removeItemCart_<% out.print(i); %>()"><i class="fa fa-trash" aria-hidden="true" style="font-size: 25px;"></i></button>
                                            <script type="text/javascript">
                                                function removeItemCart_<% out.print(i); %>() {
                                                    var r = confirm("Bạn có muốn xóa <% out.print(list.get(i).getQuantity()); %> sản phẩm <% out.print(list.get(i).getSanPham().getTensanpham()); %> - Size: <% out.print(list.get(i).getSize()); %>?");
                                                    if (r == true)
                                                        window.location.href='GioHangServlet?command=remove&index=<% out.print(i); %>'; 
                                                }
                                            </script>
					</div>
					<!-- /button xóa sản phẩm -->
                                        <script>
                                            function incrementValue_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>()
                                                {
                                                    var value = parseInt(document.getElementById('so_luong_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>').value, 10);
                                                    value = isNaN(value) ? 0 : value;
                                                    value++;
                                                    document.getElementById('so_luong_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>').value = value;
                                                }
                                            function decreaseValue_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>()
                                                {
                                                    var value = parseInt(document.getElementById('so_luong_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>').value, 10);
                                                    value = isNaN(value) ? 1 : value;
                                                    value--;
                                                    value = value<1 ? 1 : value;
                                                    document.getElementById('so_luong_<% out.print(list.get(i).getSanPham().getId_sanpham()); %>_<% out.print(list.get(i).getSize()); %>').value = value;
                                                }
                                        </script>
				</div>
                                <% } %>
                                <div class="col-md-12 col-sm-12 col-xs-12" id="ttien">
                                    <div style="float: left;" class="tt">Số sản phẩm: </div>
                                    <div style="float: right;" class="tt"><input class="so_luong" type="text" name="size" value="<% out.print(gioHang.getList().size()); %>" readonly></div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12" id="ttien">
                                    <div style="float: left;" class="tt">Tổng tiền: </div>
                                    <div style="float: right;" class="tt"><% out.print(totalBill + " VND"); %></div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12" id="thanh_toan">
                                    <input type="hidden" name="command" value="update">
                                    <input type="submit" value="CẬP NHẬT GIỎ HÀNG">
                                    <a href="thanh_toan.jsp"><input type="button" value="THANH TOÁN"></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
<%
    if(request.getParameter("paid")!=null){
        out.print("<script>");
        out.print("alert('Bạn đã đặt hàng thành công!!!');");
        out.print("</script>");
    } else {
        out.print("");
    }
    if(request.getParameter("error")!=null){
        if(request.getParameter("error").equals("1")){
            out.print("<script>");
            out.print("alert('Vui lòng đăng nhập và chọn lại sản phẩm để thanh toán!!!');");
            out.print("</script>");
        }
    } else {
        out.print("");
    }
%>