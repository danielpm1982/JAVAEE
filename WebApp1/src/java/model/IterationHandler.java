package model;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.SkipPageException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class IterationHandler extends SimpleTagSupport{
    
    private List objectToIterate;
    
    @Override
    public void doTag() throws JspException, IOException {
        for (Object o : objectToIterate){
            if(o instanceof String){
                o = (String)o;
            }
            getJspContext().setAttribute("listPieceToShow", o);
//            getJspBody().invoke(null);
            getJspBody().invoke(getJspContext().getOut());
        }
        
        Enumeration<String> enumerationAttributesNames = getJspBody().getJspContext().getAttributeNamesInScope(PageContext.PAGE_SCOPE);
        String allAttributesNames="";
        int numberOfAttributes=0;
        while(enumerationAttributesNames.hasMoreElements()){
            String currentAttribute = enumerationAttributesNames.nextElement();
            allAttributesNames+=currentAttribute+":"+getJspContext().getAttribute(currentAttribute)+"<br>";
            numberOfAttributes++;
        }
        getJspContext().setAttribute("allAttributesNames", numberOfAttributes+" attributes at pageContext scope:<br>"+allAttributesNames);
        
        boolean throwError = false;
        if(throwError){
            throw new SkipPageException();
        }
        getJspContext().setAttribute("listPieceToShow", "did not throw any exception.");
        getJspBody().invoke(getJspContext().getOut());
    }

    public void setObjectToIterate(List objectToIterate) {
        this.objectToIterate = objectToIterate;
    }
}
