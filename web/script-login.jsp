<%-- 
    Document   : script-login
    Created on : 6 avr. 2020, 23:54:29
    Author     : Ilyas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
            <style>
            .content{
                margin: 50px auto;
                width: 900px;
            }
            @media screen and (max-width: 900px) {
                .content{
                    width: auto;
                    margin: 50px 10px;
                }
            }
        </style>
</head>
<body>
    <div class="content">
        <% 
    String Userid = request.getParameter("uid");
            String Password = request.getParameter("pass");
            Connection conn = DCM.getConnection();
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("Select * from users where userid = '"+Userid+"' and password='"+Password+"'");
            
            if (rs.next()){
               response.sendRedirect("MainMenu.jsp");
            } else {
                out.println("<div class='alert alert-danger' role='alert'>Wrong User/Password</div>");
                out.println("<a href='LoginClient.jsp' class='badge badge-primary '>Return</a>");
            }
%>
    </div>
    
</body>

