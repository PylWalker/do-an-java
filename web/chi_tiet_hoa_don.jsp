<%-- 
    Document   : chi_tiet_hoa_don
    Created on : Oct 20, 2019, 7:28:53 PM
    Author     : chinh
--%>

<%@page import="model.HoaDon"%>
<%@page import="model.SanPham"%>
<%@page import="get.HoaDonGet"%>
<%@page import="get.SanPhamGet"%>
<%@page import="get.ChiTietHoaDonGet"%>
<%@page import="model.ChiTietHoaDon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="connect.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Chi tiết hóa đơn</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/chi_tiet_hoa_don.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
</head>
<%
    ConnectDB connectDB = new ConnectDB();
    ChiTietHoaDonGet cthdg = new ChiTietHoaDonGet();
    SanPhamGet spg = new SanPhamGet();
    HoaDonGet hdg = new HoaDonGet();
    String id_hoadon_tmp = request.getParameter("id_hoadon");
    int id_hoadon = Integer.parseInt(id_hoadon_tmp);
    ArrayList<ChiTietHoaDon> listCTHD = cthdg.getChiTietHoaDonById(id_hoadon);
    ArrayList<SanPham> listSP = new ArrayList<SanPham>();
    for(int i = 0;i<listCTHD.size();i++){
        listSP.add(spg.getSanPhamById(listCTHD.get(i).getId_sanpham()));
    }
    HoaDon hd = hdg.getHoaDonById(id_hoadon);
    int status = hdg.getTrangThaiById(id_hoadon);
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>
        <script>
            function cancel(){
                var r = confirm("Bạn có chắc chắn muốn hủy đơn hàng");
                if(r == true){
                    window.location.href='GioHangServlet?command=canceled&id_hoadon=<% out.print(id_hoadon); %>';
                }
            }
        </script>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12 col-xs-12" id="ctt_hoa_don_left">		
					<!--giao diện giỏ hàng điện thoại -->
				<div class="hidden-md hidden-lg order_summary">
					<button type="button" data-toggle="collapse" data-target="#order_summary">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i> <h5>Sản phẩm</h5>
					</button>
					<div id="order_summary" class="collapse col-xs-12">
                                            <% for(int i = 0;i<listSP.size();i++){ %>
						<div class="col-xs-6 col-sm-2">
                                                    <a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(listSP.get(i).getId_sanpham()); %>"><img src="<% out.print(listSP.get(i).getAnh()); %>"></a>
						</div>
                                            <% } %>
					</div>
				</div>
				<!--/giao diện giỏ hàng điện thoại -->
				<div style="clear: both;"></div>	
				<div id="ctt_hoa_don">
					<h3>Chi tiết hóa đơn</h3>
					<table>
						<tr>
							<th colspan="3">Mã đơn hàng</th>
							<th><% out.print(id_hoadon); %></th>
						</tr>
						<tr>
                                                    <th style="width: 200px;">Tên sản phẩm</div>
							<th>Kích cỡ</div>
							<th>Số lượng</div>
							<th>Giá</th>
						</tr>
						<!-- sản phẩm -->
                                                <% for(int i = 0;i<listSP.size();i++){ %>
                                                <tr>
                                                    <td><% out.print(listSP.get(i).getTensanpham()); %></td>
                                                    <td><% out.print(listCTHD.get(i).getKichco()); %></td>
                                                    <td><% out.print(listCTHD.get(i).getSoluong()); %></td>
                                                    <td><% out.print(listCTHD.get(i).getGia()); %></td>
						</tr>
                                                <% } %>
						<!-- sản phẩm -->
						<tr>
                                                    <th colspan="3">Tổng tiền</th>
                                                    <th><% out.print(hd.getTongtien()); %></th>
						</tr>
						<tr>
                                                    <th colspan="2">Trạng thái</th>
                                                        <th colspan="2"><% if(hd.getPhuongthucthanhtoan().equals("cash")) out.print("Chưa thanh toán"); else out.print("Đã thanh toán"); %></th>
						</tr>
						<tr>
                                                        <th colspan="2">Địa chỉ</th>
							<th colspan="2"><% out.print(hd.getDiachi()); %></th>
						</tr>
						<tr>
							<th colspan="2">Số điện thoại</th>
							<th colspan="2"><% out.print(hd.getSodienthoai()); %></th>
						</tr>
						<tr>
							<th colspan="2">Phương thức thanh toán</th>
							<th colspan="2"><% out.print(hd.getPhuongthucthanhtoan()); %></th>
						</tr>
					</table>
                                                <div>
                                                    <button <% if(status==0)
                                                                    out.print("style='background: #FF9B05;' onclick='return cancel()'> Đang đợi xác nhận, khách có thể hủy đơn hàng");
                                                                else if(status==1)
                                                                    out.print("style='background: #414141;'> Đã được xác nhận và đang giao hàng");
                                                                else if(status==2)
                                                                    out.print("style='background: #414141;'> Đơn hàng đã được hủy");
                                                                else if(status==3)
                                                                    out.print("style='background: #FF9B05;'><a style='color: white;' href='GioHangServlet?command=received&id_hoadon=" + id_hoadon + "'>Đã giao hàng, vui lòng xác nhận đã nhận hàng</a>");
                                                                else if(status==4)
                                                                    out.print("style='background: #414141;'> Đã nhận được hàng");
                                                    %></button></div>
				</div>
			</div>
			<div class="col-md-6 hidden-sm hidden-xs" id="ctt_hoa_don_right">
                            <% for(int i = 0;i<listSP.size();i++){ %>
                                <div class="col-xs-6 col-sm-2">
                                    <a href="chi_tiet_sp.jsp?id_sanpham=<% out.print(listSP.get(i).getId_sanpham()); %>"><img src="<% out.print(listSP.get(i).getAnh()); %>"></a>
                                </div>
                            <% } %>
			</div>
		</div>
	</div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>