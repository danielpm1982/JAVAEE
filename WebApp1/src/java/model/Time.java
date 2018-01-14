package model;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

public class Time {
    public static String getDateTimeString(){
        ZoneId zonedId = ZoneId.of("America/Fortaleza");
        ZonedDateTime dateTime = ZonedDateTime.now(zonedId);
        return dateTime.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL));
    }
    public static String getDateTimeString(String zoneIdString){
        ZoneId zonedId = ZoneId.of(zoneIdString);
        ZonedDateTime dateTime = ZonedDateTime.now(zonedId);
        return dateTime.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL));
    }
    public static String getDateTimeString(ZonedDateTime zonedDateTime){
        return zonedDateTime.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL));
    }
}
