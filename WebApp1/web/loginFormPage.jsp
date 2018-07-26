<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE !!!</title>
        <style>
            body{
                color: blanchedalmond;
                background-color: black;
                text-align: center;
                font-size: 3em;
            }
            div#loginText{
                border: solid 8px chocolate;
                width: 22em;
                margin: auto;
                margin-top: 0.8em;
            }
            p{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                display: inline;
                position: relative;
                top: -1.3em;
            }
            p.p2{
                font-family: sans-serif;
                font-weight: 400;
                font-size: 0.4em;
                display: block;
                position: static;
            }
            p.p3{
                font-family: sans-serif;
                font-weight: 400;
                font-size: 0.3em;
                display: block;
                position: static;
                margin-bottom: 1em;
            }
            footer{
                width: 70%;
                margin: auto;
                line-height: 1;
                margin-top: 0em;
                border: dashed lightgreen medium;
                margin-bottom: 0.5em;
                padding-bottom: 0.1em;
            }
            img{
                width: 5em;
                margin-bottom: 0em;
                margin-top: 1.3em;
            }
            img.smallImg1{
                width: 2em;
                display: inline;
                margin-bottom: 0em;
                margin-top: 0em;
                margin-left: 1.5em;
                margin-right: 1.5em;
                margin-bottom: 0.1em;
                position: relative;
                top: -0.05em;
            }
            img.smallImg2{
                width: 1.7em;
                display: inline;
                margin-bottom: 0em;
                margin-top: 0.3em;
                margin-left: 1.5em;
                margin-right: 1.5em;
                margin-bottom: 0.1em;
                position: relative;
                top: 0.05em;
            }
            input[type="submit"]{
                font-size: 0.4em;
                line-height: 2;
                font-weight: 900;
                display: block;
                margin: auto;
                background-color: lightskyblue;
                width: 8em;
                position: relative;
                top: 1.5em;
            }
            input[type="text"],input[type="password"]{
                font-size: 0.4em;
                line-height: 2;
                font-weight: 500;
                display: table-cell;
                vertical-align: central;
                margin-top: 2em;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div id="loginText">
            <img class="smallImg1" src="images/login2.png" alt="login" title="login">
            <p>Please, log in below:</p>
            <img class="smallImg2" src="images/login3.png" alt="login" title="login">
        </div>
        <form method="POST" action="j_security_check">
            <input type="text" name="j_username" placeholder="Username" autofocus>
            <input type="password" name="j_password" placeholder="Password">
            <input type="submit" value="Log in">
        </form>
        <img src="images/login.png" alt="login" title="login"><br>
        <footer>
            <p class="p2">(Daniel/admin and Daniel2/admin2 are registered user roles that may or may not have access to each resource *)</p>
            <p class="p3">* See GlassFish Server Administration Console, at localhost:4848, Configurations->server-config->Security->Realms->file for Manage Users config at the server. And sun-web.xml for mapping users into roles at the app and at web.xml security-role and security-constraint elements.</p>
        </footer>
    </body>
</html>
