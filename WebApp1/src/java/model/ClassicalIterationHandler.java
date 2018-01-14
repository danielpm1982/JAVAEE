package model;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassicalIterationHandler extends TagSupport{
    
    private String timesToIterate;
    private int iterationTimeInt;
    
    @Override
    public int doStartTag() throws JspException {
        try {
            pageContext.getOut().print("Before body inclusion.<br>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        if(Integer.valueOf(timesToIterate)>0){
            iterationTimeInt=1;
            pageContext.setAttribute("iterationTime", String.valueOf(iterationTimeInt));
            return EVAL_BODY_INCLUDE;
        } else{
            return SKIP_BODY;
        }
    }

    @Override
    public int doAfterBody() throws JspException {
        iterationTimeInt++;
        if(iterationTimeInt<=Integer.valueOf(timesToIterate)){
            pageContext.setAttribute("iterationTime", String.valueOf(iterationTimeInt));
            return EVAL_BODY_AGAIN;
        } else{
            return SKIP_BODY;
        }
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

    public void setTimesToIterate(String timesToIterate) {
        this.timesToIterate = timesToIterate;
    }
}
