<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="danielpm1982" uri="http://danielpm1982.com/myTagLib"%>
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
        <p class="p1">Custom Actions/Tags - Other Tags (Classic Tags):</p>
        
        <!--Examples of classic tags use:-->
        
        <!--Printing a big text body tag:-->
        <div>
            <p class="p4">
                <danielpm1982:getClassicalTagText>
                    "Legitimate defense
                    2263 The legitimate defense of persons and societies is not an exception to the prohibition against the murder of the innocent that constitutes intentional killing. "The act of self-defense can have a double effect: the preservation of one's own life; and the killing of the aggressor. . . . The one is intended, the other is not."65
                    2264 Love toward oneself remains a fundamental principle of morality. Therefore it is legitimate to insist on respect for one's own right to life. Someone who defends his life is not guilty of murder even if he is forced to deal his aggressor a lethal blow:
                    If a man in self-defense uses more than necessary violence, it will be unlawful: whereas if he repels force with moderation, his defense will be lawful. . . . Nor is it necessary for salvation that a man omit the act of moderate self-defense to avoid killing the other man, since one is bound to take more care of one's own life than of another's.66 
                    2265 Legitimate defense can be not only a right but a grave duty for one who is responsible for the lives of others. The defense of the common good requires that an unjust aggressor be rendered unable to cause harm. For this reason, those who legitimately hold authority also have the right to use arms to repel aggressors against the civil community entrusted to their responsibility.
                    2266 The efforts of the state to curb the spread of behavior harmful to people's rights and to the basic rules of civil society correspond to the requirement of safeguarding the common good. Legitimate public authority has the right and duty to inflict punishment proportionate to the gravity of the offense. Punishment has the primary aim of redressing the disorder introduced by the offense. When it is willingly accepted by the guilty party, it assumes the value of expiation. Punishment then, in addition to defending public order and protecting people's safety, has a medicinal purpose: as far as possible, it must contribute to the correction of the guilty party.67
                    2267 Assuming that the guilty party's identity and responsibility have been fully determined, the traditional teaching of the Church does not exclude recourse to the death penalty, if this is the only possible way of effectively defending human lives against the unjust aggressor. "
                </danielpm1982:getClassicalTagText>
            </p>
        </div>
        
        <!--Iterating and printing a body content n (attribute-set) times:-->
        <div>
            <p class="p4">
                <danielpm1982:getClassicalIteration timesToIterate="5">
                    Iteration ${iterationTime}: This is a classical tag iteration example.<br>
                </danielpm1982:getClassicalIteration>
            </p>
        </div>
        
        <!--Iterating and printing a Collection content:-->
        <div>
            <% List list = new ArrayList(Arrays.asList("Daniel", "Juliana", "Tina", "Bosco")); pageContext.setAttribute("list",list);%>
            <p class="p4">
                <danielpm1982:getClassicalCollectionIteration objectToIterate="${list}">
                    ListItem: ${listItem}<br>
                </danielpm1982:getClassicalCollectionIteration>
            </p>
        </div>
        
        <!--Manipulating and printing body tag text with future defined attributes:-->
        <div>
            <p class="p4">
                <danielpm1982:getClassicalTagBodyManipulated name="Daniel">
                    ${name}: Jesus said:
                    " I am the way and the truth and the life. No one comes to the Father except through me. "
                </danielpm1982:getClassicalTagBodyManipulated>
            </p>
        </div>
        
        <!--Multi-level tags:-->
        <div>
            <p class="p4">
                <danielpm1982:getClassicalLevel0TagText level0Attribute="level0AttributeValue">
                    <danielpm1982:getClassicalLevel1TagText level1Attribute="level1AttributeValue">
                        <danielpm1982:getClassicalLevel2TagText level2Attribute="level2AttributeValue">
                             Jesus answered: "I am the way and the truth and the life. No one comes to the Father except through me."
                        </danielpm1982:getClassicalLevel2TagText>
                    </danielpm1982:getClassicalLevel1TagText>
                </danielpm1982:getClassicalLevel0TagText>
            </p>
        </div>
        
        <div>
            <p class="p4">
                <jsp:scriptlet>
                    if(request.getRemoteUser()!=null){
                        out.println("Login SUCCESSFULLY !!");
                    }
                    if(request.isUserInRole("Daniel3")){
                        out.println("Your role is: "+request.getUserPrincipal()+" !!");
                    } else if(request.isUserInRole("Daniel2")){
                        out.println("Your role is: 'Daniel2' !!");
                    } else{
                        out.println("You have no role in here !!");
                    }
                </jsp:scriptlet>
            </p>
        </div>
        
        <article>
            Classic custom tags creation are basically the same as simpleTag creation except that instead of extending SimpleTagSupport at the handler class
            you must extend TagSupport or BodyTagSupport concrete classes (or implement the original interfaces), overriding the methods doStartTag(),
            doEndTag(), and, if necessary, doAfterBody(), and returning, at each method, the right constant for controlling the lifecycle of the algorithm: 
            EVAL_BODY_INCLUDE, EVAL_BODY_AGAIN, EVAL_BODY_BUFFERED, SKIP_BODY, EVAL_PAGE or SKIP_PAGE. If the BodyTagSupport is the class to be extended, and
            if the doStartTag returns EVAL_BODY_BUFFERED, and if the body-content of the tag at the .tld is not empty, and if the tag body at the JSP is not
            empty, two other lifecycle methods are added, and the object bodyContent (a Writer object) is added to the handler class to make it possible a direct access of the body
            content of the tag, other than just the control of its automatic output, without any manipulation of the content itself (as when EVAL_BODY_INCLUDE is returned 
            at doStartTag()). Either way, iteration is done with field (class) counting variables and by returning EVAL_BODY_AGAIN at doAfterBody() method,
            setting different attributes values at pageContext as needed at each iteration. For multi-level tags, the API provides getParent() method which
            can be called at classic (or simple) tag handlers to get the Tag object of all existent superior level tags on top of that most inner tag. Casting must be done to
            the class of the specific handler, each time getParent() is called, because it returns always a general Tag object. After casting the object tag to 
            the right handler class, and if this class has getAttributes methods, the attributes values of this class can be gotten by the other classes 
            objects, as above. Outer tags body-content must not be of empty type, and the handler method doStartTag() must not return SKIP_BODY, so that the inner tags are evaluated as part of the outer tag's bodies. If
            the parents should have any information of their children, and as there is no getChild() method, it could be designed a way that the outer classes had a
            collection attribute for storing information set by inner classes themselves. For instance, a top class could declare and initialize a Collection type
            List at its doStartTag() method, then, at its body evaluation, the inner classes handlers would run and set new items on that collection, and then, back
            to the top execution, at its doEndTag() method, that collection data could be read and used. Other than getParent(), there's also the method 
            findAncestorWithClass(starting tag,target tag class), which finds the first Tag object for that searched class type and returns it to the inner tag handler class
            that is looking for it. Classic tags can have (without complex adapter classes) only parent 
            classic tags around it, while simple tags can have both simple and classic tags. The classic tag pageContext object is a PageContext, while the getJspContext() 
            method of simple Tags returns a JspContext (a father class for the last one, but that is always, also a PageContext instance), so, for simple tags, if 
            PageContext specific methods are necessary, a downcast from JspContext to PageContext must be done. While simple tags throw a SkipPageException,
            classic tags just return SKIP_PAGE at doEndTag() method for not showing the rest of the page.
            Security and Filter/Wrapper layers were latter added to this JSP.
        </article>
    </body>
</html>
