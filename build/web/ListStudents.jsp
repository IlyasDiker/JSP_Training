<%-- 
    Document   : listclient
    Created on : 2 avr. 2020, 14:16:12
    Author     : Ilyas
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des Etudiants</title>
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
                        <th>CIN</th>
                        <th>Nom Complet</th>
                        <th>Genre</th>
                        <th>Telephone</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%  Connection conn = DCM.getConnection();
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery("Select * from students order by nomcp");
                    while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><a href="EditUser.jsp?cin=<%=rs.getString(1)%>&fname=<%=rs.getString(2)%>&gender=<%=rs.getString(3)%>&phone=<%=rs.getString(4)%>&mail=<%=rs.getString(5)%>" class="badge badge-primary">🖊 Modifier</a>
                            <a OnClick="if(check = confirm('Are you sure')){window.location='script-deletestudent.jsp?ref=<%=rs.getString(1)%>'}" class="text-white badge badge-primary">🗑 Suprimer</a></td>
                    </tr>
                      <%}%>
                </tbody>
            </table>
                      <a href="AddUser.jsp"><button type="button" href="Adduser.jsp" class="btn btn-secondary btn-sm btn-block">Ajouter Etudiant</button></a>
        </div>
    </body>
</html>
