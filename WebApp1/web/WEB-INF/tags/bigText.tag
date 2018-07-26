<%@attribute name="fontColor" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@tag body-content="tagdependent" %>


<p class="p3" style="color: ${fontColor}"><jsp:doBody /></p>
