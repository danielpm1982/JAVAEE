package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SessionManager;

public class Serv6 extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1*60);
        if(request.getParameter("startNewSession")!=null&&request.getParameter("startNewSession").equals("true")){
            if(!session.isNew()){
                SessionManager.logOut(session);
                session=request.getSession();
                session.setMaxInactiveInterval(1*60);
            }
        }
        if(request.getParameter("logOutSession")!=null&&request.getParameter("logOutSession").equals("true")){
            SessionManager.logOut(session);
            RequestDispatcher rd = request.getRequestDispatcher("result7.jsp");
            rd.forward(request, response);
        }
        if(request.getParameter("removeAttribute")!=null&&request.getParameter("removeAttribute").equals("true")){
            if(request.getParameter("attributeToRemove")!=null&&!request.getParameter("attributeToRemove").equals("")){
                SessionManager.removeAttribute(session,request.getParameter("attributeToRemove"));
            }
        }
        synchronized(session){
            if(request.getParameter("name")!=null&&!request.getParameter("name").equals("")){
                session.setAttribute(SessionManager.createUniqueAttributeName("name"),request.getParameter("name"));
            }
            if(session.getAttribute("sessionId")==null){
                session.setAttribute("sessionId", SessionManager.getSessionId(session));
            }
            if(session.getAttribute("sessionDateTimeCreation")==null){
                session.setAttribute("sessionDateTimeCreation", SessionManager.getSessionDateTimeCreation(session));
            }
            if(session.getAttribute("sessionMaxInactiveIntervalTime")==null){
                session.setAttribute("sessionMaxInactiveIntervalTime", SessionManager.getMaxInactiveIntervalTime(session));
            }
            session.setAttribute("sessionLastAccessedTime", SessionManager.getLastAccessedTime(session));
            session.setAttribute("sessionAttributesNames", SessionManager.getSessionAttributesNamesList(session));
            if(session.isNew()){
                session.setAttribute("salute", "Welcome to your new Session!");
            } else{
                session.setAttribute("salute", "Welcome Back to your preexisting Session!");
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("result6.jsp");
        rd.forward(request, response);
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
