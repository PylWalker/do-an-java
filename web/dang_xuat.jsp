<%-- 
    Document   : dang_xuat
    Created on : Sep 12, 2019, 3:48:16 PM
    Author     : chinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        M<%
            session.invalidate();
            String url = "index.jsp";
            response.sendRedirect(url);
        %>
    </body>
</html>
