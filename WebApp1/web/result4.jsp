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
                font-size: 1.1em;
            }
            p.p2{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.5em;
                width: 90%;
                margin: auto;
            }
            div#table{
                display: table;
                width: 23em;
                margin: auto;
                border-collapse: separate;
                border-spacing: 0.3em;
            }
            div.tableRow{
                display: table-row;
            }
            div.zoneId{
                display: table-cell;
                border: 0.1em solid blanchedalmond;
                padding: 0.3em 0.3em 0.3em 0.3em;
            }
            article{
                font-size: 0.45em;
                width: 80%;
                margin: auto;
                margin-top: 2em;
                margin-bottom: 2em;
                border: solid 0.1em blanchedalmond;
                padding: 0.5em 0.5em 0.5em 0.5em;
                text-align: justify;
                line-height: 1.5em;
            }
        </style>
    </head>
    <body>
        <p class="p1">(Deploying) Time at defined web.xml TimeZones:</p>
        <div id="table">
            <div class="tableRow">
                <div class="zoneId">
                    <p class="p2" title="click to update!">
                        <% out.print(getServletContext().getAttribute("zonedTime1")); %>
                    </p>
                </div>
                <div class="zoneId">
                    <p class="p2" title="click to update!">
                        <% out.print(getServletContext().getAttribute("zonedTime2")); %>
                    </p>
                </div>
                <div class="zoneId">
                    <p class="p2" title="click to update!">
                        <% out.print(getServletContext().getAttribute("zonedTime3")); %>
                    </p>
                </div>
            </div>
            <div class="tableRow">
                <div class="zoneId">
                    <p class="p2" title="click to update!">
                        <% out.print(getServletContext().getAttribute("zonedTime4")); %>
                    </p>
                </div>
                <div class="zoneId">
                    <p class="p2" title="click to update!">
                        <% out.print(getServletContext().getAttribute("zonedTime5")); %>
                    </p>
                </div>
            </div>
        </div>
        <article>
            Different timeZone Strings have been set as context init parameters at the web.xml file. By means 
            of a ServletContextListener, also registered through the web.xml file, and before 
            init(ServletConfig) or service() methods are called, the web component container of the J2EE server
            executes the listener class, which reads the context init context parameters, calls the model class with them,
            which returns the time at each time zone as an Object String (could be any other Object). These 
            String objects are then saved as attributes at the servletContext (application, and not request, scope!) so that all 
            servlets and JSPs, when initialized and called (when service() is called), can just get the time for each zone through 
            servletContext (application) attributes, with data already processed by the listener class, and not have to take them 
            as context parameters, limited to String format. Any Object could be put ready for use by servlets and JSP pages this way, 
            like a ZonedTimeDate itself, or DB connection objects, etc. The listener class is processed only once, at deploying time, after
            the container reads the web.xml, and before init() and service() methods are called. So, for updating time values,
            a redeploy is necessary.
        </article>
        <script>
            var body = document.getElementsByTagName("body")[0];
            body.setAttribute("title","Click to update!");        
            body.ondblclick=getTime;
            function getTime(){
                alert("A redeploy is necessary for data update and\nfor the servletContextListener to execute again!");        
                var url = "serv4.do";
                location.assign(url);
            }
            var zoneIds = document.getElementsByClassName("zoneId");
            for(var i=0;i<zoneIds.length;i++){
                zoneIds[i].onclick=function(){
                    if(!this.style.backgroundColor){
                        this.style.backgroundColor="blue";
                    }
                    else {
                        this.style.backgroundColor="";
                    }
                };
            }
        </script>
    </body>
</html>
