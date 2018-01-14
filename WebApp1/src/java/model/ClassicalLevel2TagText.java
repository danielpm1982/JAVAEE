package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassicalLevel2TagText extends TagSupport{
    
    private JspWriter out;
    private String level2Attribute;

    @Override
    public int doStartTag() throws JspException {
        out = pageContext.getOut();
        try {
            out.println("Before body inclusion (level2 tag).<br>");
            out.println("All levels tags attributes values - 0-1-2:<br>"+getLevels012AttributesString()+"<br>");
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
            out.println("<br>After body inclusion. (level2 tag).");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public void setLevel2Attribute(String level0Attribute) {
        this.level2Attribute = level0Attribute;
    }

    public String getLevel2Attribute() {
        return level2Attribute;
    }
    
    public String getLevels012AttributesString(){
        String level0AttributeString = ((ClassicalLevel0TagText)getParent().getParent()).getLevel0Attribute();
        String level1AttributeString = ((ClassicalLevel1TagText)getParent()).getLevel1Attribute();
        String level2AttributeString = getLevel2Attribute();
        return "level0Attribute: "+level0AttributeString+"<br>level1Attribute: "+level1AttributeString+"<br>level2Attribute: "+level2AttributeString;
    }
}
