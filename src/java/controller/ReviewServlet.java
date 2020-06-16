/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.ReviewGet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;
import model.SanPham;
import model.Review;

/**
 *
 * @author NguyenDang
 */
public class ReviewServlet extends HttpServlet {
ReviewGet reviewGet = new ReviewGet();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String url = "";
        
        int id_sanpham = Integer.parseInt(request.getParameter("id_sanpham"));
        int sao = Integer.parseInt(request.getParameter("rate"));
        try {
                boolean tmp = reviewGet.insertReview(new Review(id_sanpham,sao));
                url = "chi_tiet_sp.jsp?id_sanpham=" + id_sanpham + "&rated=" + tmp;
            } catch (Exception e) {
                e.printStackTrace();
        }
        response.sendRedirect(url); 
    }

}
