package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassicalLevel0TagText extends TagSupport{
    
    private JspWriter out;
    private String level0Attribute;

    @Override
    public int doStartTag() throws JspException {
        out = pageContext.getOut();
        try {
            out.println("Before body inclusion. (level0 tag).<br>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_BODY_INCLUDE;
    }

    @Override
    public int doAfterBody() throws JspException {
        return SKIP_BODY;
    }
    
    @Override
    public int doEndTag() throws JspException {
        try {
            out.println("<br>After body inclusion. (level0 tag).");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public void setLevel0Attribute(String level0Attribute) {
        this.level0Attribute = level0Attribute;
    }

    public String getLevel0Attribute() {
        return level0Attribute;
    }
}
