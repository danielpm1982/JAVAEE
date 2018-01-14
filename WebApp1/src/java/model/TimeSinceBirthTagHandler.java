package model;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TimeSinceBirthTagHandler extends SimpleTagSupport{
    
    private String year;
    private String month;
    private String day;
    
    @Override
    public void doTag() throws JspException, IOException {
        int yearInt = Integer.valueOf(year);
        int monthInt = Integer.valueOf(month);
        int dayInt = Integer.valueOf(day);
        LocalDate birthDate = LocalDate.of(yearInt, monthInt, dayInt);
        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(birthDate, currentDate);
        getJspContext().getOut().print(period.getYears()+" years, "+period.getMonths()+" months and "+period.getDays()+" days");
    }

    public void setYear(String year) {
        this.year = year;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public void setDay(String day) {
        this.day = day;
    }
}
