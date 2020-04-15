<%-- 
    Document   : EditArticle
    Created on : 7 avr. 2020, 15:35:21
    Author     : Ilyas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier Article</title>
        <style>
            .content{
                margin: 50px auto;
                width: 500px;
            }
            @media screen and (max-width: 500px) {
                .content{
                    width: auto;
                    margin: 20px 10px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="home.jsp"%>
         <%
         String ref=request.getParameter("ref");
         String article=request.getParameter("article");
         String price=request.getParameter("price");
         Connection conn = DCM.getConnection();
         Statement stm = conn.createStatement();
         
      %>
        <div class="content">
            <form action="script-editarticle.jsp" method="POST" class="form-horizontal">
                <fieldset>
                    <legend>Modifier Commande</legend>
            <input class="form-control" value="<%=ref%>" type="text" name="ref" placeholder="Ref*" readonly><br/>
            <input class="form-control" value="<%=article%>" type="text" name="article" placeholder="Client"><br/>
            <input class="form-control" value="<%=article%>" type="text" name="article" placeholder="Client"><br/>
            <input class="form-control" value="<%=price%>" type="text" name="price" placeholder="Price*" ><br/>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Modifier">
                </fieldset>
            </form>
        </div>
    </body>
</html>