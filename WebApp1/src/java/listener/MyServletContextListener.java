package listener;

import javax.servlet.*;
import model.Time;

public class MyServletContextListener implements ServletContextListener{
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String zoneId1 = sce.getServletContext().getInitParameter("zoneId1");
        String result = "ZonedTime at zoneId1 = "+zoneId1+" is:<br><br>";
        result += Time.getDateTimeString(zoneId1);
        sce.getServletContext().setAttribute("zonedTime1", result);
        
        String zoneId2 = sce.getServletContext().getInitParameter("zoneId2");
        result = "ZonedTime at zoneId2 = "+zoneId2+" is:<br><br>";
        result += Time.getDateTimeString(zoneId2);
        sce.getServletContext().setAttribute("zonedTime2", result);
        
        String zoneId3 = sce.getServletContext().getInitParameter("zoneId3");
        result = "ZonedTime at zoneId3 = "+zoneId3+" is:<br><br>";
        result += Time.getDateTimeString(zoneId3);
        sce.getServletContext().setAttribute("zonedTime3", result);
        
        String zoneId4 = sce.getServletContext().getInitParameter("zoneId4");
        result = "ZonedTime at zoneId4 = "+zoneId4+" is:<br><br>";
        result += Time.getDateTimeString(zoneId4);
        sce.getServletContext().setAttribute("zonedTime4", result);
        
        String zoneId5 = sce.getServletContext().getInitParameter("zoneId5");
        result = "ZonedTime at zoneId5 = "+zoneId5+" is:<br><br>";
        result += Time.getDateTimeString(zoneId5);
        sce.getServletContext().setAttribute("zonedTime5", result);
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
