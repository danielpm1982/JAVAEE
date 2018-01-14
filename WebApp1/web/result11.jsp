<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="MyTagLib" uri="MyTagLib"%>
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
            div.setDisplayBeanValues{
                text-align: left;
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                margin: auto;
                display: table;
                width: 65%;
                line-height: 1.5;
            }
            div.setDisplayBeanValues div.row{
                display: table-row;
            }
            div.setDisplayBeanValues div.row span{
                display: table-cell;
                border: 0.1em dashed chocolate;
                padding: 0.3em;
            }
            div.displayOtherThings{
                text-align: left;
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                margin: auto;
                margin-top: 1em;
                width: 63%;
                line-height: 1.5;
                padding: 0.3em;
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
            a#emailAddress{
                font-size: 1em;
            }
            a#emailAddress:link    {color:blanchedalmond; background-color:transparent; text-decoration:none}
            a#emailAddress:hover   {color:chartreuse; background-color:transparent; text-decoration:underline}
            img.header{
                width: 14em;
                height: 4em;
                margin: auto;
                display: block;
                margin-top: 1em;
                margin-bottom: 1em;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jspf" %>
        <div class="setDisplayBeanValues">
            <jsp:useBean id="webAddress" type="model.WebAddressBeanInterface" class="model.WebAddressBean" scope="page">
                <jsp:setProperty name="webAddress" property="webAddress" value="danielpm1982.com" />
                <jsp:setProperty name="webAddress" property="emailAddress" value="danielpm1982.com@domainsbyproxy.com" />
                <%--
                <jsp:setProperty name="webAddress" property="name" param="name" />
                <jsp:setProperty name="webAddress" property="address" />
                --%>
                <jsp:setProperty name="webAddress" property="*" />
            </jsp:useBean>
            <div class='row'>
                <span>WebAddress:</span><span><a id="webAddress" href="http://<jsp:getProperty name="webAddress" property="webAddress" />" title="Click to be redirected to the link"><jsp:getProperty name="webAddress" property="webAddress" /></a></span>
            </div>
            <div class='row'>
                <span>EmailAddress:</span><span><a id="emailAddress" href="mailTo:<jsp:getProperty name="webAddress" property="emailAddress" />" title="Click to send an email"><jsp:getProperty name="webAddress" property="emailAddress" /></a></span>
            </div>
            <div class='row'>
                <span>Name:</span><span><jsp:getProperty name="webAddress" property="name" /></span>
            </div>
            <div class='row'>
                <span>Address:</span><span><jsp:getProperty name="webAddress" property="address" /></span>
            </div>
        </div>
        <div class="displayOtherThings">
        <%--
            <a id="webAddress" href="http://${pageScope.webAddress.webAddress}" title="Click to be redirected to the link">${pageScope.webAddress.webAddress}</a>
            <br>
            <a id="emailAddress" href="mailTo:${pageScope.webAddress.emailAddress}" title="Click to send an email">${pageScope.webAddress.emailAddress}</a>
            <br>
            --%>
            <%--
            <a id="webAddress" href="http://${pageScope["webAddress"]["webAddress"]}" title="Click to be redirected to the link">${pageScope["webAddress"]["webAddress"]}</a>
            <br>
            <a id="emailAddress" href="mailTo:${pageScope["webAddress"]["emailAddress"]}" title="Click to send an email">${pageScope["webAddress"]["emailAddress"]}</a>
            <br>
            --%>
            
            <%--
            <br>
            <%= request.getParameter("name") %><br>
            ${pageContext.request.getParameter("name")}<br>
            ${param.address}<br>
            
            <%= request.getHeader("host") %><br>
            ${pageContext.request.getHeader("host")}<br>
            ${header.host}<br>
            
            <% pageContext.setAttribute("name", "Daniel"); %>
            ${pageScope.name}<br>
            ${name}<br>
            
            <% request.setAttribute("name", "Daniel"); %>
            ${requestScope.name}<br>
            
            <% session.setAttribute("name", "Daniel"); %>
            ${sessionScope.name}<br>
            
            <% application.setAttribute("foo.name", "Daniel"); %>
            ${applicationScope["foo.name"]}<br>
            
            <%= request.getMethod() %><br>
            ${pageContext.request.getMethod()}<br>
            ${pageContext.request.method}<br>
            
            <%
                String cookieValue="";
                String cookieNameToSearch = "JSESSIONID";
                Cookie[] cookies = request.getCookies();
                for(Cookie cookie:cookies){
                    if(cookie.getName().equals(cookieNameToSearch)){
                        cookieValue=cookie.getValue();
                    }
                }
                out.println(cookieValue);
            %><br>
            ${cookie.JSESSIONID.value}<br>
            
            <%= application.getInitParameter("zoneId1") %><br>
            ${pageContext.servletContext.getInitParameter("zoneId1")}<br>
            ${initParam.zoneId1}<br>
            
            ${pageContext.servletConfig.getInitParameter("webAddress")}<br>
            ${pageContext.servletConfig.getInitParameter("emailAddress")}<br>
            
            <%= session.getId() %><br>
            ${pageContext.session.id}<br>
        --%>
            
        <%--
            ${MyTagLib:getAge("Daniel",22,04,1982)}<br>
            ${MyTagLib:getAge("Juliana",24,02,1986)}<br>
            ${MyTagLib:getAge("Tina",16,10,1951)}<br>
            ${MyTagLib:getAge("Bosco",24,06,1947)}<br>
        --%>
        
        </div>
        <article>
            Java scripts are eliminated from this JSP page through the use of JSP actions and by putting the class code at a separate file-class, as a bean,
            (model.WebAddressBean), rather than inside JSP scriptlets. The useBean standard action tag is used to search for an attribute bean, at the specified
            scope, with the string name as defined in its id attribute, or, if the attribute does not exist, to instantiate one, using the full-named class 
            for both creating a variable and the object, and later, setting this object bean as an attribute at the specified scope, with the string name the
            same as the reference variable's, that is, the same as the id's name. Created and set as attribute at that scope, the bean can then be accessed for
            setting (if inside the body of the useBean tag in a conditionally not found way) or getting its properties using the other two bean standard actions
            tags: setProperty and getProperty... whose name attribute is the string name of the attribute bean set at the scope by the useBean (the same as 
            useBean id) and the property attribute is the set or getSomething at the bean class with these method names stripped from the set and get and the
            rest of the name put to lowerCase. The property names depend on the set and get methods at the bean class and have nothing to do with the id attribute
            of the useBean, which, as said, is used for the instance variable and for setting the attribute to the scope. And, at the setProperty tag, the
            attribute value is the argument passed to the parameters at the bean class set and get methods. EL expression is used to prove that the bean object
            is really set to the pageScope (the default one) by the useBean action tag, and later set or get by the other two bean action tags, or by an 
            EL expression, from the scope as an attribute previously created and set. JSP standard action tag useBean type attribute can be used to define
            the type of the reference at polymorphic declarations, so that the class attribute is always a concrete class to be instantiated and associated
            to the type, whether another class type, and interface or an abstract type class. At setProperty tags, the param attribute can be used to get
            the request param value automatically (or previously set and forwarded from a servlet) from the request scope and set it as the value for 
            that property at the bean. If the name of the request parameter is equal to the name of the property of the bean, and if no value is explicitly
            set, it's not necessary to put the param attribute at the setProperty tag, the request parameter value will be set automatically as the value for the
            corresponding bean property. If all the request parameters match the bean property names, not only you don't have to use value or param, but you can
            use a wildcard * at the property attribute, making the container iterate over all set properties and set those which match to the request parameter names,
            setting the corresponding request values. For String and primitives, the type conversions from String parameters to primitive bean property values, and
            from these to the view Strings, are automatically done. If scripting is used for setting the value attribute of the setProperty tag, though, the
            conversions won't work and an exception will be thrown. If EL expressions are used, the first element, on the left of the dot, is always an
            implicit EL object (different from JSP script implicit objects - except pageContext, that is an object reference) or an attribute of any of the 4 scopes.
            Either case, this left element will point to a Map or to a bean. If Map is the case, the element on the right of the dot will be a key, if a bean
            is the case, the thing on the right will be a property. Different from bean standard actions, not only direct property returns (String and primitives) 
            can be obtained with EL, but properties of properties, in case of the result of the first property is another bean, for instance. In the case of 
            EL "pageScope.webAddress.emailAddress", the pageScope is a implicit object that refers to a Map, and webAddress right on the right is the key of that 
            Map, which returns a bean set above by the useBean standard action on the page scope. That bean returned, the next emailAddress on its right is its 
            property, so that it returns the String expected from the bean get method. It could also be another bean, and another bean, etc... a chain of properties 
            of properties of properties, etc. Differently, if a bracket operator, instead of a dot operator, is used, there will be 4 possibilities for the 
            element on the left of the operator, that are: a Map, a bean, an array or a List, of any type. For the first two cases, if a string literal is used
            as argument to the bracket operator, the only possibilities are that it will be the key or the property, respectively. If it is not a string literal,
            if it's a name without quotes, for instance, it will be evaluated: it could be a implicit object or an attribute, otherwise returns null. There could
            also be a chain of various brackets operations, with each return being the argument for the next outer bracket operator, and so on. In the case that
            the left element is a List or an array, the argument inside the bracket should be a number, a string of a literal number convertible to a number, or,
            if a chain of operators is used, some sequence of operations that ultimately would lead to a number index for that List or array on the left. But
            for every single operation, the type of the left element and the element on the right is as above described, each operation on, from the left to
            the right (or from the inner to the outer bracket operation if the chain is inside any bracket). In the example 'pageScope["webAddress"]["webAddress"]',
            pageScope is an implicit object that refers to a Map whose first "webAddress", inside the bracket, is the key, returning a, attribute that refers to a 
            bean, from the page scope, whose "webAddress" on the bracket right next is the property. There could be brackets inside brackets and not only on the 
            side of others. Another difference is that with dot operation, the thing on the right of the dot must follow java naming rules, which is not the
            case with the bracket operator, whose argument may be any kind of word or number. But the quotes must be observed, as the absence of it as well, as
            needed. The main EL implicit objects are: pageScope, requestScope, sessionScope, applicationScope, param, paramValues, header, headerValues, cookie, 
            initParam and pageContext. Except for pageContext that is the only one common to JSP implicit objects, and is a bean Object, all others are implicit 
            objects that reference to Maps, with keys/values pairs. The examples of EL implicit objects show a comparison of the sintax when getting info
            through JSP script and from JSP EL expressions, including the parallel between using pageContext.theJavaObject and the EL implicit objects that can
            be accessed without pageContext, all of which as Maps and key/value pairs. It also emphasizes the of getting attributes from the 4 scopes using
            directly EL implicit objects as maps, with the attribute names as keys for getting the values. And, although only the attribute name could be
            used, inside the EL {}, and the first found attribute value would be returned, the scope implicit object is usefull in dealing with attributes names
            duplications at different scopes (specifying the exact scope to be searched) and also to dealing with attribute names that are not java legal names,
            and that only could be searched if inside quotes and brackets of the Map scope implicit object, not inside \${} alone. For EL functions, custom tagLibs
            can be used: a java class with a public static method, a TLD xml file, and, at the JSP, a directive of the taglib with the URI and prefix, and the
            call to the function, somewhere in the page, through prefix:nameOfTheFunction. The TLD ommits from the JSP the class name and the real function signature
            in the java class, and maps them to an URI with a custom function name to be called by the JSP. At the JSP, the directive maps a prefix to that URI (which is mapped
            to the TLD file at deploy time) and anywhere in the JSP you can call the function though EL by putting the prefix:nameOfTheFunction inside the \${}
            for printing the function return. Other than the bean standard actions above, there are others such as the jsp:include (different from the directive @include)
            and the jsp:param. The JSP include directive is a way of translating together the file to be added and the main jsp file to a single
            translated .java file and then compile this to a single .class file. The one and only servlet class (in bytecode) is then is loaded, the servlet instantiated, initialized 
            and one thread of it is created for that request, and the respective _jspService() method called. The whole inclusion is done at translation time.
            The standard action include, on the other hand, does not induce an inclusion at translation time. It rather translates and compiles only the main
            servlet class, with a method indicating the inclusion for later call, and, at the main servlet execution time, translates and compiles the jspf file and calls
            this main servlet method to include the jspf compiled .class result to the content of this main servlet, generating, then, the response static page to the user.
            In both cases, either with the directive or with the standard action, the inclusion is position specific. And, in the case of the include action, as the
            jspf file is translated and compiled only at a later stage, when the main servlet file is already running, it is posible to dinamically add a request
            parameter to the jspf file through the standard action jsp:param if put inside the jsp:include at the main servlet. The jspf segment can then use
            this customized param before being translated and compiled, and before it is included at the main servlet class file code. With the directive this would
            not make sense, 'cause all translation and compilation is done at the same time for the two files at once, and after that the jspf segment cannot be
            changed at the main servlet execution time. Moreover, when the directive is used (other than the standard action) it is not garanteed that the 
            container will notice any change at jspf files and update automatically the jsps where they're included, without restarting the server. With the directives
            all the translation and compilation is done only once, .class runs. With the standard action, differently, it is
            certain that, with each request, the jspf will be translated and compiled again, and will be updated when included at the main running servlet. But
            modern web component containers already detect any changes at the jspf segments and updates every inclusion even when directives are used. The overhead
            with directives is at the beginning, only once (or when the container detects jspf changes) while with standard actions the overhead is, fatally, at each request.
            Other standard actions are: jsp:expression, jsp:text, jsp:scriptlet and jsp:forward (this one must be put at the beginning of the page to not thow
            an exception and de facto redirect the page to another or to another resource). Other than standard actions and EL, there are custom actions or
            custom tags, which include java JSTL library and the programmer own libraries - as with EL functions, these custom tags all use taglibs and
            tld files to be mapped to the JSP page.
        </article>
        <jsp:include page="footer.jsp">
            <jsp:param name="webAddressJSPF" value="${webAddress.webAddress}"></jsp:param>
            <jsp:param name="emailAddressJSPF" value="${webAddress.emailAddress}"></jsp:param>
            <jsp:param name="nameJSPF" value="${webAddress.name}"></jsp:param>
            <jsp:param name="addressJSPF" value="${webAddress.address}"></jsp:param>
        </jsp:include>
        
        <%--
            <jsp:expression>(2+5-1)*12931999</jsp:expression><br>
            <jsp:text>(2+5-1)*12931999</jsp:text><br>
            <jsp:scriptlet>out.println("Hello disguised Script");</jsp:scriptlet>
            <jsp:forward page="index.html"></jsp:forward>
        --%>
    </body>
</html>
