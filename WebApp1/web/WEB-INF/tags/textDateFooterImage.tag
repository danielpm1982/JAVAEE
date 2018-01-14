<%@attribute name="text" required="true" rtexprvalue="true" type="java.lang.String" description="text for the footer"%>
<%@attribute name="date" required="true" rtexprvalue="true" type="java.time.ZonedDateTime" description="zonedDate for the footer"%>
<%@tag import="java.time.ZonedDateTime" import="java.time.ZoneId"%>

<p class="p2">${text}</p>
<p class="p2">
    <jsp:expression>model.Time.getDateTimeString(date)</jsp:expression>
</p>
<img class="footer" src="images/footerImg.jpg" alt="footerImage" title="footerImage">
