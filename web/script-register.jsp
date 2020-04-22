<%-- 
    Document   : script-register
    Created on : 10 mars 2020, 09:25:12
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
    String Password = request.getParameter("pass");
    
    Connection conn = DCM.getConnection();
    Statement stm = conn.createStatement();
    stm.executeQuery("INSERT INTO users VALUES ("
            + "'"+Cin+"',"
            + "'"+Password+"'"
    + ")");
%>
