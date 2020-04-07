<%-- 
    Document   : script-addarticle
    Created on : 7 avr. 2020, 15:23:48
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
    String nom = request.getParameter("nom");
    String price = request.getParameter("price");

    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    String sql = "INSERT INTO article VALUES ("
            + "'"+ref+"',"
            + "'"+nom+"',"
            + price
    + ")";
    System.out.println(sql);
    stm.executeQuery(sql);
    response.sendRedirect("ListProduits.jsp");
%>
