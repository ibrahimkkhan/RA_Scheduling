 import 'package:ra_scheduling/Models/shift.dart';

class Day{
  late int day;
  late int weekDay;
  late String weekDayName;

  var daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]; 
  late List<Shift> shiftsOnDay;

  Day(int day, int weekDay){
    this.day = day;
    this.weekDay = weekDay;
    this.weekDayName = daysOfWeek[weekDay - 1];
    this.shiftsOnDay = [];
  }

  List<Shift> getShifts(){
    switch(weekDayName){
      case "Friday":
        // shiftsOnDay.add(Shift("DA1"));
        // shiftsOnDay.add(Shift("DA2"));
        // shiftsOnDay.add(Shift("RA1"));
      break;

      default:
        // shiftsOnDay.add(Shift("DA1"));
        // shiftsOnDay.add(Shift("DA2"));
        // shiftsOnDay.add(Shift("DA3"));
        // shiftsOnDay.add(Shift("RA1"));
        // shiftsOnDay.add(Shift("RA1"));

      // case "":

      // break;

      // case "Sunday":

      // break;

      // case "Sunday":

      // break;

      // case "Sunday":

      // break;
    }
    return shiftsOnDay;
  }

  String toString() {
    return "Date is $day and day is $weekDayName";
  }
}