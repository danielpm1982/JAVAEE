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
                width: 12em;
                margin-bottom: 0em;
                margin-top: 0.5em;
            }
        </style>
    </head>
    <body>
        <p id="p1">OPS! A NumberFormat error has occurred !</p>
        <p class="optionP" id="option1">Click for Error StackTrace</p>
        <p id="p2" class="p2" hidden>
            <c:forEach var="stackElement" items="${pageContext.exception.stackTrace}">
                ${stackElement}
            </c:forEach>
        </p>
        <p class="optionP" id="option2">Click for Error Message</p>
        <p id="p3" class="p2" hidden>
            ${pageContext.exception.message};
        </p>
        <p class="optionP" id="option3">Click for Error Class (Type)</p>
        <p id="p4" class="p2" hidden>
            ${pageContext.exception.class};
        </p>
        <p class="optionP" id="option4">Click for Error Object String</p>
        <p id="p5" class="p2" hidden>
            ${pageContext.exception};
        </p>
        <img src="images/error.png" alt="error" title="error">
        <script>
            document.getElementById("option1").onclick=function(){
                removeAddHidden("p2");
            };
            document.getElementById("option2").onclick=function(){
                removeAddHidden("p3");
            };
            document.getElementById("option3").onclick=function(){
                removeAddHidden("p4");
            };
            document.getElementById("option4").onclick=function(){
                removeAddHidden("p5");
            };
            function removeAddHidden(elementId){
                if(document.getElementById(elementId).getAttribute("hidden")===""){
                    document.getElementById(elementId).removeAttribute("hidden");
                } else{
                    document.getElementById(elementId).setAttribute("hidden","");
                }
            }
        </script>
    </body>
</html>
