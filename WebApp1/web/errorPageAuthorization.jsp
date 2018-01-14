<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                margin-top: 1.5em;
                border: solid 8px chocolate;
                padding: 0.5em;
            }
            p.p2{
                font-size: 0.34em;
                text-align: left;
                border: dashed 3px chocolate;
                margin-top: 0em;
                
            }
            p.optionP{
                font-size: 0.5em;
                border: none;
                text-align: left;
                background-image: url("images/option.png");
                background-position: left;
                background-repeat: no-repeat;
                padding-left: 3em;
                width: 58%;
                margin-bottom: 0.6em;
                margin-top: 1em;
            }
            img{
                width: 6em;
                margin-bottom: 0em;
                margin-top: 1em;
            }
        </style>
    </head>
    <body>
        <p id="p1">Your authenticated role is not authorized to make use of the requested resource !!</p>
        <img src="images/authFailed.png" alt="authFailed" title="authFailed">
    </body>
</html>
