<%-- 
    Document   : AddCmd
    Created on : 7 avr. 2020, 12:29:23
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
        <title>Ajouter Commande</title>
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
                ResultSet rs = stm.executeQuery("Select max(ref) from commandes");
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
            <form action="script-addcmd.jsp" method="POST" class="form-horizontal">
                <fieldset>
                    <legend>Ajouter Commande</legend>
            <input class="form-control" value="<%=maxref%>" type="text" name="ref" placeholder="Ref*" readonly><br/>
            <!--input class="form-control" type="text" name="article" placeholder="Article" ><br/-->
            <div class="form-group">
                <label for="exampleFormControlSelect1">Produit</label>
                <select class="form-control" id="exampleFormControlSelect1" name="article">
                    <%  
                        ResultSet rs2 = stm.executeQuery("Select ref, nom from article");
                        while(rs2.next()){
                            %>
                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
                    <%}%>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Client</label>
                <select class="form-control" id="exampleFormControlSelect1" name="client">
                    <%  
                        ResultSet rs3 = stm.executeQuery("Select cin, nomcp from students");
                        while(rs3.next()){
                            %>
                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
                    <%}%>
                </select>
            </div>
            <!--input class="form-control" type="text" name="client" placeholder="Client"><br/-->
            <input class="form-control" type="number" name="price" placeholder="Price*" ><br/>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Ajouter">
                </fieldset>
            </form>
        </div>
    </body>
</html>
