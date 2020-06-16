/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.UsersGet;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.GioHang;
import model.Users;
import utils.HashingPassword;

/**
 *
 * @author chinh
 */
@WebServlet(name = "UsersServlet", urlPatterns = {"/UsersServlet"})
public class UsersServlet extends HttpServlet {
    UsersGet usersGet = new UsersGet();

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
        
        String command = request.getParameter("command");
        String url = "";
        Users user = new Users();
        HttpSession session = request.getSession();
        
        switch(command){
            case "login":
                String user_email = request.getParameter("email");
                String user_pass = request.getParameter("mat_khau");
                user = usersGet.login(user_email, HashingPassword.hashPassword(user_pass));
                if (user != null) {
                        session.setAttribute("user", user);
                        GioHang gioHang = (GioHang)session.getAttribute("giohang");
                        session.setAttribute("giohang", gioHang);
                        session.setMaxInactiveInterval(18000);
                        url = "index.jsp";
                } else {
                    url = "index.jsp?error=1";
                }
                break;
            case "insert":
                user.setId_user(usersGet.countID() + 1);
                user.setUser_name(request.getParameter("ten"));
                user.setUser_email(request.getParameter("email"));    
                user.setUser_pass(HashingPassword.hashPassword(request.getParameter(("mat_khau"))));
                user.setUser_phone(request.getParameter("so_dien_thoai"));
                int i = usersGet.insertUser(user);
                if(i==1){
                    session.setAttribute("user", user);
                    GioHang gioHang = (GioHang)session.getAttribute("giohang");
                    session.setAttribute("giohang", gioHang);
                    session.setMaxInactiveInterval(18000);
                    url = "index.jsp";
                } else {
                    url = "index.jsp?error=2";
                }
                break;
            case "update":
                user.setUser_name(request.getParameter("ten"));
                user.setUser_pass(HashingPassword.hashPassword(request.getParameter(("mat_khau"))));
                user.setUser_phone(request.getParameter("so_dien_thoai"));
                user.setId_user(Integer.parseInt(request.getParameter("id_user")));
                i = usersGet.updateUser(user);
                if(i==1){
                    url = "khach_hang.jsp?id_user=" + user.getId_user();
                } else {
                    url = "cap_nhat_thong_tin.jsp?id_user=" + user.getId_user() + "&error=1";
                }
                break;
        }
        response.sendRedirect(url);
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
