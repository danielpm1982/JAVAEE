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
            <a id="webAddress" href="http://<% out.print(request.getAttribute("webAddress")); %>" title="webAddress"><% out.print(request.getAttribute("webAddress")); %></a>
            <br>
            email: 
            <a id="mailAddress" href="mailto:<% out.print(request.getAttribute("mailAddress")); %>" title="mailAddress"><% out.print(request.getAttribute("mailAddress")); %></a>
        </p>
        <article>
            At the first request, the user is served a html static page at which he can click on showWebAddress in
            order to send another request, this time to serv2.do. The correspondent mapped servlet gets
            the initParameters set at its servletConfig (at its init() time, before any service() can be called)
            and then set them as attributes at the request object (as each request arrives, and at a request scope), 
            which is forwarded via requestDispatcher to the jsp. The JSP page then shows the requested data as links 
            (webAddress and mailAddress). This is only an example of getting and using servletConfig() and initParameters 
            from a servlet and a web.xml.
        </article>
        <script>
            var body = document.getElementsByTagName("body")[0];
            body.setAttribute("title","Click for updating!");
            body.onclick=getWebAddress;
            function getWebAddress(){
                var url = "serv2.do";
                location.assign(url);
            }
        </script>
    </body>
</html>
