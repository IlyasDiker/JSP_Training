<%-- 
    Document   : mainmenu
    Created on : 7 avr. 2020, 11:16:15
    Author     : Ilyas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gestions.DCM"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>We Fool You</title>
        <style>
            .content{
                margin: 20px auto;
                width: 500px;
                display: grid;
                grid-template-columns: auto auto;
                column-gap: 30px;
                row-gap: 30px;
            }
            @media screen and (max-width: 500px) {
                .content{
                    width: auto;
                    grid-template-columns: auto;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="home.jsp"%>
        <div class="content">
            <%  Connection conn = DCM.getConnection();
                Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery("Select * from students");
                while(rs.next()){%>
                    <div class="card border-primary mb-3" style="width: 18rem;">
                    <div class="card-body">
                      <h5 class="card-title"><%=rs.getString(2)%></h5>
                      <p class="card-text"><%=rs.getString(1)%></p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item"><%=rs.getString(3)%></li>
                      <li class="list-group-item"><%=rs.getString(4)%></li>
                      <li class="list-group-item"><%=rs.getString(5)%></li>
                    </ul>
                  </div>
      
                <%}%>
        </div>
    </body>
</html>
