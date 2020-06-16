package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class lien_005fhe_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<title>Liên hệ</title>\n");
      out.write("\t<meta charset=\"utf-8\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/lien_he.css\">\n");
      out.write("\t<script src=\"js/lien_he.js\"></script>\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\t<link rel=\"stylesheet\" media=\"screen and (max-width: 765px)\" href=\"css/danh_sach.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <script>\n");
      out.write("            function check_lh(){\n");
      out.write("                var check_full_name = /^[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?0123456789]*$/;\n");
      out.write("                var check_email = /^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/;\n");
      out.write("\n");
      out.write("                var full_name = document.getElementById(\"full_name\").value;\n");
      out.write("                var email = document.getElementById(\"email\").value;\n");
      out.write("\n");
      out.write("                if (full_name == \"\") {\n");
      out.write("                        document.getElementById(\"er_full_name\").innerHTML=\"Nhập họ tên\";\n");
      out.write("                        return false;\n");
      out.write("                }else if(check_full_name.test(full_name)){\n");
      out.write("                        document.getElementById(\"er_full_name\").innerHTML=\"Sai định dạng họ tên\";\n");
      out.write("                        return false;\n");
      out.write("                }else{\n");
      out.write("                        document.getElementById(\"er_full_name\").style.display=\"none\";\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                if(email = \"\"){\n");
      out.write("                    document.getElementById(\"er_emails\").innerHTML=\"Nhập email\";\n");
      out.write("                    return false;\n");
      out.write("                } else if(!check_email.test(email)){\n");
      out.write("                        document.getElementById(\"er_email\").innerHTML=\"Sai định dạng email\";\n");
      out.write("                        return false;\n");
      out.write("                } else{\n");
      out.write("                    document.getElementById(\"er_email\").style.display=\"none\";\n");
      out.write("                    alert(\"Gửi liên hệ thành công\")\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\t<!-- <body> -->\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t\t<div class=\"row\">\n");
      out.write("\t\t\t<div class=\"col-md-2 col-sm-2 col-xs-1\"></div>\n");
      out.write("\t\t\t<div class=\"col-md-8 col-sm-8 col-xs-10\" id=\"lien_he\">\n");
      out.write("                            <form action=\"LienHeServlet\" method=\"get\" accept-charset=\"utf-8\" onsubmit=\"return check_lh()\">\n");
      out.write("\t\t\t\t\t<div>Họ tên</div>\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"full_name\" class=\"lien_he\">\n");
      out.write("                                        <div id=\"er_full_name\"></div>\n");
      out.write("\t\t\t\t\t<div>Email</div>\n");
      out.write("                                        <input type=\"email\" name=\"email\" class=\"lien_he\">\n");
      out.write("                                        <div id=\"er_email\"></div>\n");
      out.write("\t\t\t\t\t<div>Tiêu đề</div>\n");
      out.write("                                        <input type=\"text\" name=\"title\" class=\"lien_he\">\n");
      out.write("\t\t\t\t\t<div>Nội dung</div>\n");
      out.write("                                        <textarea rows=\"10\" name=\"description\"></textarea><br><br>\n");
      out.write("\t\t\t\t\t<br>\n");
      out.write("                                        <input type=\"submit\" value=\"Gửi liên hệ\" id=\"btn_lien_he\">\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"col-md-2 col-sm-2 col-xs-1\"></div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- </body> -->\n");
      out.write("\t<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
