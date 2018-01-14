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
                font-size: 0.6em;
                width: 80%;
                margin: auto;
                margin-top: 1.6em;
                border: solid 0.1em blanchedalmond;
                padding: 0.5em 0.5em 0.5em 0.5em;
                text-align: justify;
                line-height: 1.5em;
            }
            a:link    {color:blanchedalmond; background-color:transparent; text-decoration:none}
            a:visited {color:aqua; background-color:transparent; text-decoration:none}
            a:hover   {color:lightblue; background-color:transparent; text-decoration:underline}
            a:active  {color:aquamarine; background-color:transparent; text-decoration:underline}
            a#webAddress{
                font-size: 1em;
            }
            a#mailAddress{
                font-size: 0.5em;
            }
            a#mailAddress:link    {color:blanchedalmond; background-color:transparent; text-decoration:none}
            a#mailAddress:hover   {color:chocolate; background-color:transparent; text-decoration:underline}
        </style>
    </head>
    <body>
        <p id="p1">WebAddress is:</p>
        <p id="p2" title="click to update!">
            <!--<a id="webAddress" href="http://<% out.print(request.getAttribute("webAddress")); %>" title="webAddress"><% out.print(request.getAttribute("webAddress")); %></a>-->
            <a id="webAddress" href="http://<% out.print(request.getServletContext().getInitParameter("webAddress")); %>" title="webAddress"><% out.print(request.getServletContext().getInitParameter("webAddress")); %></a>
            <br>
            email: 
            <!--<a id="mailAddress" href="mailto:<% out.print(request.getAttribute("mailAddress")); %>" title="mailAddress"><% out.print(request.getAttribute("mailAddress")); %></a>-->
            <a id="mailAddress" href="mailto:<% out.print(request.getServletContext().getInitParameter("mailAddress")); %>" title="mailAddress"><% out.print(request.getServletContext().getInitParameter("mailAddress")); %></a>
        </p>
        <article>
            The same as serv2.do, except that the initParameters are defined as context init parameters, at the web.xml,
            for the whole app, and not only for a certain servlet. Any servlet can then obtain these parameters
            through getServletContext().getInitParameter() method and forward them as attributes to the view (either using a
            context (application), request or session scope). Or, the JSP page itself could get them by the same way, 
            without needing servlets to forward them to it. The context initParameters, as well as the servlet initParameters, 
            are constants defined at the initialization of the servlets and jsps, so that only after the init() method is called 
            is that these parameters turn available to the app, as, for instance, after the service() can be called... 
            but not before the initialization.
        </article>
        <script>
            var body = document.getElementsByTagName("body")[0];
            body.setAttribute("title","Click for updating!");
            body.onclick=getWebAddress;
            function getWebAddress(){
                var url = "serv3.do";
                location.assign(url);
            }
        </script>
    </body>
</html>
