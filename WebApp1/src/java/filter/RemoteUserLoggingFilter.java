package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RemoteUserLoggingFilter implements Filter{

    private FilterConfig fc;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.fc=filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        String nameUser = req.getRemoteUser();
        if(nameUser!=null){
            fc.getServletContext().log("Filter1: User "+nameUser+" initialized access to a resource at this app...");
        }
        MyHttpServletResponseWrapper myHttpServletResponseWrapper = new MyHttpServletResponseWrapper(resp);
        myHttpServletResponseWrapper.doCustomMethod();
        chain.doFilter(request, myHttpServletResponseWrapper);
        fc.getServletContext().log(myHttpServletResponseWrapper.getResponse().getHeader("editedAtFilter"));
        fc.getServletContext().log("Filter1: User "+nameUser+" ended accessing a resource at this app...");
    }

    @Override
    public void destroy() {
        fc=null;
    }
}


/*
Just an example of how to extend HttpServletResponseWrapper (or Request), creating an extended decorator class with any custom new methods and logic inside it,
and how to pass it to the chain.doFilter() method as argument (and to the servlet of jsp above it, at the stack), instead of the original request or response. 
This way, the original response outputStream could be compressed, for instance, at the new wrapper class, before being automatically returned to the client 
as soon as the chain.doFilter() method ends (after top servlet/jsp execution ends). Despite any other manipulation of the myHttpServletResponseWrapper right below, 
the outputStream would already have returned to the client. In this example, for simplicity, only test log messages are displayed at the console and some text 
is appended to the writer of the customized response, for showing at the client page. Any other manipulation could have been done to the response, though, before
the servlet/jsp has access to it. Another 2 other filters were added, so that the response will pass through 3 filters before arriving at the jsp/servlet.
*/
