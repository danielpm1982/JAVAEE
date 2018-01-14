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
            p#p1{
                font-family: serif;
                font-weight: 200;
                text-decoration-line: underline;
                text-decoration-style: wavy;
            }
            p#p2{
                font-family: monospace;
                font-weight: 800;
                font-size: 2em;
                width: 90%;
                margin: auto;
                color: <% out.print(request.getAttribute("fontColor")); %>;
            }
            article{
                font-size: 0.4em;
                width: 80%;
                margin: auto;
                margin-top: 2.5em;
                border: solid 0.1em blanchedalmond;
                padding: 0.5em 0.5em 0.5em 0.5em;
                text-align: justify;
                line-height: 1.5em;
            }
            input[type="button"]{
                font-size: 0.35em;
                line-height: 2;
                font-weight: 900;
                margin: auto;
                margin-right: 0.5em;
                margin-left: 0.5em;
                background-color: lightskyblue;
                padding: 0.1em 0.7em 0.1em 0.7em;
            }
        </style>
    </head>
    <body>
        <p id="p1">Time at the Web Server is:</p>
        <p id="p2" title="Click once to update!">
            <% out.print(request.getAttribute("time")); %>
        </p>
        <input type="button" id="update" value="Update">
        <input type="button" id="stopUpdating" value="StopUpdating">
        <article>
            The client sends a request for the static html page at the web server, which
            is returned with a formulary for font color selecting. After, he submits the
            value of the select tag to the servlet "serv.do" located at the web component
            container of the J2EE Application Server (GlassFish). The servlet then creates 
            two attributes that are added to the request object (request scope), one containing the string 
            of the selected color and the other the string obtained from the model class Time, 
            which are both forwarded to the JSP through the request getRequestDispatcher() forward() 
            method. The JSP then receives the dispatching, as well as the request object with the two
            attributes, which can be accessed through scriptlets and printed out to the page
            the JSP will generate as the response to be passed to the Web Server and, from it, 
            back to the client (via HTTP/TCP-IP), as a single plain static html page. Another http get
            request is sent to the servlet (through javascript code) every n seconds or each time the 
            time area is clicked. Button event handlers can make another request or stop the automatic
            request interval at any time. The whole page is reloaded, as the servlet and JSP respond with a
            whole new different html page to the client. The ideal scenario, though, would be js accessing 
            JSON (AJAX) or JSONP web services that would give the data at the server side, and only that
            data in the page would be updated, using js and DOM.
        </article>
        <p id="hidden" hidden><% out.print(request.getAttribute("fontColor")); %></p>
        <script>
            var date = document.getElementById("p2");
            date.onclick=getDate;
            var updateButton = document.getElementById("update");
            updateButton.onclick=getDate;
            function getDate(){
                var url = "serv1.do?colorSelect="+document.getElementById("hidden").innerHTML;
                location.assign(url);
            }
            var timeoutId = setTimeout(getDate,5000);
            var stopUpdatingButton = document.getElementById("stopUpdating");
            stopUpdatingButton.onclick=stop;
            function stop(){
                clearTimeout(timeoutId);
                stopUpdatingButton.style.backgroundColor="chartreuse";
            }
        </script>
    </body>
</html>
