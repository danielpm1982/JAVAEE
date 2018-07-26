package model;

import java.time.LocalDate;
import java.time.Period;

public class MyTagLibClass {
    public static String getAge(String name,int day, int month, int year){
        LocalDate birthDate = LocalDate.of(year, month, day);
        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(birthDate, currentDate);
        return name+"'s age is: "+period.getYears()+" years, "+period.getMonths()+" months and "+period.getDays()+" days.";
    }
}
