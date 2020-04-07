<%-- 
    Document   : RegisterClient
    Created on : 10 mars 2020, 08:24:46
    Author     : Ilyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="box">
            <h2 class="titre">Register</h2>
            <form action="script-register.jsp" method="POST">
                <input class="inpfield" type="text" name="cin" placeholder="CIN*" required><br/>
                <input class="inpfield" type="text" name="fullname" placeholder="Full Name*" ><br/>
                <input class="radiobox" type="radio" id="Male" name="Gender" value="Male" checked>Male
                <input class="radiobox" type="radio" id="Female" name="Gender" value="Female">Female<br/>
                <input class="inpfield" type="tel" name="phone" placeholder="Telephone"><br/>
                <input class="inpfield" type="email" name="mail" placeholder="Email*" ><br/>
                <input class="inpfield" type="password" name="pass" placeholder="Password*" required><br/>
                <input class="inpbtn" type="submit" value="Register">
                <div class="text"><p>You already have an account, <a href='LoginClient.jsp'>Login</a></p></div>
            </form>
        </div>
    </body>
</html>

