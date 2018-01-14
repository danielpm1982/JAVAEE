package filter;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class MyHttpServletResponseWrapper3 extends HttpServletResponseWrapper{
    private final HttpServletResponse response;
    public MyHttpServletResponseWrapper3(HttpServletResponse response) {
        super(response);
        this.response=response;
    }

    @Override
    public HttpServletResponse getResponse() {
        return response;
    }
    
    public void doCustomMethod(){
        try {
            this.response.getWriter().append("<article>This response was edited by a HttpServletResponseWrapper3 class, at a Filter3 custom class, before being sent to the servlet jsp response!</article>");
            this.response.addHeader("editedAtFilter", "This response was edited by a HttpServletResponseWrapper3 class, at a Filter3 custom class, before being sent to the servlet jsp response!");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
