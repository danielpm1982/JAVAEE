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
                color: <% out.print(getServletContext().getAttribute("fontColor")); %>;
            }
            article{
                font-size: 0.4em;
                width: 80%;
                margin: auto;
                margin-top: 2.5em;
                margin-bottom: 2.5em;
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
<!--        <p id="p2" title="Click once to update!">
            <% out.print(getServletContext().getAttribute("time")); %>
        </p>-->
<!--        <p id="p2" title="Click once to update!">
            <% out.print(session.getAttribute("time")); %>
        </p>-->
        <p id="p2" title="Click once to update!">
            <% out.print(request.getAttribute("time")); %>
        </p>
        <input type="button" id="update" value="Update">
        <input type="button" id="stopUpdating" value="StopUpdating">
        <article>
            The same as with serv1/result1 case, but using context (app) attributes, instead of request
            attributes (these are always thread-safe), and garanteeing, at least during servlet5 processing, that 
            the set of these attributes, until the forwarding of the flux to the view, is thread safe, with the 
            servletContext object synchronized, that is, protected from other threads of Serv5 servlet and also from 
            threads of any other servlets and JSPs which could be acessing the same servletContext and creating any 
            inconsistency on the shared data structure values (if they, for istance, set the same attributes with other 
            values). Anyway, the thread shared structures cannot be perfectly protected in this case because
            the view is independent (differently from views created at the same servlet at which the locking had
            been done), and, after forwarding the thread flux to the view, there is no lock on the servletContext
            object anymore. Therefore, before data can be shown for the current user, other threads, servlets and JSPs could 
            alter the data, so that, when the actual user access it, its values could be wrong. For real thread safety,
            the view should be locked together with the code that generates it, or put in another structure or Scope that
            would not be shared by other threads or web components: servletContext() object is not this case. 
            The same is valid for session scope attributes. And, in this case, the HttpSession is synchronized to avoid
            different windows of a same browser client to possibly access the same client session attributes at one same time.
            After locking is liberated, no safety is guaranteed anymore, as with context attributes out of the locked algorithm segment.
            Only local variables (declared inside the service method, for example: request parameters) and request attributes
            are thread safe. So, if there is a real need for sharing data amongst different threads of one or more servlets,
            the proper scope and attribute should be chosen, and, if not the request scope, thread safety should be programatically
            assured the maximum as it can be. If request scope is the one, no thread issues with RequestDispatcher forward() should be
            of any concern. In JAVA Web Components it is one request per servlet thread (and vice-versa). So it is impossible
            for more than one thread of the same servlet or different servlets to have access to one same resquest attribute as it is
            with the other two more generic scopes, these of whose different servlet threads (different requests) CAN access the same 
            session or context scopes and attributes.
        </article>
        <p id="hidden" hidden><% out.print(getServletContext().getAttribute("fontColor")); %></p>
        <script>
            var date = document.getElementById("p2");
            date.onclick=getDate;
            var updateButton = document.getElementById("update");
            updateButton.onclick=getDate;
            function getDate(){
                var url = "serv5.do?colorSelect="+document.getElementById("hidden").innerHTML;
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
