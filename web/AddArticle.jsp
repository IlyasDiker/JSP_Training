<%-- 
    Document   : AddArticle
    Created on : 7 avr. 2020, 15:21:10
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
        <title>Ajouter Article</title>
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
        <%  Connection conn = DCM.getConnection();
                Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery("Select max(ref) from article");
                int maxref = 0;
                while(rs.next()){
                    if(rs.getString(1)== null){
                        maxref = 1;
                    }else {
                        maxref = Integer.parseInt(rs.getString(1));
                        maxref = maxref+1;
                    }
                }
        %>
        <div class="content">
            <form action="script-addarticle.jsp" method="POST" class="form-horizontal">
                <fieldset>
                    <legend>Ajouter Article</legend>
            <input class="form-control" value="<%=maxref%>" type="text" name="ref" placeholder="Ref*" readonly><br/>
            <input class="form-control" type="text" name="nom" placeholder="Article" ><br/>
            <input class="form-control" type="number" name="price" placeholder="Price*" ><br/>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Ajouter">
                </fieldset>
            </form>
        </div>
    </body>
</html>
