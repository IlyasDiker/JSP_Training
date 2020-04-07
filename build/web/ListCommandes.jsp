<%-- 
    Document   : GestionCommande
    Created on : 7 avr. 2020, 12:11:01
    Author     : Ilyas
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gestions.DCM"%>
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
        <div class="content">
            <table class="table table-hover table-responsive-md">
                <thead class="thead-dark">
                    <tr>
                        <th>Ref</th>
                        <th>Article</th>
                        <th>Client</th>
                        <th>Price</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%  Connection conn = DCM.getConnection();
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("Select * from commandes order by ref");
                    while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><a href="EditCmd.jsp?ref=<%=rs.getString(1)%>&article=<%=rs.getString(2)%>&client=<%=rs.getString(3)%>&price=<%=rs.getString(4)%>" class="badge badge-primary">🖊 Modifier</a>
                            <a OnClick="if(check = confirm('Are you sure')){window.location='script-deletecmd.jsp?ref=<%=rs.getString(1)%>'}" class="badge badge-primary text-white">🗑 Suprimer</a></td>
                    </tr>
                      <%}%>
                </tbody>
            </table>
            <a href="AddCmd.jsp"><button type="button" class="btn btn-secondary btn-sm btn-block">Ajouter Commande</button></a>
        </div>
    </body>
</html>
