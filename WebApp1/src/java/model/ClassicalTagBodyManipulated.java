package model;

import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class ClassicalTagBodyManipulated extends BodyTagSupport{
    
    private JspWriter out;
    private String name;
    
    @Override
    public int doStartTag() throws JspException {
        out = pageContext.getOut();
        try {
            out.print("Before body buffering.<br>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        pageContext.setAttribute("name", name);
        return EVAL_BODY_BUFFERED;
    }

    @Override
    public int doAfterBody() throws JspException {
        try {
            String bodyContentString = bodyContent.getString().trim();
            out.print(bodyContentString+"<br>");
            out.print(Pattern.compile("\\s+").splitAsStream(bodyContentString).map(x->x+"<br>").reduce("",(x,y)->x+y));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            out.print("After body buffering.<br>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public void setName(String name) {
        this.name = name;
    }
}
