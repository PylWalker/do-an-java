/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.HoaDonGet;
import get.SanPhamGet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.GioHang;
import model.ItemGioHang;
import model.SanPham;

/**
 *
 * @author chinh
 */
@WebServlet(name = "GioHangServlet", urlPatterns = {"/GioHangServlet"})
public class GioHangServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        String command = request.getParameter("command");
        String url = "";
        SanPhamGet sanPhamGet = new SanPhamGet();
        HoaDonGet hoaDonGet = new HoaDonGet();
        HttpSession session = request.getSession();
                
        switch(command){
            case "add":
                String id_sanpham_1 = request.getParameter("id_sanpham");
                String size = request.getParameter("size");

                int quantity = 1;
                int id_sanpham;
                if(id_sanpham_1!=null){
                    id_sanpham = Integer.parseInt(id_sanpham_1);
                    SanPham sanPham = sanPhamGet.getSanPhamById(id_sanpham);
                    if(sanPham!=null){
                        if(session.getAttribute("giohang")==null){
                            GioHang gioHang = new GioHang();
                            List<ItemGioHang> list = new ArrayList<ItemGioHang>();
                            ItemGioHang itemGioHang = new ItemGioHang();
                            itemGioHang.setQuantity(quantity);
                            itemGioHang.setSanPham(sanPham);
                            itemGioHang.setSize(size);
                            itemGioHang.setPrice(sanPham.getGia());
                            list.add(itemGioHang);
                            gioHang.setList(list);
                            session.setAttribute("giohang", gioHang);
                            
                        } else {
                            GioHang gioHang = (GioHang)session.getAttribute("giohang");
                            List<ItemGioHang> list = gioHang.getList();
                            boolean check = false;
                            for(ItemGioHang itemGioHang : list){
                                if((itemGioHang.getSanPham().getId_sanpham()==sanPham.getId_sanpham())&&(itemGioHang.getSize().equals(size))){
                                    itemGioHang.setQuantity(itemGioHang.getQuantity() + quantity);
                                    check = true;
                                }
                            }
                            if(check == false){
                                ItemGioHang itemGioHang = new ItemGioHang();
                                itemGioHang.setQuantity(quantity);
                                itemGioHang.setSanPham(sanPham);
                                itemGioHang.setSize(size);
                                itemGioHang.setPrice(sanPham.getGia());
                                list.add(itemGioHang);
                            }
                            session.setAttribute("giohang", gioHang);
                        }
                    }
                }
                url = "gio_hang.jsp";
                response.sendRedirect(url);
                break;
            case "remove":
                String index = request.getParameter("index");
                int i = Integer.parseInt(index);
                GioHang gioHang = (GioHang)session.getAttribute("giohang");
                List<ItemGioHang> list = gioHang.getList();
                list.remove(i);
                gioHang.setList(list);
                session.setAttribute("giohang", gioHang);
                
                url = "gio_hang.jsp";
                response.sendRedirect(url);
                break;
            case "remove-all":
                GioHang gioHang2 = new GioHang();
                session.setAttribute("giohang", gioHang2);
                url = "gio_hang.jsp";
                response.sendRedirect(url);
                break;
            case "update":
                gioHang = (GioHang)session.getAttribute("giohang");
                String[] quantityUpdate = request.getParameterValues("quantity");
                int sizeUpdate = Integer.parseInt(request.getParameter("size"));
                int[] quantityNew = new int[sizeUpdate];
                for(i = 0;i<quantityNew.length;i++){
                    quantityNew[i] = Integer.parseInt(quantityUpdate[i]);
                    gioHang.getList().get(i).setQuantity(quantityNew[i]);
                }
                session.setAttribute("giohang", gioHang);
                
                url = "gio_hang.jsp";
                response.sendRedirect(url);
                break;
            case "canceled":
                String id_hoa_don_tmp = request.getParameter("id_hoadon");
                int id_hoadon = Integer.parseInt(id_hoa_don_tmp);
                hoaDonGet.setStatusToCanceled(id_hoadon);
                url = "chi_tiet_hoa_don.jsp?id_hoadon=" + id_hoadon;
                response.sendRedirect(url);
                break;
            case "received":
                id_hoa_don_tmp = request.getParameter("id_hoadon");
                id_hoadon = Integer.parseInt(id_hoa_don_tmp);
                hoaDonGet.setStatusToReceived(id_hoadon);
                url = "chi_tiet_hoa_don.jsp?id_hoadon=" + id_hoadon;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
