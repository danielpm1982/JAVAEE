<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR PAGE !!!</title>
        <style>
            body{
                color: blanchedalmond;
                background-color: black;
                text-align: center;
                font-size: 3em;
            }
            p{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                width: 60%;
                margin: auto;
                margin-top: 3em;
                margin-bottom: 2em;
                border: solid 0.3em chocolate;
                padding: 0.5em;
            }
            img{
                width: 15em;
            }
        </style>
    </head>
    <body>
        <p>OPS! A NOT FOUND error has occurred !<br>Please check the url for the requested resource or call our support.</p>
        <img src="images/error.png" alt="error" title="error">
    </body>
</html>
