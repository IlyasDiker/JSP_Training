<%-- 
    Document   : script-editarticle
    Created on : 7 avr. 2020, 15:34:34
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
    String price = request.getParameter("price");
    String quantity = request.getParameter("quantity");

    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    String querry = "UPDATE article SET "
            + "nom ='"+article+"',"
            + "price ="+price+" ,"
            + "quantity ="+quantity+""
                    + " where ref ='"+ref+"'";
    System.out.println(querry);
    stm.executeQuery(querry);
    response.sendRedirect("ListArticle.jsp");
%>