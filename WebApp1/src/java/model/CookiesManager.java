package model;

import java.util.Arrays;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookiesManager {
    public static Cookie[] manageClientIdCookies(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = new Cookie[2];
        if(getCookie(request, "loginName")==null){
            if(request.getParameter("loginName")!=null){
                Cookie loginNameCookie = new Cookie("loginName",request.getParameter("loginName"));
                setCookieAttributes(loginNameCookie);
                response.addCookie(loginNameCookie);
                Cookie loginPasswordCookie = new Cookie("loginPassword", request.getParameter("loginPassword"));
                setCookieAttributes(loginPasswordCookie);
                response.addCookie(loginPasswordCookie);
                cookies[0]=loginNameCookie;
                cookies[1]=loginPasswordCookie;
            }
        } else{
            Cookie loginNameCookie = getCookie(request, "loginName");
            setCookieAttributes(loginNameCookie);
            response.addCookie(loginNameCookie);
            Cookie loginPasswordCookie = getCookie(request, "loginPassword");
            setCookieAttributes(loginPasswordCookie);
            response.addCookie(loginPasswordCookie);
            cookies[0]=loginNameCookie;
            cookies[1]=loginPasswordCookie;
        }
        return cookies;
    }
    private static void setCookieAttributes(Cookie cookie){
        cookie.setMaxAge(7*24*60*60);
        cookie.setDomain("localhost");
        cookie.setPath("/WebApp1/");
        cookie.setHttpOnly(true);
        cookie.setSecure(false);
        cookie.setVersion(0);
        if(cookie.getName().equals("loginName")){
            cookie.setComment("loginNameCookie value represents the loginCookieName of the Client.<br>");
        } else if(cookie.getName().equals("loginPassword")){
            cookie.setComment("loginPasswordCookie value represents the loginCookiePassword of the Client.<br>");
        }
    }
    public static String getCookiesArrayAttributesString(Cookie[] cookies){
        String attributesString="";
        attributesString += "CookieInfo-> loginCookieName: "+cookies[0].getValue()+" loginCookiePassword: "+cookies[1].getValue();
        attributesString += "<br>domain: "+cookies[0].getDomain()+" path: "+cookies[0].getPath()+" maxAge: "+cookies[0].getMaxAge()+"seconds isHttpOnly: "+cookies[0].isHttpOnly();
        attributesString += "<br>comment1: "+cookies[0].getComment()+"comment2: "+cookies[1].getComment()+" isSecure: "+cookies[0].getSecure()+" version(1:RFC2109;0:OriginalNetscapeVersion): "+cookies[0].getVersion();
        return attributesString;
    }
    private static Cookie getCookie(HttpServletRequest request, String cookieNameField) {
        Cookie[] requestCookies = request.getCookies();
        if(requestCookies!=null){
            Cookie resultCookie = Arrays.stream(requestCookies).filter(x->x.getName().equals(cookieNameField)).findFirst().orElse(null);
            return resultCookie;
        }
        return null;
    }
    public static String getCookieMaxAge(Cookie cookie){
        int age = cookie.getMaxAge();
        int hours = age/3600;
        int minutes = (age%3600)/60;
        int seconds =  age%60;
        String result = String.format("%02dh:%02dm:%02ds", hours,minutes,seconds);
        return result;
    }
}
