<%-- 
    Document   : script-deletearticle
    Created on : 7 avr. 2020, 15:46:34
    Author     : Ilyas
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Article</title>
    </head>
    <body>
         <%
            try{ 
             String ref=request.getParameter("ref");
             String req="delete from article where ref='"+ref+"'";    
             Connection conn = DCM.getConnection();
             Statement stm = conn.createStatement();
             stm.executeQuery(req);
             out.println("<div class='alert alert-success' role='alert'>Article Deleted Succesfully!</div>");
             response.sendRedirect("ListArticle.jsp");
            } catch(SQLException e) {
                out.println("<div class='alert alert-success' role='alert'>Error:"+e+"</div>");
                out.println("<a href='ListClient.jsp' class='badge badge-danger'>Return</a>");
            }
 
        %>
    </body>
</html>