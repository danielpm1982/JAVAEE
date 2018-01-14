<%@page import="java.time.ZoneId"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="danielpm1982" uri="http://danielpm1982.com/myTagLib"%>
<%--<%@taglib prefix="danielpm1982" uri="/WEB-INF/tlds/MyTagLib.tld"%>--%>
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
                font-size: 0.6em;
                width: 55%;
                margin: auto;
                margin-top: 3em;
                padding: 1em;
                padding-bottom: 0em;
                background-color: darkslateblue;
            }
            p.p4{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                width: 90%;
                margin: auto;
                margin-top: 1em;
            }
            a:link{
                color: blanchedalmond;
            }
            a:hover{
                color: darkgoldenrod;
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
            table{
                font-size: 0.5em;
                color: black;
                margin: auto;
                margin-top: 0.5em;
                margin-bottom: 0.5em;
            }
            tr:nth-child(2n){
                background-color: blanchedalmond;
            }
            tr:nth-child(2n+1){
                background-color: burlywood;
            }
            td{
                padding: 0.5em;
                padding-top: 0.2em;
                padding-bottom: 0.2em;
            }
            input[type="text"]{
                font-size: 0.8em;
                font-weight: 800;
                width: 14em;
                height: 2em;
                text-align: center;
                background-color: black;
                color: blanchedalmond;
                margin-left: 1em;
                border: solid red 5px;
            }
            input[type="submit"]{
                font-size: 0.7em;
                font-weight: 800;
                width: 5em;
                height: 1.9em;
                text-align: center;
                background-color: blanchedalmond;
            }
            select{
                font-size: 0.8em;
                font-weight: 800;
                width: 10em;
                height: 1.5em;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div>
            <p class="p1">Custom Actions/Tags - Other Tags (not JSTL):</p>
            <c:if test="${param.userName != null and not empty param.userName}">
                <p class="p4">
                    <danielpm1982:helloUser>
                        <jsp:attribute name="userName">${param.userName}</jsp:attribute>
                    </danielpm1982:helloUser>
                    <%-- or: --%>
                    <danielpm1982:helloUser userName="${param.userName}" />
                    <%-- or: --%>
                    <danielpm1982:helloUser userName="${param.userName}"></danielpm1982:helloUser>
                </p>
            </c:if>
            <c:if test="${param.userName == null or empty param.userName}">
                <p class="p4">You did not mention your name yet!</p>
                <form method="GET" action="result14.jsp">
                    <p class="p4">
                        <label for="userName">Your Name:</label>
                        <input type="text" name="userName" id="userName" required placeholder="type your name" title="type your name">
                    </p>
                </form>
            </c:if>
            <p class="p3">
                <jsp:scriptlet>pageContext.setAttribute("date1", ZonedDateTime.now(ZoneId.of("America/Fortaleza")));</jsp:scriptlet>
                <jsp:scriptlet>pageContext.setAttribute("date2", ZonedDateTime.now(ZoneId.of("America/New_York")));</jsp:scriptlet>
                <jsp:scriptlet>pageContext.setAttribute("date3", ZonedDateTime.now(ZoneId.of("Japan")));</jsp:scriptlet>
                <danielpm1982:getFormattedDate date="${pageScope.date1}" />
                <danielpm1982:getFormattedDate date="${pageScope.date2}" />
                <danielpm1982:getFormattedDate date="${pageScope.date3}" />
            </p>
        </div>
        <article>
            The basics for custom taglibs creation, is to define a tag java class handler that extends SimpleTagSupport class and overrides doTag() method
            with the algorithm to be executed when that tag is used at the JSP. This tag handler class also defines the setAttributes
            methods for setting the properties of the beans implicitly used when defining the attributes values of the tags at the JSP. 
            Create also the .tld file (inside WEB-INF or inside a META-INF inside a .jar lib file inside lib of WEB-INF) for mapping 
            the uri used with the prefix at the taglib directive at the JSP to the actual tld file and for setting the tag and its attributes
            properties. Tag elements to be set: description, name, tag-class and body-content. Attributes elements to be set: name, type, required 
            and rtexprvalue. After creating the tag handler java class and the .tld xml file, just import the custom tag lib (with one or more tags defined at the .tld)
            to the JSP using the directive taglib, with a prefix and the uri to the lib of the tag you want to use. Then, at the body of the JSP, just
            call the prefix:tagName to map to and execute the doTag() method at the tag handler class through .tld mediation, also setting the values
            of all required attributes of the used tag. If the tag body must be empty, it can be called with a slash at the final of the first <> of the tag, or
            use the two <> of the tag but with empty inner body content, or use the standard tag jsp:attribute inside the tag body to set its attributes.
            Before JSP 2.0, the taglib had to have its location manually defined at the jsp-config tag of web.xml, but it's not needed anymore. When the container
            sees there's no manual mapping for the taglib inside the web.xml jsp-config tag, it automatically searches for the .tld file inside WEB-INF and META-INF of lib files
            so that the uri defined at the eventually found .tld file matches the uri defined at the JSP taglib directive. The uri must be unique. When the
            matched uri and .tld file are found, then the container can find the tag and its attributes configurations in order to execute each JSP tag, through
            the tag handler java class defined at the .tld mapped by the uri at the JSP taglib directive. At the JSP taglib directive's uri, instead of a string name just
            to match the uri of the searched .tdl file, it could be used the actual .tld file name, with its real path, but it's not a best practice, because of 
            code reusability and change management reasons.
        </article>
        <script>
            window.onload = function(){
                document.getElementsByTagName("form")[0].reset();
            };
        </script>
    </body>
</html>
