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
            p.p3{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.5em;
                width: 40%;
                margin: auto;
                margin-top: 3em;
                border: dashed 0.5em brown;
                padding: 2em;
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
            a:link    {color:blanchedalmond; background-color:transparent; text-decoration:none}
            a:visited {color:aqua; background-color:transparent; text-decoration:none}
            a:hover   {color:lightblue; background-color:transparent; text-decoration:underline}
            a:active  {color:aquamarine; background-color:transparent; text-decoration:underline}
            a#webAddress{
                font-size: 2em;
            }
            a#mailAddress{
                font-size: 1em;
            }
            a#mailAddress:link    {color:blanchedalmond; background-color:transparent; text-decoration:none}
            a#mailAddress:hover   {color:chocolate; background-color:transparent; text-decoration:underline}
        </style>
    </head>
    <body>
        <p class="p1">WebAddress is:</p>
        <p class="p2" title="click to update!">
            <a id="webAddress" href="http://<%= config.getInitParameter("webAddress") %>" title="webAddress"><%= config.getInitParameter("webAddress") %></a>
            <br>
            email: 
            <a id="mailAddress" href="mailto:<%= config.getInitParameter("emailAddress") %>" title="mailAddress"><%= config.getInitParameter("emailAddress") %></a>
        </p>
<%--
        <%! 
            public void jspInit(){
                getServletContext().setAttribute("webAddress", getServletConfig().getInitParameter("webAddress"));
                getServletContext().setAttribute("emailAddress", getServletConfig().getInitParameter("emailAddress"));
            }
        %>
        <p class="p2" title="click to update!">
            <a id="webAddress" href="http://<%= application.getAttribute("webAddress") %>" title="webAddress"><%= application.getAttribute("webAddress") %></a>
            <br>
            email: 
            <a id="mailAddress" href="mailto:<%= application.getAttribute("emailAddress") %>" title="mailAddress"><%= application.getAttribute("emailAddress") %></a>
        </p>
--%>

        <p class="p3" title="click to update!">
            Time at deploying time:<br>
            <%= 
                "<br>"+pageContext.findAttribute("zonedTime1")+"<br><br>"+pageContext.findAttribute("zonedTime2")+"<br><br>"+
                pageContext.findAttribute("zonedTime3")+"<br><br>"+pageContext.findAttribute("zonedTime4")+"<br><br>"+
                pageContext.findAttribute("zonedTime5")
            %>
            <%--
            <%= 
                "<br>"+pageContext.getAttribute("zonedTime1",PageContext.APPLICATION_SCOPE)+"<br><br>"+pageContext.getAttribute("zonedTime2",PageContext.APPLICATION_SCOPE)+"<br><br>"+
                pageContext.getAttribute("zonedTime3",PageContext.APPLICATION_SCOPE)+"<br><br>"+pageContext.getAttribute("zonedTime4",PageContext.APPLICATION_SCOPE)+"<br><br>"+
                pageContext.getAttribute("zonedTime5",PageContext.APPLICATION_SCOPE)
            %>
            --%>
            <%--
            <%= 
                "<br>"+application.getAttribute("zonedTime1")+"<br><br>"+application.getAttribute("zonedTime2")+"<br><br>"+application.getAttribute("zonedTime3")+
                "<br><br>"+application.getAttribute("zonedTime4")+"<br><br>"+application.getAttribute("zonedTime5")
            %>
            --%>
        </p>
        <article>
            The same as serv2.do, but in a JSP page and getting the init parameters through the implicit JSP object config, and configuring the init params 
            at web.xml with a "jsp-file" xml tag instead of the servlet-class tag, to map the params to the automatic generated servlet from the specified JSP page, 
            that is, this one. The servlet-mapping must also be defined, as in a normal servlet, with the jsp url-pattern associated to the servlet-name.
            It could also be overridden the jspInit() method at a declaration tag, as in the commented code above, taken the parameters from
            the servletConfig directly and set them as attributes in the servletContext (application) scope so that the JSP would have access to their values
            to display. After having read the web.xml file at deploying time, and at a first request from the client, the Container translates the JSP page to .java
            file and then compiles it to binary code. Then it loads the compiled .class code, instantiates an automatic servlet based on this code and, at the
            init() method of this servlet, and after servletConfig and servletContext have been initialized, it calls the jspInit() method. The servlet resulting
            from the jsp is then a full-fledged servlet from which, for each request, a thread is generated, and at each thread, the _jspService() method can be
            called to treat the HttpServletRequest and HttpServletResponse received either from a common other servlet (by dispatching/forwarding) or directly
            from a html link or form tags or from a url at a browser.
            As an example of getting attributes from any scope in a JSP using PageContext, 3 ways of getting them are shown above: 
            - the 1st one using findAttribute(), which looks at the Page scope and if there is not the searched attribute name in there it searches the other 3 scopes 
            from the most strict to the least strict one;
            - the 2nd one using a second argument at the getAttribute() method indicating the constant of the scope where we know the attribute is;
            - the 3rd one, using application implicit object instead of pageContext (case 2), which end up being the same
            as the second case<br>(pageContext.getAttribute("x",PageContext.APPLICATION_SCOPE) == application.getAttribute("x")).
            The main JSP implicit objects are: out, request, response, session, application, config, exception, pageContext and page.
        </article>
        <script>
            var body = document.getElementsByTagName("body")[0];
            body.setAttribute("title","Click for updating!");
            body.onclick=getWebAddress;
            function getWebAddress(){
                var url = "result10.do";
                location.assign(url);
            }
        </script>
    </body>
</html>
