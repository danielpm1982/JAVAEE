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

public class RemoteUserLoggingFilter2 implements Filter{

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
            fc.getServletContext().log("Filter2: User "+nameUser+" initialized access to a resource at this app...");
        }
        MyHttpServletResponseWrapper2 myHttpServletResponseWrapper = new MyHttpServletResponseWrapper2(resp);
        myHttpServletResponseWrapper.doCustomMethod();
        chain.doFilter(request, myHttpServletResponseWrapper);
        fc.getServletContext().log(myHttpServletResponseWrapper.getResponse().getHeader("editedAtFilter"));
        fc.getServletContext().log("Filter2: User "+nameUser+" ended accessing a resource at this app...");
    }

    @Override
    public void destroy() {
        fc=null;
    }
}
