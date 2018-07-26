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
                font-family: serif;
                font-weight: 200;
                text-decoration-line: underline;
                text-decoration-style: wavy;
            }
            p.p2,p.attributesNames{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.5em;
                width: 75%;
                margin: auto;
                text-align: left;
            }
            p.attributesNames:hover{
                background-color: chocolate;
            }
            p.p3{
                font-family: sans-serif;
                font-weight: 600;
                font-size: 0.5em;
                width: 75%;
                margin: auto;
                margin-bottom: 1em;
                color: chocolate;
                background-color: blanchedalmond;
            }
            p.underline{
                border-bottom: dashed 0.05em blanchedalmond;
                width: 75%;
                margin: auto;
                margin-top: 0.5em;
                margin-bottom: 0.5em;
            }
            article{
                font-size: 0.4em;
                width: 80%;
                margin: auto;
                margin-top: 2.5em;
                margin-bottom: 2.5em;
                border: solid 0.1em blanchedalmond;
                padding: 1em 1em 1em 1em;
                text-align: justify;
                line-height: 1.5em;
            }
            input[type="submit"]{
                /*display: block;*/
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
            input[type="text"]{
                font-size: 0.6em;
                font-family: monospace;
                color: chocolate;
                line-height: 1.5;
                font-weight: 600;
                display: table-cell;
                text-align: center;
            }
            form{
                display: inline;
            }
        </style>
    </head>
    <body>
        <p class="p1">Session attributes for this session:</p>
        <p class="p3"><% out.print(request.getSession().getAttribute("salute")); %></p>
        <p class="p2">
            <% 
                out.print("SessionId: "+request.getSession().getAttribute("sessionId")+"<br>");
                out.print("SessionDateTimeCreation: "+request.getSession().getAttribute("sessionDateTimeCreation")+"<br>");
                out.print("SessionLastAccessedTime: "+request.getSession().getAttribute("sessionLastAccessedTime")+"<br>");
                out.print("SessionMaxInactiveIntervalTime: "+request.getSession().getAttribute("sessionMaxInactiveIntervalTime")+"<br>");
            %>
        </p>
        <p class="underline"></p>
        <p class="p2">
            <%
                List<String> sessionAttributesNamesList = (List<String>)request.getSession().getAttribute("sessionAttributesNames");
                if(!sessionAttributesNamesList.isEmpty()){
                    for(String attributeName:sessionAttributesNamesList){
                        out.print("<p class='attributesNames' id='"+attributeName+"' title='Click twice to remove'>"+attributeName+" "+request.getSession().getAttribute(attributeName)+"</p>");
                    }
                } else{
                    out.print("Empty list!");
                }
            %>
        </p>
        <p class="underline"></p>
        <form method="GET" action="serv6.do">
            <input type="text" id="nameInputText" name="name" class="large" placeholder="Insert your name">
            <input type="submit" class="large" value="Submit" title="Submit">
        </form>
        <form method="GET" action="serv6.do">
            <input type="submit" class="large" id="removeAttributeButton" value="RemoveAttribute" title="RemoveAttribute">
            <input type="hidden" class="large" name="removeAttribute" value="true">
            <input type="hidden" class="large" id="attributeToRemove" name="attributeToRemove" value="">
        </form>
        <form method="GET" action="serv6.do">
            <input type="submit" class="large" value="LogOutSession" title="LogOutSession">
            <input type="hidden" class="large" name="logOutSession" value="true">
        </form>
        <article>
            REWRITE AND UPDATE !!!!!!
            
            At a first request, a static html page is responded with the option to log to a new session. Clicking on that submit input,
            the client sends a request to the servlet ("serv6.do") which first checks if there is a parameter from the html requiring a new session
            ("startNewSession"/"true"), and, if it is there, it invalidates any previous session and creates a new one. The first time the servlet runs,
            no client "name" request parameter will be available, so it just gets an empty sessionAttributesNamesList from the model and sets to a 
            sessionAttributesNames session attribute. It also gets the sessionId (directly) and the creation time of the session from the model, also
            setting these as session attributes for the view to access more directly. As no request attributes exist to be sent to the view (request scope), 
            the servlet then just redirects the flux of the app to the JSP page view. The JSP then shows the available session attributes and has a form to 
            submit other names, as parameters (with unique name/value pair), to be included by the same servlet ("serv6.do"), as attributes, at the current 
            session and displayed at the same JSP page (after the servlet updates the session attribute sessionAttributesNamesList with the model and redirect 
            again to the view). Every time the servlet runs, it checks if the session should be invalidated (if the request is sent by the html page with a 
            ("startNewSession"/"true")), and, if not, it uses the received JSESSIONID value, from the request cookie, to associate the request with an existing 
            session, and add the new parameters as attributes to this preexisting session other than starting a new one each time. The JSESSIONID if set at the 
            response, each time the client reveives it. The persistence of the session attributes lasts until the end of the session  (close of browser window), 
            or until the html page sends a new request for starting a new session, making the servlet invalidades the last one. The model class simply gets the 
            session.getCreationTime() (in epoch milis) and returns a String with the corresponding ZonedDateTime already formatted. And, on another method, 
            it just gets the session.getAttributeNames() as an ordered List instead of the default Enumeration and unordered return. If cookies are rejected 
            from the client browser, the app won't work, because the response will put the field set-cookie: JSESSOINID at its header but the client will simply 
            ignore it and each request will be sent without the cookie field, and this way the servlet won't ever be able to identify or associate the client 
            request with any existing session. A way to overcome this issue would be to use URL rewriting, by using response.encodeURL("/url") or 
            response.encodeRedirectURL("/url"), so that each url would have the JSESSIONID concatenated to it, and the servlet, if detected, at another request, 
            that the cookies are disabled, it would take this session ID not from the request header cookie field (which wouldn't exist) but from the request url 
            itself. It was tried but unfortunately it didn't work with this app. The encodeURL simply does not concatenates anything to any URL, neither in the servlet 
            nor in the JSP page, and requests keep being treated as a new session each time they get to the servlet (when cookies are disabled).
        </article>
        <script>
            document.getElementById("nameInputText").onfocus=function(){
                document.getElementById("nameInputText").setAttribute("placeholder","");
            };
            document.getElementById("nameInputText").onblur=function(){
                document.getElementById("nameInputText").setAttribute("placeholder","Insert your name");
            };
            document.getElementById("removeAttributeButton").onclick=function(){
                var confirmation = confirm("Remove "+document.getElementById("nameInputText").value+" ?");
                if(confirmation){
                    document.getElementById("attributeToRemove").value=document.getElementById("nameInputText").value;
                }        
            };
            var attributesNames;        
            attributesNames = document.getElementsByClassName("attributesNames");
            for(var i=0;i<attributesNames.length;i++){
                attributesNames[i].ondblclick=function(){
                    document.getElementById("nameInputText").value=this.id;
                    document.getElementById("removeAttributeButton").click();
                };
            }
        </script>
    </body>
</html>
