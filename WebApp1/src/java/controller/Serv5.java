package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Serv5 extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fontColor = request.getParameter("colorSelect");
        
        synchronized(getServletContext()){
            if(fontColor.equals("")){
                getServletContext().setAttribute("fontColor", "white");
            } else{
                getServletContext().setAttribute("fontColor", fontColor);
            }
        getServletContext().setAttribute("time", model.Time.getDateTimeString());
        }
        
        HttpSession session = request.getSession();
        synchronized(session){
            if(fontColor.equals("")){
                session.setAttribute("fontColor", "white");
            } else{
                session.setAttribute("fontColor", fontColor);
            }
        session.setAttribute("time", model.Time.getDateTimeString());
        }
        
        if(fontColor.equals("")){
                request.setAttribute("fontColor", "white");
            } else{
                request.setAttribute("fontColor", fontColor);
            }
        request.setAttribute("time", model.Time.getDateTimeString());
        
//        RequestDispatcher rd = request.getRequestDispatcher("result5.jsp");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/result5.jsp");
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
