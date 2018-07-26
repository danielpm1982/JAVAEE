<%@attribute name="name" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@attribute name="year" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@attribute name="month" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@attribute name="day" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@tag body-content="empty" %>
<%@taglib prefix="danielpm1982" uri="http://danielpm1982.com/myTagLib"%>

<p class="p2">${name}'s age is: <danielpm1982:getTimeSinceBirth year="${year}" month="${month}" day="${day}" />.</p>
