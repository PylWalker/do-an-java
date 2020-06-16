/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.ChiTietHoaDonGet;
import get.HoaDonGet;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ChiTietHoaDon;
import model.GioHang;
import model.HoaDon;
import model.ItemGioHang;
import model.Users;

/**
 *
 * @author chinh
 */
@WebServlet(name = "ThanhToanServlet", urlPatterns = {"/ThanhToanServlet"})
public class ThanhToanServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String command = request.getParameter("command");
        String url = "";
        HoaDonGet hoaDonGet = new HoaDonGet();
        ChiTietHoaDonGet cthdg = new ChiTietHoaDonGet();
        HttpSession session = request.getSession();
        if(session.getAttribute("user")==null){
            response.sendRedirect("gio_hang.jsp?error=1");
        }
        Users user = (Users)session.getAttribute("user");
        GioHang gioHang = (GioHang)session.getAttribute("giohang");
        List<ItemGioHang> list = gioHang.getList();
        int totalBill = 0;
        for(ItemGioHang itemGioHang : list){
            totalBill += itemGioHang.getPrice()*itemGioHang.getQuantity();
        }
        
        switch(command){
            case "quick-payment":
                //card_number=13&name=123&expire_date=12%2F12&cvv=123&phone=0918516036&address=Hà+Nội&note=123&command=quick-payment
                int id_user = user.getId_user();
                int tongtien = totalBill;
                String phuongthucthanhtoan = command;
                String diachi = request.getParameter("address");
                LocalDate date = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                String ngaymua = date.format(formatter);
                String ten = request.getParameter("name");
                String sodienthoai = request.getParameter("phone");
                HoaDon hoaDon = new HoaDon(id_user, tongtien, phuongthucthanhtoan, diachi, ngaymua, ten, sodienthoai);
                int tmp = hoaDonGet.insertHoaDon(hoaDon);
                if(tmp==1){
                    for(int i = 0;i<list.size();i++){
                        int id_hoadon = hoaDonGet.getLastIdHoaDon();
                        ChiTietHoaDon cthd = new ChiTietHoaDon();
                        cthd.setId_hoadon(id_hoadon);
                        cthd.setId_sanpham(list.get(i).getSanPham().getId_sanpham());
                        cthd.setGia(list.get(i).getPrice()*list.get(i).getQuantity());
                        cthd.setKichco(list.get(i).getSize());
                        cthd.setSoluong(list.get(i).getQuantity());
                        cthdg.insertChiTietHoaDon(cthd);
                    }
                    url = "gio_hang.jsp?paid=true";
                } else {
                    url = "gio_hang.jsp?error=1";
                }
                response.sendRedirect(url);
                break;
            case "cash":
                //card_number=13&name=123&expire_date=12%2F12&cvv=123&phone=0918516036&address=Hà+Nội&note=123&command=quick-payment
                id_user = user.getId_user();
                tongtien = totalBill;
                phuongthucthanhtoan = command;
                diachi = request.getParameter("address");
                date = LocalDate.now();
                formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                ngaymua = date.format(formatter);
                ten = request.getParameter("name");
                sodienthoai = request.getParameter("phone");
                hoaDon = new HoaDon(id_user, tongtien, phuongthucthanhtoan, diachi, ngaymua, ten, sodienthoai);
                tmp = hoaDonGet.insertHoaDon(hoaDon);
                if(tmp==1){
                    for(int i = 0;i<list.size();i++){
                        int id_hoadon = hoaDonGet.getLastIdHoaDon();
                        ChiTietHoaDon cthd = new ChiTietHoaDon();
                        cthd.setId_hoadon(id_hoadon);
                        cthd.setId_sanpham(list.get(i).getSanPham().getId_sanpham());
                        cthd.setGia(list.get(i).getPrice()*list.get(i).getQuantity());
                        cthd.setKichco(list.get(i).getSize());
                        cthd.setSoluong(list.get(i).getQuantity());
                        cthdg.insertChiTietHoaDon(cthd);
                    }
                    url = "gio_hang.jsp?paid=true";
                } else {
                    url = "gio_hang.jsp?error=1";
                }
                response.sendRedirect(url);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
