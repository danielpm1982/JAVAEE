package model;

import java.io.IOException;
import java.time.ZonedDateTime;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class DateTagHandler extends SimpleTagSupport{

    private ZonedDateTime zonedDateTime;
    
    @Override
    public void doTag() throws JspException, IOException {
        getJspContext().getOut().write("DateTime at "+zonedDateTime.getZone()+":<br>"+Time.getDateTimeString(zonedDateTime)+".<br><br>");
    }

    public void setDate(ZonedDateTime zonedDateTime) {
        this.zonedDateTime=zonedDateTime;
    }
    
}
