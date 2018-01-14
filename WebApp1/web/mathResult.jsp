<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page errorPage="errorPage.jsp" %>--%><%-- defined at web.xml. Could be overriden here, if it was the case. --%>
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
                display: table-row;
            }
            p.p3{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.6em;
            }
            p#twinkleP{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.6em;
                display: block;
                width: 54%;
                margin: auto;
                margin-top: 0.5em;
            }
            p.p4{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                width: 90%;
                margin: auto;
            }
            p.p2:nth-child(2n+1){
                background-color: darksalmon;
            }
            p.p2:nth-child(2n){
                background-color: darkred;
            }
            div.div1{
                display: table;
                margin: auto;
                margin-top: 2.5em;
                line-height: 2;
                width: 10em;
            }
            div.div2{
                margin: auto;
                line-height: 2;
                width: 20em;
                border: dashed 0.1em chocolate;
                padding-bottom: 0.5em;
                margin-top: 7%;
            }
            div.div3{
                margin: auto;
                line-height: 2;
                width: 20em;
                border: solid 0.1em lightblue;
                padding-bottom: 0.5em;
                margin-top: 3.5%;
            }
            input[type="number"]{
                font-size: 0.8em;
                font-weight: 800;
                width: 4em;
                height: 1.5em;
                text-align: center;
            }
            input[type="submit"]{
                font-size: 0.7em;
                font-weight: 800;
                width: 5em;
                height: 1.9em;
                text-align: center;
                background-color: blanchedalmond;
            }
            span{
                margin-right: 0.25em;
                margin-left: 0.25em;
            }
        </style>
    </head>
    <body>
        
        <%--
        <div class="div1">
            <p class="p2">Number1 = ${param.number1}</p>
            <p class="p2">Number2 = ${param.number2}</p>
            <% int a = Integer.parseInt(request.getParameter("number1")); int b = Integer.parseInt(request.getParameter("number2")); int c=a/b;
                   pageContext.setAttribute("mathResult", String.valueOf(c));
            %>
            <p class="p2">Number1/Number2 = ${pageScope.mathResult}</p>
        </div>
        --%>
        
        <div class="div1">
            <p class="p2">Number1 = ${param.number1}</p>
            <p class="p2">Number2 = ${param.number2}</p>
            <c:catch var="errorCatched">
                <% int a = Integer.parseInt(request.getParameter("number1")); int b = Integer.parseInt(request.getParameter("number2")); int c=a/b;
                   pageContext.setAttribute("mathResult", String.valueOf(c));
                %>
            </c:catch>
            <c:if test="${pageScope.errorCatched == null}">
                <p class="p2">Number1/Number2 = ${pageScope.mathResult}</p>
            </c:if>
        </div>
        <c:if test="${pageScope.errorCatched == null}">
            <div class="div3">
                <p class="p3" id="twinkleP"><span id="span1">*****</span><span id="span2">Division Successfull !!</span><span id="span3">*****</span></p>
                <p class="p3">For another operation, fill out the fields below:</p>
                <form method="get" action="mathResult.jsp">
                    <p class="p4"><input type="number" name="number1" required> divided by <input type="number" name="number2" required> = 
                    <input type="submit" value="Divide!" title="Process operation at server side" onmouseup="this.blur()"></p>
                </form>
            </div>
            <script>
                var span1 = document.getElementById("span1"); 
                var span2 = document.getElementById("span2"); 
                var span3 = document.getElementById("span3");
                var twinkleP = document.getElementById("twinkleP");
                
                function twinkle(){
                    span1.style.color="black";
                    span2.style.color="black";
                    span3.style.color="black";
                    setTimeout(function(){span1.style.color="blanchedalmond";},200);
                    setTimeout(function(){span2.style.color="blanchedalmond";},600);
                    setTimeout(function(){span3.style.color="blanchedalmond";},1000);
                    setTimeout(function(){span2.style.textDecoration = "overline";},1400);
                    setTimeout(function(){span2.style.textDecoration = "underline overline";span2.style.color = "lightgreen";span1.style.color = "yellow";span3.style.color = "yellow";},1800);
                    setTimeout(function(){twinkleP.style.backgroundColor = "darkblue";},2200);
                    setTimeout(function(){span2.style.textDecoration = ""; twinkleP.style.backgroundColor = "";},3500);
                }
                window.onload = function(){
                    twinkle();
                    window.setInterval(twinkle,3800);
                };
            </script>
        </c:if>
        <c:if test="${pageScope.errorCatched != null}">
            <%--<jsp:forward page="/errorPage.jsp" />--%>
            <div class="div2">
                <p class="p3">Exception "${pageScope.errorCatched}" has been thrown. Try again below (type valid integers and DO NOT divide by zero!):</p>
                <form method="get" action="mathResult.jsp">
                    <p class="p4"><input type="number" name="number1" required> divided by <input type="number" name="number2" required> = 
                    <input type="submit" value="Divide!" title="Process operation at server side" onmouseup="this.blur()"></p>
                </form>
            </div>
        </c:if>
    </body>
</html>
    