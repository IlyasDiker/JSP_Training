<%-- 
    Document   : AddUser
    Created on : 7 avr. 2020, 01:08:44
    Author     : Ilyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter Etudiant</title>
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
        <div class="content">
            <form action="script-adduser.jsp" method="POST" class="form-horizontal">
                <fieldset>
                    <legend>Ajouter Etudiant</legend>
            <input class="form-control" type="text" name="cin" placeholder="CIN*" required><br/>
            <input class="form-control" type="text" name="fullname" placeholder="Full Name*" ><br/>
            <div class="form-group">
                <label class="col-md-4 control-label" for="Gender">Gender</label>
                <div class="col-md-4">
                <div class="radio">
                  <label for="Gender-0">
                    <input type="radio" name="Gender" id="Male" value="Male" checked="checked">
                    Male
                  </label>
                      </div>
                <div class="radio">
                  <label for="Gender-1">
                    <input type="radio" name="Gender" id="Female" value="Female">
                    Female
                  </label>
                      </div>
                </div>
              </div>
            <input class="form-control" type="tel" name="phone" placeholder="Telephone"><br/>
            <input class="form-control" type="email" name="mail" placeholder="Email*" ><br/>
            <input class="form-control" type="password" name="pass" placeholder="Password*" required><br/>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Ajouter">
                </fieldset>
            </form>
        </div>
    </body>
</html>
