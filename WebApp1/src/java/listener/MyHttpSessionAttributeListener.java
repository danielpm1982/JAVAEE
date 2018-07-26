/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 *
 * @author Daniel
 */
public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener{

    @Override
    public void attributeAdded(HttpSessionBindingEvent e) {
        System.out.println("Name/Value: "+e.getName()+"/"+e.getValue()+" was added to session of sessionId: "+e.getSession().getId());
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent e) {
        System.out.println("Name/Value: "+e.getName()+"/"+e.getValue()+" was removed from session of sessionId: "+e.getSession().getId());
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent e) {
        System.out.println("Name/Value: "+e.getName()+"/"+e.getValue()+" was replaced at session of sessionId: "+e.getSession().getId());
    }
    
}
