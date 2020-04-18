<%-- 
    Document   : EditCmd
    Created on : 7 avr. 2020, 12:44:20
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
        <title>Modifier Commande</title>
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
        <script>
            function setprice() {
                var comb = document.getElementById("exampleFormControlSelect1");
                var data = comb.options[comb.selectedIndex].dataset.price;
                var qte = document.getElementById("blasadyalquantity").value;
                data = data * qte;
                document.getElementById("blasadyalprice").value = data;
            }
        </script>
    </head>
    <body>
        <%@include file="home.jsp"%>
         <%
         String ref=request.getParameter("ref");
         String article=request.getParameter("article");
         String client=request.getParameter("client");
         String price=request.getParameter("price");
         String qte=request.getParameter("qte");
         Connection conn = DCM.getConnection();
         Statement stm = conn.createStatement();
         
      %>
        <div class="content">
            <form action="script-editcmd.jsp" method="POST" class="form-horizontal">
                <fieldset>
                    <legend>Modifier Commande</legend>
            <input class="form-control" value="<%=ref%>" type="text" name="ref" placeholder="Ref*" readonly><br/>
            <!--input class="form-control" value="<%=article%>" type="text" name="article" placeholder="Article" ><br/-->
            <div class="form-group">
                <label for="exampleFormControlSelect1">Client</label>
                <select class="form-control" id="exampleFormControlSelect2" name="client">
                    <%  
                        ResultSet rs3 = stm.executeQuery("Select cin, nomcp from students");
                        while(rs3.next()){
                            %>
                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
                    <%}%>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Produit <span class="badge badge-info">Soory, our policy doesn't allow changing item</span></label>
                <select class="form-control" id="exampleFormControlSelect1" name="article" onchange="setprice()">
                    <%  
                        ResultSet rs2 = stm.executeQuery("Select ref, nom, price from article where ref = "+article);
                        while(rs2.next()){
                            %>
                    <option value="<%=rs2.getString(1)%>" data-price="<%=rs2.getString(3)%>"><%=rs2.getString(2)%></option>
                    <%}%>
                </select>
            </div>
            
            <!--input class="form-control" value="<%=client%>" type="text" name="client" placeholder="Client"><br/-->
            <input class="form-control" value="<%=qte%>" type="text" id="blasadyalquantity" onchange="setprice()" name="qte" placeholder="Quantity*"><br/>
            <input class="form-control" value="<%=price%>" type="text" id="blasadyalprice" name="price" placeholder="Price*" readonly><br/>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Modifier">
                </fieldset>
            </form>
        </div>
    </body>
</html>
