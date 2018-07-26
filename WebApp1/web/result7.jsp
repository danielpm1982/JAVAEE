<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
        <style>
            body{
                color: blanchedalmond;
                background-color: black;
                text-align: center;
                font-size: 3em;
            }
            p{
                font-family: cursive;
                font-weight: 600;
                font-size: 0.7em;
                width: 50%;
                margin: auto;
                margin-bottom: 1em;
                color: blanchedalmond;
            }
            input[type="submit"]{
                display: block;
                font-size: 0.4em;
                line-height: 1.5;
                font-weight: 800;
                margin: auto;
                margin-top: 1.5em;
                background-color: blanchedalmond;
                color: black;
                width: 4em;
            }
            input[type="submit"].large{
                width: 10em;
            }
            img{
                margin-top: 1em;
            }
        </style>
    </head>
    <body>
        <img alt="logout" src="images/logout.png">
        <p class="p2">Your session expired or you've logged out successfully!!</p>
        <form method="GET" action="serv6.do">
            <input type="submit" class="large" value="LogNewSession" title="LogSession">
            <input type="hidden" class="large" name="startNewSession" value="true" title="LogNewSession">
        </form>
        <form method="GET" action="index.html">
            <input type="submit" class="large" value="Home" title="Home">
        </form>
    </body>
</html>
