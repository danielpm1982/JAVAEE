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
                out.print("Your loginSessionName is: "+request.getSession().getAttribute("loginName")+"<br>");
                out.print("Your loginSessionPassword is: "+request.getSession().getAttribute("loginPassword")+"<br>");
            %>
        </p>
        <p class="underline"></p>
        <p class="p2"><% out.print(request.getSession().getAttribute("cookieInfo")); %></p>
        <p class="underline"></p>
        <form method="GET" action="serv7.do">
            <input type="submit" class="large" value="LogOut" title="logOut">
            <input type="hidden" class="large" name="logOut">
        </form>
        <article>
            An app for testing sessions, customized cookies and session listeners. View the next comments with the code.
            The main servlet first verifies if the client is requesting a new session (logging in), in order to invalidate any existing sessions
            and create another session with a new JSESSIONID. If not, verifies if the client is requesting a log off, so that,
            before invalidating the current session, data from Cookie objects can be retrieved and sent to the view through request attributes 
            (as the session would have already been invalidated when the view would be allowed to see its attributes data, but not the request).
            In case of logging off, the flux of the algorithm is interrupted and returned to the caller of this method (otherwise the method
            would continue to the next manipulation of session attributes with an inexisting session, throwing an illegal state exception).
            If the client is not requesting (through request parameters) any of the above two cases, the algorithm below simply runs to set 
            the session attributes and send them to the view. In the case of the specific attributes, there are 3 cases. The first case will be
            when the client is requesting a new session: a specific string salute is set and data from eventually existing cookies are added
            to this string. The client will see the data set at the session time (not persistable) as well as the eventually previous data
            persisted in cookies (client side) at previous different sessions. The second case is the one in which the client has already set
            a new session, has already set an attribute session with his info ("clientName" for instance), and sends a request to the servlet
            a second time, with his JSESSIONID on it (automatically set at the http request header). In this case, another string salute is set,
            welcoming him back, and, as in the first case, cookie data is searched to see if any exists to be added to this string (and shown at
            the view). The third specific case will be all others, including illegal url requests (different from the two cases above) as well as
            the case in which the session is not valid anymore (invalidated or timed out). If the user tries an illegal request, or the session has
            timed out, the session is invalidated (if already has not been) and the flux of the algorithm must also be stopped with a return at 
            the servlet, in order to not forwarding the flux to the normal expected JSP, but only to the exceptional (logged off) one.
            But before forwarding, the salute info is set at a request (and not session) attribute. In the first two cases, otherwise, a session scope 
            is used. The auxiliary classes SessionManager and CookiesManager are used to manipulate and formating the multi-scope attributes and 
            their returns and also to control which values are set according to the conditions dinamically tested at each request, respectively 
            regarding session's and cookies' info. These two managing classes are, though, not pure model classes, but also auxiliary controller ones. 
            It would be preferred a better separation of these in two other controller classes and two model ones, all controlled by the single main
            servlet. But for simplicity, it was put all that is auxiliary together as if they were pure model classes. It's surely a bad design, though. 
            Session listener classes were also added for testing purposes. All web component listeners: ServletRequestListener, ServletRequestAttributeListener, 
            ServletContextListener, ServletContextAttributeListener, HttpSessionListener, HttpSessionAttributeListener, 
            HttpSessionBidingListener, HttpSessionActivationListener. No attribute classes were used, only Strings as the attribute values, both 
            in request and session scopes. For migration of sessions between different JVMs (distributed), HttpSessionActivationListener should be used
            for solving serializing issues regarding attribute objects states, before and after migration (serialization and unserialization of the objects
            bound as attributes to the migrating session). All other web components are duplicated, except HttpSessions, which are migrated when necessary and 
            keep being unique for the whole distributed app (with its also unique JSESSIONID).
        </article>
    </body>
</html>
