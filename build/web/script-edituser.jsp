<%-- 
    Document   : script-edituser
    Created on : 7 avr. 2020, 10:37:10
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
    String Gender = request.getParameter("Gender");

    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    String querry = "UPDATE students SET "
            /*+ "cin ='"+Cin+"',"*/
            + "nomcp ='"+Fullname+"',"
            + "genre ='"+Gender+"',"
            + "tel ='"+Phone+"',"
            + "email ='"+Mail+"'"
                    + " where cin ='"+Cin+"'";
    System.out.println(querry);
    stm.executeQuery(querry);
    response.sendRedirect("ListStudents.jsp");
%>
