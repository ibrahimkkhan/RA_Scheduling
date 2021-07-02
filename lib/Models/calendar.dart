import 'day.dart';

class Calendar{
  late DateTime from;
  late DateTime to;
  late List<Day> listOfDays;  
  
  Calendar(DateTime from, DateTime to){
    this.from = from;
    this.to = to;
    listOfDays = [];
  }




  List<Day> getCalendarData(){
    int numDays = to.difference(from).inDays;
    for (int i = 0; i < numDays; i++){
      
      int weekday = from.add(Duration(days: i)).weekday;
      int day = from.add(Duration(days: i)).day;
      var finalDay = Day(day,weekday);
      listOfDays.add(finalDay);
    }
    return listOfDays;
  }

}