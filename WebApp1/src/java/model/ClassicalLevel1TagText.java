package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassicalLevel1TagText extends TagSupport{
    
    private JspWriter out;
    private String level1Attribute;

    @Override
    public int doStartTag() throws JspException {
        out = pageContext.getOut();
        try {
            out.println("Before body inclusion. (level1 tag).<br>");
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
            out.println("<br>After body inclusion. (level1 tag).");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public void setLevel1Attribute(String level0Attribute) {
        this.level1Attribute = level0Attribute;
    }

    public String getLevel1Attribute() {
        return level1Attribute;
    }
}
