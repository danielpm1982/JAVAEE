<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.time.ZonedDateTime,java.time.ZoneId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="danielpm1982" uri="http://danielpm1982.com/myTagLib"%>
<%--<%@taglib prefix="danielpm1982" uri="/WEB-INF/tlds/MyTagLib.tld"%>--%>
<%--<%@taglib prefix="danielpm1982TagFiles" tagdir="/WEB-INF/tags"%>--%>
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
                margin-bottom: 1em;
            }
            p.p3{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.5em;
                width: 40%;
                margin: auto;
                margin-top: 2em;
                margin-bottom: 1em;
                font-style: italic;
                text-align: justify;
            }
            p.p4{
                font-family: monospace;
                font-weight: 400;
                font-size: 0.4em;
                width: 70%;
                margin: auto;
                margin-top: 2em;
                margin-bottom: 1em;
                font-style: italic;
                text-align: justify;
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
            img.footer{
                width: 30%;
            }
        </style>
    </head>
    <body>
        <p class="p1">Custom Actions/Tags - Other Tags (Tag Files and Simple Tags):</p>
        
        <!--Examples of tag files use (independently configured or through .tld configuration):-->
        <div>
            <jsp:scriptlet>pageContext.setAttribute("dateFooter", ZonedDateTime.now(ZoneId.of("America/Fortaleza")));</jsp:scriptlet>
            <%--<danielpm1982TagFiles:textDateFooterImage text="Hello World !!" date="${pageScope.dateFooter}" />--%>
            <danielpm1982:textDateFooterImage text="Hello World !!" date="${pageScope.dateFooter}" />
<!--            <danielpm1982TagFiles:bigText fontColor="lightgrey">
                "A tag file is a text file that contains JSP elements implementing the functionality of a custom action. You must use a .tag filename extension to identify this type of file to the web container. All JSP elements that you can use in a JSP file can also be used in a tag file, with exception to the page directive (a tag file is not a page). There are also a few JSP directives that are only allowed in a tag file, as you will see shortly. Apart from that, creating a tag file is no different than creating a JSP page. Once created and installed, a tag file is used the same as the custom actions implemented in Java that you've seen in previous chapters."
            </danielpm1982TagFiles:bigText>-->
            <danielpm1982:bigText fontColor="lightgrey">
                "A tag file is a text file that contains JSP elements implementing the functionality of a custom action. You must use a .tag filename extension to identify this type of file to the web container. All JSP elements that you can use in a JSP file can also be used in a tag file, with exception to the page directive (a tag file is not a page). There are also a few JSP directives that are only allowed in a tag file, as you will see shortly. Apart from that, creating a tag file is no different than creating a JSP page. Once created and installed, a tag file is used the same as the custom actions implemented in Java that you've seen in previous chapters."
            </danielpm1982:bigText>
        </div>
        <br>
        
        <!--Examples of using simple tags inside (together with) tag files:-->
        <div>    
            <danielpm1982:getAge name="Daniel" year="1982" month="4" day="22"></danielpm1982:getAge>
            <danielpm1982:getAge name="Juliana" year="1986" month="2" day="24"></danielpm1982:getAge>
            <danielpm1982:getAge name="Tina" year="1951" month="10" day="16"></danielpm1982:getAge>
            <danielpm1982:getAge name="Bosco" year="1947" month="6" day="24"></danielpm1982:getAge>
            <br>
            
            <danielpm1982:getText text="Hello World!">
                "I. The life of man - to know and love God
                <br>
                1 God, infinitely perfect and blessed in himself, in a plan of sheer goodness freely created man to make him share in his own blessed life. For this reason, at every time and in every place, God draws close to man. He calls man to seek him, to know him, to love him with all his strength. He calls together all men, scattered and divided by sin, into the unity of his family, the Church. To accomplish this, when the fullness of time had come, God sent his Son as Redeemer and Saviour. In his Son and through him, he invites men to become, in the Holy Spirit, his adopted children and thus heirs of his blessed life.
                <br>
                2 So that this call should resound throughout the world, Christ sent forth the apostles he had chosen, commissioning them to proclaim the gospel: "Go therefore and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, teaching them to observe all that I have commanded you; and lo, I am with you always, to the close of the age."4 Strengthened by this mission, the apostles "went forth and preached everywhere, while the Lord worked with them and confirmed the message by the signs that attended it."5
                <br>
                3 Those who with God's help have welcomed Christ's call and freely responded to it are urged on by love of Christ to proclaim the Good News everywhere in the world. This treasure, received from the apostles, has been faithfully guarded by their successors. All Christ's faithful are called to hand it on from generation to generation, by professing the faith, by living it in fraternal sharing, and by celebrating it in liturgy and prayer.6"
            </danielpm1982:getText>
        </div>
        <br>
        
        <!--Example of using simple tags for iteration of attributes passed to the handler by the tag and use of future attributes at the body tag for 
        showing each iteration result when JspBody is invoked at the handler. Also an example of getting attributes from pageContext from JspFragment object.
        And tests throwing skipPageException at the handler:-->
        <div>
            <jsp:scriptlet>List list = new ArrayList(); list.add("Daniel"); list.add("Juliana"); list.add("Tina"); list.add("Bosco"); pageContext.setAttribute("listToIterate", list);</jsp:scriptlet>
            <p class="p2">Iteration of the list ${listToIterate}:<br></p>
            <danielpm1982:getIteration objectToIterate="${listToIterate}">
                <p class="p2">-> ${listPieceToShow}<br></p>
            </danielpm1982:getIteration>
            <p class="p4">${allAttributesNames}<br></p>
        </div>
        
        
        <article>
            Instead of classic non JSTL custom tags creation, it's useful to use the new JSP 2.0 tag files, so that the JSP developer (maybe not a java 
            programmer) doesn't have to deal with .tld or java tag handlers at all. The person to create and use a tag file only has to create a tag, that is, 
            a jspf (with @attribute directives) that he will name with a tag extension, put it at WEB-INF/tags directory, and, at the JSP, import it as a taglib, 
            setting tagdir attribute value rather than the uri's value. There won't be any .tld file or tag handler file, there won't be any uri, and the
            tag, at the JSP side, will be able to be called by the prefix:tagFileName without the .tag extension. The container will look at the tagdir directory
            for a tag that matches the name of the tag used at the JSP and make the mapping automatically. Differently from jsp:include or c:import, data can
            be passed to the tag file through attributes and not through parameters, which makes more sense. At the tag file itself, objects can be imported
            through @tag directive in order to process and deal with complex attributes passed from the JSPs that might use that tag file. Regarding the scope
            of the attributes, and also differently from jsp:include or c:import jsp:param, the information is only available to the tag itself, a tag scope,
            and not to the rest of the application where that request might eventually reach (as with jsp:param use). Other than using attributes, it can
            be used the body content of the tag at the JSP as data for the tag file custom tag. For it to be possible, at the tag file use the jsp:doBody... and,
            if you want to specify the body content type (as in .tld), use the directive @tag and its attribute body-content, also at the tag file. Then, at the
            JSP just use the tag file as usual but with something compatible to the type defined as its body. This content will be transferred to the place of
            the tag file where jsp:doBody was placed. Differently from classical custom tags, there can't be script (type:jsp) at a body content of a tag file 
            at the JSP when it is called (only at the tag file itself), and only scriptless (default), empty or tagdependent are acceptable. Similar to classical 
            custom tags, tag files can be placed inside WEB-INF/tags or inside META-INF/tags inside a jar inside WEB-INF/lib, or any subdirectory of these. 
            But if it is inside a .jar there must be a .tld file to map it to the app (tag-file, name and path tags at the xml). Other than the path, the other
            attributes can be declared at the @attribute directive at the tag file directly, and if the tag file is not in a .jar no .tld is needed for the
            container to find it, which, together with the fact that there are no java class tag handlers, simplifies for page developers who do not know java or xml.
            If the tag file is defined at web.xml, and for the uri and prefix of that taglib at the JSP, then its tag is accessed through the same library as
            the classical custom tags defined at that same .tld. Or by the other prefix that was associated to a tagdir. Interchangeably. Or with both prefixes
            simultaneously (either one or another at each tag call).
            For tag creation, other than the classical tag creation process, there are the tag files (mentioned above) and also simple tags, these with a java tag handler that
            extends SimpleTagSupport, which can be used together with tag files and JSTL tags as needed. With simple tags, the tag handler java class extends
            SimpleTagSupport and has, therefore, a defined lifecycle: class load, instantiation, set of JspContext with setJspContext(JspContext), setParent(JspTag)
            if inside another tag, automatic call of setAttributes, set of JspBody with setJspBody(JspFragment) if the tag has a not empty body, and call to
            the doTag() method that is always overriden by the tag creator at the handler class. The access to the JspContext is essencial for setting new inexistant
            tag scope attributes at runtime, at the handler class, inside the doTag() method. After setting these attributes, they can be used at the invoking
            of the JspBody of the tag, inclusive iteratively, as long as they're used at the JSP side inside the tag body with EL, for instance. These attributes
            used with EL inside the tag body do not exist until the tag handler uses the JspContext, inside the doTag() method, to create and define them, possibly
            with the iteration values of tag attributes collections that are passed to handler class variables at the setAttributes lifecylcle time, as in the above example.
            Also an example of getting the JspFragment of the tag by calling getJspBody() method at the handler and getting attributes from pageContext from 
            this JspFragment by calling its getJspContext() method and showing at the view through invokation of JspFragment object. The Jsp attributes can be gotten at the handler 
            class and passed to any other object with these attributes on it. Although invoking JspFragment will show at the JSP only the fragment and attributes
            used at that fragment of the JSP, the other attributes values can be set to another display attribute for showing at the same or other
            JSP page with EL as usual. The objective of the JspFragment is to send the fragment of the body tag to the handler (for it to set future attributes
            and showing at invocation) but also for sending to the handling class the whole page context with all attributes of every scope, if they're needed.
            Inside the doTag() method, it could be thrown a JspException as SkipPageException() programatically (if a value of any parameter or attribute
            was missing, for example), and the JSP page would be generated only until the point the exception was thrown, instead of a more general exception that
            would not show any page at all, only the error page. If the SkipPageException was thrown by a tag handler of the tag of some included page, only the
            rest of that included page will be discarded. The rest of the original outer page will be shown until the end (if no error in this outer page occurs).
            The simple tag handler instance is always destroyed and is never reused after each doTag() method ends. So it will never have old values set at it.
            For every tag invokation, a new instance of the handler will be created and destroyed as soon as it ends executing the doTag() method.
        </article>
    </body>
</html>
