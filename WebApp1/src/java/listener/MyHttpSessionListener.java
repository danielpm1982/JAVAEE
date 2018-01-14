/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import model.SessionManager;

/**
 *
 * @author Daniel
 */
public class MyHttpSessionListener implements HttpSessionListener{
    int numberOfUsersLoggedIn=0;
    @Override
    
    //Doesn't work propperly with serv7.java because of the algorithm used in invalidating and initializing a new session.
    public void sessionCreated(HttpSessionEvent e) {
        numberOfUsersLoggedIn++;
        HttpSession session = e.getSession();
        System.out.println("JSESSIONID "+session.getId()+" logged in: ");
        SessionManager.getSessionAttributesNamesList(session).iterator().forEachRemaining(x->{System.out.print("\n"+x+": "+session.getAttribute(x));});
        System.out.println("Total sessions active: "+numberOfUsersLoggedIn);
    }
    
    //Doesn't work propperly with serv7.java because of the algorithm used in invalidating and initializing a new session.
    @Override
    public void sessionDestroyed(HttpSessionEvent e) {
        numberOfUsersLoggedIn--;
        HttpSession session = e.getSession();
        System.out.println("JSESSIONID "+session.getId()+" logged off: ");
        SessionManager.getSessionAttributesNamesList(session).iterator().forEachRemaining(x->{System.out.print("\n"+x+": "+session.getAttribute(x));});
        System.out.println("Total sessions active: "+numberOfUsersLoggedIn);
    }
}
