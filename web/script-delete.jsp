<%-- 
    Document   : delete-script
    Created on : 2 avr. 2020, 14:06:39
    Author     : Ilyas
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gestions.DCM"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
     <%@include file="home.jsp"%>
    <body>
        <%
            try{ 
            String cin=request.getParameter("cin");
             String req="delete from Students where CIN='"+cin+"'";    
             Connection conn = DCM.getConnection();
             Statement stm = conn.createStatement();
             stm.executeQuery(req);
             out.println("<div class='alert alert-success' role='alert'>User Deleted Succesfully!</div>");
             response.sendRedirect("ListStudents.jsp");
            } catch(SQLException e) {
                out.println("<div class='alert alert-success' role='alert'>Error:"+e+"</div>");
                out.println("<a href='ListClient.jsp' class='badge badge-danger'>Return</a>");
            }
 
        %>
        
    </body>
</html>
