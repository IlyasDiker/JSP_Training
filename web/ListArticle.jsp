<%-- 
    Document   : ListProduits
    Created on : 7 avr. 2020, 15:10:05
    Author     : Ilyas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Commandes</title>
        <style>
            .content{
                margin: 50px auto;
                width: 900px;
            }
            @media screen and (max-width: 900px) {
                .content{
                    width: auto;
                    margin: auto auto;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="home.jsp"%>
        <%String index = request.getParameter("index");%>
        <%String sv = "";
        if(index != null){
            sv = index;
        }
        %>
        <div class="content">
            <nav class="navbar navbar-light bg-light justify-content-between">
                <a class="navbar-brand">Search</a>
                <form action="script-search.jsp" method="POST" class="form-inline">
                  <input class="form-control form-control-sm mr-sm-2" type="search" placeholder="Ref" name="index" aria-label="Search">
                  <button class="btn btn-sm btn-outline-secondary my-2 my-sm-0" value="<%=sv%>" type="submit">Search</button>
                </form>
            </nav><br/>
            <table class="table table-hover ">
                <thead class="thead-dark">
                    <tr>
                        <th>Ref</th>
                        <th>Nom</th>
                        <th>Price</th>
                        <th>Stock(qte)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%  Connection conn = DCM.getConnection();
                        Statement stm = conn.createStatement();
                        ResultSet rs = null;
                        if (index!=null){
                            rs = stm.executeQuery("Select * from article where ref = "+index+" order by ref");
                        } else {
                            rs = stm.executeQuery("Select * from article order by ref");
                        }

                    while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><a href="EditArticle.jsp?ref=<%=rs.getString(1)%>&article=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&quantity=<%=rs.getString(4)%>" class="badge badge-primary">🖊 Modifier</a>
                            <a  OnClick="if(check = confirm('Are you sure')){window.location='script-deletearticle.jsp?ref=<%=rs.getString(1)%>'}"  class="badge badge-primary text-white">🗑 Suprimer</a></td>
                    </tr>
                      <%}%>
                </tbody>
            </table>
            <a href="AddArticle.jsp"><button type="button" class="btn btn-secondary btn-sm btn-block">Ajouter Article</button></a>
        </div>
    </body>
</html>
