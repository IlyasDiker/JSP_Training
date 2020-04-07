<%-- 
    Document   : script-addcmd
    Created on : 7 avr. 2020, 12:36:08
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
    String ref = request.getParameter("ref");
    String article = request.getParameter("article");
    String client = request.getParameter("client");
    String price = request.getParameter("price");

    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    String sql = "INSERT INTO commandes VALUES ("
            + "'"+ref+"',"
            + "'"+article+"',"
            + "'"+client+"',"
            + price
            + ", SYSDATE"
    + ")";
    System.out.println(sql);
    stm.executeQuery(sql);
    response.sendRedirect("ListCommandes.jsp");
%>