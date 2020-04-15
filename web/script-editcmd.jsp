<%-- 
    Document   : script-editcmd
    Created on : 7 avr. 2020, 12:52:32
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
    String qte = request.getParameter("qte");

    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    String querry = "UPDATE commandes SET "
            + "article ='"+article+"',"
            + "client ='"+client+"',"
            + "price ="+price+", "
            + "quantity ="+qte+""
                    + " where ref ='"+ref+"'";
    System.out.println(querry);
    stm.executeQuery(querry);
    response.sendRedirect("ListCommandes.jsp");
%>
