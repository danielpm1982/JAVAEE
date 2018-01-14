<%@attribute name="text" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@tag body-content="scriptless" %>
<%@taglib prefix="danielpm1982" uri="http://danielpm1982.com/myTagLib"%>

<p class="p3">
    Testing tag files with simple tags:<br><br>
    <danielpm1982:getSimpleTagText text="attributeText: ${text}">bodyText: <jsp:doBody /></danielpm1982:getSimpleTagText>
</p>
