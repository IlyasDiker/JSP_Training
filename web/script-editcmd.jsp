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
    

    ResultSet rs2 = stm.executeQuery("Select quantity from Commandes where ref = '"+ref+"'");
    System.out.println("Select ref from article where ref = "+article);
    System.out.println("Select quantity from Commandes where ref = '"+ref+"'");
    if (rs2.next()){
         int oldqt = Integer.parseInt(rs2.getString(1));
         int newqt = Integer.parseInt(qte);
         System.out.println(oldqt+"-"+newqt);
         if (oldqt > newqt){
             int differ = oldqt-newqt;
             stm.executeQuery("update article set quantity = quantity + "+ differ +" where ref='"+article+"'");
             System.out.println("update article set quantity = quantity + "+ differ +" where ref='"+article+"'");
             stm.executeQuery(querry);
            response.sendRedirect("ListCommandes.jsp");
         } else if (newqt > oldqt) {
             int differ = newqt-oldqt;
             stm.executeQuery("update article set quantity = quantity - "+ differ +" where ref='"+article+"'");
             System.out.println("update article set quantity = quantity - "+ differ +" where ref='"+article+"'");
             stm.executeQuery(querry);
            response.sendRedirect("ListCommandes.jsp");
         } else {
            stm.executeQuery(querry);
            response.sendRedirect("ListCommandes.jsp");
         }
    }

%>
