package model;

import java.io.IOException;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassicalCollectionIterationHandler extends TagSupport{
    
    private List objectToIterate;
    private int listCounter;
    
    @Override
    public int doStartTag() throws JspException {
        try {
            pageContext.getOut().print("Before body inclusion.<br>");
            if(!objectToIterate.isEmpty()){
                pageContext.getOut().print("Object to Iterate: "+objectToIterate+"<br>");
                listCounter=0;
                pageContext.setAttribute("listItem", (String)objectToIterate.get(listCounter));
                return EVAL_BODY_INCLUDE;
            } else{
                pageContext.getOut().print("Empty List!<br>");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return SKIP_BODY;
    }

    @Override
    public int doAfterBody() throws JspException {
        listCounter++;
        while(listCounter<objectToIterate.size()){
            pageContext.setAttribute("listItem", (String)objectToIterate.get(listCounter));
            return EVAL_BODY_AGAIN;
        }
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().print("After body inclusions.<br>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public void setObjectToIterate(List objectToIterate) {
        this.objectToIterate = objectToIterate;
    }
}
