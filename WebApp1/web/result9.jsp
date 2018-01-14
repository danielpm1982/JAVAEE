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
            p.p1{
                font-family: cursive;
                font-weight: 600;
                font-size: 0.7em;
                width: 50%;
                margin: auto;
                margin-bottom: 1em;
                color: blanchedalmond;
            }
            p.p2{
                font-family: sans-serif;
                font-weight: 600;
                font-size: 0.4em;
                width: 70%;
                margin: auto;
                margin-bottom: 1em;
                margin-top: 2em;
                color: blanchedalmond;
                letter-spacing: 0.1em;
                line-height: 1.5;
                padding: 0.5em;
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
        <p class="p1">Your session expired or you've logged out successfully!!</p>
        <form method="GET" action="index.html">
            <input type="submit" class="large" value="Home" title="Home">
        </form>
        <% 
            if(request.getAttribute("cookieInfo")!=null)
                out.print("<p class='p2'>"+request.getAttribute("cookieInfo")+"</p>"); 
        %>
    </body>
</html>
