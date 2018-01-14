package model;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionManager {
    public static void setSessionGeneralAttributes(HttpServletRequest request, HttpSession session){
        if(request.getParameter("loginName")!=null&&!request.getParameter("loginName").equals("")){
            session.setAttribute("loginName",request.getParameter("loginName"));
        }
        if(request.getParameter("loginPassword")!=null&&!request.getParameter("loginPassword").equals("")){
            session.setAttribute("loginPassword",request.getParameter("loginPassword"));
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
    }
    
    public static String setSessionSpecificAttributes(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException{
        if(session.isNew()&&request.getParameter("loginName")!=null&&request.getParameter("logOnNewSession")!=null){
            String salute = "Welcome to your new Session!";
            session.setAttribute("salute", salute);
            String cookieInfo="";
            Cookie[] cookies = CookiesManager.manageClientIdCookies(request,response);
            if(cookies[0]!=null&&cookies[1]!=null){
                cookieInfo += CookiesManager.getCookiesArrayAttributesString(cookies);
            }
            session.setAttribute("cookieInfo", cookieInfo);
        } else if(!session.isNew()&&request.getParameter("loginName")==null&&session.getAttribute("loginName")!=null){
            String salute = "Welcome Back to your preexisting Session!";
            session.setAttribute("salute", salute);
            String cookieInfo="";
            Cookie[] cookies = CookiesManager.manageClientIdCookies(request,response);
            if(cookies[0]!=null&&cookies[1]!=null){
                cookieInfo += CookiesManager.getCookiesArrayAttributesString(cookies);
            }
            session.setAttribute("cookieInfo", cookieInfo);
        } else{
            Cookie[] cookies = CookiesManager.manageClientIdCookies(request,response);
            String cookieInfo="";
            if(cookies[0]!=null&&cookies[1]!=null){
                cookieInfo = "Although your session has been terminated, your info available on Cookies will last for ";
                cookieInfo += CookiesManager.getCookieMaxAge(cookies[0])+"<br>";        
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
    
    public static String getSessionDateTimeCreation(HttpSession session){
        Instant instant = Instant.ofEpochMilli(session.getCreationTime());
        ZonedDateTime zonedDateTime = ZonedDateTime.ofInstant(instant, ZoneId.of("America/Fortaleza"));
        String zonedDateTimeString = zonedDateTime.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.LONG, FormatStyle.FULL))+"["+zonedDateTime.getOffset()+"] "+zonedDateTime.getZone();
        return zonedDateTimeString;
    }
    public static List<String> getSessionAttributesNamesList(HttpSession session){
        List<String> list = new ArrayList<>();
        Enumeration<String> attributeNames = session.getAttributeNames();
        while(attributeNames.hasMoreElements()){
            list.add(attributeNames.nextElement());
        }
        return list.stream().filter(x->x.startsWith("name")).sorted().collect(Collectors.toList());
    }
    public static String createUniqueAttributeName(String name){
        String uniqueName = name+LocalDateTime.now().toEpochSecond(ZoneOffset.of("-03:00"));
        return uniqueName;
    }
    public static String getSessionId(HttpSession session){
        return session.getId();
    }
    public static String getLastAccessedTime(HttpSession session){
        Instant instant = Instant.ofEpochMilli(session.getLastAccessedTime());
        ZonedDateTime zonedDateTime = ZonedDateTime.ofInstant(instant, ZoneId.of("America/Fortaleza"));
        String zonedDateTimeString = zonedDateTime.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.LONG, FormatStyle.FULL))+"["+zonedDateTime.getOffset()+"] "+zonedDateTime.getZone();
        return zonedDateTimeString;
    }
    public static void logOut(HttpSession session){
        session.invalidate();
    }
    public static String getMaxInactiveIntervalTime(HttpSession session){
        int interval = session.getMaxInactiveInterval();
        int hours = interval/3600;
        int minutes = (interval%3600)/60;
        int seconds =  interval%60;
        String result = String.format("%02dh:%02dm:%02ds", hours,minutes,seconds);
        return result;
    }
    public static void removeAttribute(HttpSession session, String attributeToRemove){
        session.removeAttribute(attributeToRemove);
    }
}
