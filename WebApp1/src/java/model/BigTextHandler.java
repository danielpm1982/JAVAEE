package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class BigTextHandler extends SimpleTagSupport{
    
    private String text;
    
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter writer = getJspContext().getOut();
        writer.print(text+"<br>");
        getJspBody().invoke(writer);
//        getJspBody().invoke(null);
    }

    public void setText(String text) {
        this.text = text;
    }
}
