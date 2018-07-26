package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassicalBigTextHandler extends TagSupport{
    
    private JspWriter out; 

    @Override
    public int doStartTag() throws JspException {
        out = pageContext.getOut();
        try {
            out.println("Before body inclusion.<br>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_BODY_INCLUDE;
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            out.println("<br>After body inclusion.");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }

}
