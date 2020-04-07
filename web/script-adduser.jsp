<%-- 
    Document   : script-adduser
    Created on : 7 avr. 2020, 01:02:03
    Author     : Ilyas
--%>

<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("oracle.jdbc.OracleDriver");%>

<% 
    String Cin = request.getParameter("cin");
    String Fullname = request.getParameter("fullname");
    String Phone = request.getParameter("phone");
    String Mail = request.getParameter("mail");
    String Password = request.getParameter("pass");
    String Gender = request.getParameter("Gender");
    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    stm.executeQuery("INSERT INTO students VALUES ("
            + "'"+Cin+"',"
            + "'"+Fullname+"',"
            + "'"+Gender+"',"
            + "'"+Phone+"',"
            + "'"+Mail+"',"
            + "'"+Password+"'"
    + ")");
    response.sendRedirect("ListStudents.jsp");
%>