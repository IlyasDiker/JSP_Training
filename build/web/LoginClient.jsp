<%-- 
    Document   : ajoutClient
    Created on : 6 mars 2020, 11:20:31
    Author     : Ilyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="box">
            <h2 class="titre">Login</h2>
            <form action="script-login.jsp" method="POST">
                <input class="inpfield" type="text" name="uid" placeholder="Username" required><br/>
                <input class="inpfield" type="password" name="pass" placeholder="Password" required><br/>
                <input class="inpbtn" type="submit" value="Se Connecter">
                <div class="text"><p>You don't have an account, <a href='RegisterClient.jsp'>Sign up</a></p></div>
            </form>
        </div>
    </body>
</html>

