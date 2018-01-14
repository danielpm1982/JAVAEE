package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CookiesManager;
import model.SessionManager;

public class Serv7 extends HttpServlet {
    
    HttpSession session;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        session = request.getSession();
        session.setMaxInactiveInterval(1*60);
        
        /*This main servlet first verifies if the client is requesting a new session (logging in), in order to invalidate any existing sessions
            and create another session with a new JSESSIONID. If not, verifies if the client is requesting a log off, so that,
            before invalidating the current session, data from Cookie objects can be retrieved and sent to the view through request attributes 
            (as the session would have already been invalidated when the view would be allowed to see its attributes data, but not the request).
            In case of logging off, the flux of the algorithm is interrupted and returned to the caller of this method (otherwise the method
            would continue to the next manipulation of session attributes with an inexisting session, throwing an illegal state exception).
        */
        String verifyLogOnLogOutReturn = verifyLogOnLogOut(request, response);
        if(verifyLogOnLogOutReturn!=null&&verifyLogOnLogOutReturn.equals("returnFromProcess")){
            return;
        }
        
        /*  If the client is not requesting (through request parameters) any of the above two cases, the algorithm below simply runs to set 
        the session attributes and send them to the view. In the case of the specific attributes, there are 3 cases. The first case will be 
        when the client is requesting a new session: a specific string salute is set and data from eventually existing cookies are added to 
        this string. The client will see the data set at the session time (not persistable) as well as the eventually previous data persisted 
        in cookies (client side) at previous different sessions. The second case is the one in which the client has already set a new session, 
        has already set an attribute session with his info ("clientName" for instance), and sends a request to the servlet a second time, with 
        his JSESSIONID on it (automatically set at the http request header). In this case, another string salute is set, welcoming him back, 
        and, as in the first case, cookie data is searched to see if any exists to be added to this string (and shown at the view). The third 
        specific case will be all others, including illegal url requests (different from the two cases above) as well as the case in which the 
        session is not valid anymore (invalidated or timed out). If the user tries an illegal request, or the session has timed out, the session 
        is invalidated (if already has not been) and the flux of the algorithm must also be stopped with a return at the servlet, in order to not 
        forwarding the flux to the normal expected JSP, but only to the exceptional (logged off) one. But before forwarding, the salute info is 
        set at a request (and not session) attribute. In the first two cases, otherwise, a session scope is used. The auxiliary classes 
        SessionManager and CookiesManager are used to manipulate and formating the multi-scope attributes and their returns and also to control 
        which values are set according to the conditions dinamically tested at each request, respectively regarding session's and cookies' info. 
        These two managing classes are, though, not pure model classes, but also auxiliary controller ones. It would be preferred a better 
        separation of these in two other controller classes and two model ones, all controlled by the single main servlet. But for simplicity, 
        it was put all that is auxiliary together as if they were pure model classes. It's surely a bad design, though.
        */
        SessionManager.setSessionGeneralAttributes(request, session);
        String setSessionSpecificAttributesReturn = SessionManager.setSessionSpecificAttributes(request, response, session);
        if(setSessionSpecificAttributesReturn!=null&&setSessionSpecificAttributesReturn.equals("returnFromProcess")){
            return;
        }
        
        /*The set general and specific session (and eventually request) attributes are forwarded to the normal JSP view to be shown.
        */
        RequestDispatcher rd = request.getRequestDispatcher("result8.jsp");
        rd.forward(request, response);
    }
    
    private String verifyLogOnLogOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        if(request.getParameter("logOnNewSession")!=null){
           SessionManager.logOut(session);
           session=request.getSession();
           session.setMaxInactiveInterval(1*60);
        } else if(request.getParameter("logOut")!=null){
            Cookie[] cookies = CookiesManager.manageClientIdCookies(request,response);
            String cookieInfo="";
            if(cookies[0]!=null&&cookies[1]!=null){
                cookieInfo = "Although your session has been terminated,<br>your info available on Cookies will last for ";
                cookieInfo += CookiesManager.getCookieMaxAge(cookies[0])+".<br><br>";        
                cookieInfo += CookiesManager.getCookiesArrayAttributesString(cookies);
            }
            request.setAttribute("cookieInfo", cookieInfo);
            SessionManager.logOut(session);
            RequestDispatcher rd = request.getRequestDispatcher("result9.jsp");
            rd.forward(request, response);
            return "returnFromProcess";
        }
        return null;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
