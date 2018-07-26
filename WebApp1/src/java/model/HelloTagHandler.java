package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HelloTagHandler extends SimpleTagSupport{

    private String userName;
    
    @Override
    public void doTag() throws JspException, IOException {
        getJspContext().getOut().write("Hello World, "+userName+" !!<br>");
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
}
