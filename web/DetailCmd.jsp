<%-- 
    Document   : DetailCmd
    Created on : 9 avr. 2020, 13:05:49
    Author     : Ilyas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.gestions.DCM"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
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
        <% 
            String ref = request.getParameter("ref");


            Connection conn = DCM.getConnection();
            Statement stm = conn.createStatement();
            String sql = "SELECT ref, datecmd, client, article, quantity, price FROM commandes WHERE "
                    + "ref='"+ref+"'";
            System.out.println(sql);
            ResultSet rs = stm.executeQuery(sql);
            rs.next();
            
        %>
        <div class="content">
            <form method="POST" class="form-horizontal">
                <fieldset>
                    <legend>Details Commande</legend>
              
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Ref</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="<%=rs.getString(1)%>" placeholder="Ref" readonly>
                    </div>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Date Commande</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="<%=rs.getString(2)%>" placeholder="Date Commande" readonly>
                    </div>
                    <label for="exampleFormControlSelect1">Client</label>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Cin</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="<%=rs.getString(3)%>" placeholder="Cin" readonly>
                    </div>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Nom Client</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="" placeholder="Nom Client" readonly>
                    </div>
                    <label for="exampleFormControlSelect1">Article</label>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Ref Article</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="<%=rs.getString(4)%>" placeholder="Ref article" readonly>
                    </div>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Nom Article</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="" placeholder="Nom Article" readonly>
                    </div>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Quantity</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="<%=rs.getString(5)%>" placeholder="Quantity" readonly>
                    </div>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Price</div>
                      </div>
                      <input type="text" class="form-control" id="inlineFormInputGroupUsername2" value="<%=rs.getString(6)%>" placeholder="Price" readonly>
                    </div>

                </fieldset>
            </form>
        </div>
    </body>
</html>
