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
                width: 60%;
                margin: auto;
                margin-top: 1em;
            }
            p.p4{
                font-family: monospace;
                font-weight: 800;
                font-size: 0.8em;
                width: 90%;
                margin: auto;
                margin-top: 2em;
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
            input[type="number"]{
                font-size: 0.8em;
                font-weight: 800;
                width: 4em;
                height: 1.5em;
                text-align: center;
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
            <p class="p1">Custom Actions/Tags - JSTL Test:</p>
            
            <table>
            <%
                List<String> list = new ArrayList<String>();
                list.add("Daniel"); list.add("Juliana"); list.add("Tina"); list.add("Bosco");
                pageContext.setAttribute("list", list);
                for(String x:list){
            %>
            <!--<tr><td><%= x %></td></tr>-->
            <% 
                }
            %>
            </table>
            
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <table>
                <c:forEach var="listItem" items="${pageScope.list}">
                    <tr>
                        <td><p class="p2">${pageScope.listItem}</p></td>
                    </tr>
                </c:forEach>
            </table>
            
            <%  
                String[] array1 = {"Juliana","Filipe","Arthur","Luke"};
                String[] array2 = {"Bosco","Tina","Daniel"};
                List<String[]> listOfArrays = new ArrayList<String[]>();
                listOfArrays.add(null);
                listOfArrays.add(array1);
                listOfArrays.add(null);
                listOfArrays.add(array2);
                listOfArrays.add(null);
                listOfArrays.add(null);
                listOfArrays.add(new String[]{"bla","bla","bla"});
                pageContext.setAttribute("listOfArrays", listOfArrays);
            %>
            <table>
                <c:forEach var="array" items="${listOfArrays}" varStatus="varStatus" begin="1" end="3" step="2">
                    <tr>
                        <td><p class="p2">Line 0${varStatus.count}:</p></td>
                        <c:forEach var="arrayItem" items="${array}">
                            <td><p class="p2">${arrayItem}</p></td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
            
            <table>
                <% pageContext.setAttribute("listOfArrays", null); %>
                <c:if test="${listOfArrays != null}">
                    <c:forEach var="array" items="${listOfArrays}" varStatus="varStatus" begin="1" end="3" step="2">
                        <tr>
                            <td><p class="p2">Line 0${varStatus.count}:</p></td>
                            <c:forEach var="arrayItem" items="${array}">
                                <td><p class="p2">${arrayItem}</p></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${listOfArrays == null}">
                    <tr><td><p class="p2">List of Arrays is null!</p></td></tr>
                </c:if>
            </table>
                
            <table>
                <% pageContext.setAttribute("list", null); %>
                <c:choose>
                    <c:when test="${pageScope.list != null}">
                        <c:forEach var="listItem" items="${pageScope.list}">
                            <tr>
                                <td><p class="p2">${pageScope.listItem}</p></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td><p class="p2">List is null!</p></td></tr>
                    </c:otherwise>
                </c:choose>
            </table>
            
            <c:set var="zonedTime1" value="${applicationScope.zonedTime1}" scope="page" />
            <h6>${pageScope.zonedTime1}</h6>
            <c:set var="textBible" scope="page">
                18 And I tell you that you are Peter,[a] and on this rock I will build my church, and the gates of Hades[b] will not overcome it. 19 I will give you the keys of the kingdom of heaven; whatever you bind on earth will be[c] bound in heaven, and whatever you loose on earth will be[d] loosed in heaven.”
            </c:set>
            <p class="p2">${pageScope.textBible}</p>

            <br>
            <jsp:useBean id="myWebAddressBean" type="model.WebAddressBeanInterface" class="model.WebAddressBean" scope="page" />
            <c:set target="${pageScope.myWebAddressBean}" property="name" value="Daniel" />
            <c:set target="${pageScope.myWebAddressBean}" property="webAddress" value="danielpm1982.com" />
            <c:set target="${pageScope.myWebAddressBean}" property="emailAddress" value="danielpm1982.com@domainsbyproxy.com" />
            <c:set target="${pageScope.myWebAddressBean}" property="address" value="Dom Manuel de Medeiros, Fort, CE" />
            <p class="p2">${myWebAddressBean}</p>

            <% 
                Map<String, String> myMap = new TreeMap<String, String>();
                pageContext.setAttribute("myMap", myMap);
            %>
            <c:set target="${pageScope.myMap}" property="key1" value="key1Value"/>
            <c:set target="${pageScope.myMap}" property="key2" value="key2Value" />
            <c:set target="${pageScope.myMap}" property="key3">
                Jesus answered, "I am the way and the truth and the life. <br>No one comes to the Father except through me"
            </c:set>
            <h6>${myMap.key1} ; ${myMap.key2} ;<br>${myMap.key3}.</h6>
            
            <c:remove var="myWebAddressBean" scope="page" />
            <c:remove var="myMap" scope="page" />
            <c:if test="${pageScope.myWebAddressBean == null}"><p class="p2">myWebAddress is null: never existed or has been REMOVED successfully!</p></c:if>
            <c:if test="${pageScope.myMap == null}"><p class="p2">myMap is null: never existed or has been REMOVED successfully!</p></c:if>
            
            <c:import url="footer3.jsp" />
            <c:import url="footer2.jsp">
                <c:param name="nameJSPF" value="Daniel" />
                <c:param name="emailAddressJSPF" value="danielpm1982.com@domainsbyproxy.com" />
                <c:param name="addressJSPF" value="Dom Manuel de Medeiros, Fort, CE" />
                <c:param name="webAddressJSPF" value="danielpm1982.com" />
            </c:import>
            
            <%-- request.getSession is done by default at servlets from JSPs. In this page case, if cookies are enabled, the sessionId will be persisted, and 
            the session will most of the times be not new. And there won't be any url rewritings. If cookies are otherwise disabled, and as there is no 
            JSESSIONID encoded to this actual page link at any requests, the session will always be new for this page (new JSESSIONID will be generated and shown). 
            And this new sessionId will be encoded to the links that use the c:url for encoding it to the requests from here, persisting this session at the 
            destiny pages, as expected. If cookies are disabled and if no url rewriting is done with the JSESSIONID, the links will redirect to JSPs that, also,
            will generate new sessionIds at every request, with sessions always displaying as new ones.--%>
            <% 
                if(session.isNew()){
                    session.setAttribute("sessionIsNew", true);
                } else if(!session.isNew()){
                    session.setAttribute("sessionIsNew", false);
                }
            %>
            <c:set var="myName" value="Daniel" scope="session" />
            <c:set var="myAddress" value="Dom Manuel de Medeiros, Fort-CE" scope="session" />
            <%-- With c:url for url rewriting (encoding JSESSIONID) and c:param to encode request params safely - eliminating spaces, for example.
            If cookies are enabled, though, the url rewriting won't be done. Only the encoding of the request parameters.--%>
            <c:url value="/result13.jsp" var="link13" scope="page">
                <c:param name="myName" value="${sessionScope.myName}" />
                <c:param name="myAddress" value="${sessionScope.myAddress}" />
            </c:url>
            <p class="p2">SessionIsNew ? ${sessionScope.sessionIsNew}</p>
            <p class="p2">SessionId: <%= session.getId() %></p>
            <p class="p3"><a href="${pageScope.link13}" title="click here">${pageScope.link13}</a></p>
            <%-- Without c:url, so that JESSIONID won't be encoded in the link, and if the cookies are disabled, the destination page won't know 
            about the session existence, and will always create new session Ids (new sessions), not the actual one. Compare the Ids at this page
            (actual session Id) with the Id in the destiny page for checking if they match, that is, if session is maintained correctly. The request
            params also were not defined at the link and will display empty (or null if using script).--%>
            <p class="p3"><a href="result13.jsp" title="click here">result13.jsp</a></p>
            
            <form method="get" action="mathResult.jsp">
                <p class="p4"><input type="number" name="number1" required> divided by <input type="number" name="number2" required> = 
                    <input type="submit" value="Divide!" title="Process operation at server side" onmouseup="this.blur()"></p>
            </form>
            
            <c:if test="${param.selectRedirect==true}">
                <c:redirect url="http://www.danielpm1982.com">
                    <c:param name="name" value="Daniel" />
                </c:redirect>
            </c:if>
            <c:if test="${param.selectRedirect==false || param.selectRedirect==null}">
                <form method="get" action="result12.jsp">
                    <p class="p4">
                        <c:out escapeXml="true" value='"<Hello, & World>!"' />
                        <select name="selectRedirect">
                            <option value="false">Do Not Redirect!</option>
                            <option value="true">Do Redirect!</option>
                        </select>
                        <input type="submit" value="Submit" onmouseup="this.blur()">
                    </p>
                </form>
            </c:if>
            
        </div>
        <article>
            Just some code with custom actions/tags usage, especifically core JSTL tags: c:forEach, c:if, c:choose, c:when, c:otherwise, c:set (with var or target), 
            c:remove, c:import, c:param (inside c:import body), c:url, c:param (inside c:url body), c:catch, c:redirect, c:param (inside c:redirect body), 
            c:out.
        </article>
    </body>
</html>
