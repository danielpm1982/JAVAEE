<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
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
                font-family: serif;
                font-weight: 200;
                text-decoration-line: underline;
                text-decoration-style: wavy;
            }
            p.p2{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                width: 90%;
                margin: auto;
            }
            article{
                font-size: 0.6em;
                width: 80%;
                margin: auto;
                margin-top: 2em;
                margin-bottom: 2em;
                border: solid 0.1em blanchedalmond;
                padding: 0.5em 0.5em 0.5em 0.5em;
                text-align: justify;
                line-height: 1.5em;
            }
            table{
                font-size: 0.5em;
                color: black;
                margin: auto;
                margin-top: 0.5em;
                margin-bottom: 0.5em;
            }
            tr:nth-child(2n){
                background-color: blanchedalmond;
            }
            tr:nth-child(2n+1){
                background-color: burlywood;
            }
            td{
                padding: 0.5em;
                padding-top: 0.2em;
                padding-bottom: 0.2em;
            }
        </style>
    </head>
    <body>
        <div>
            <p class="p2">SessionIsNew ? ${pageContext.session.isNew()}</p>
            <p class="p2">SessionId: ${pageContext.session.id}</p>
            <p class="p2">Name: ${param.myName}</p>
            <p class="p2">Address: ${param.myAddress}</p>
        </div>
        <article>
            .
        </article>
    </body>
</html>
