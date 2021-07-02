import 'package:flutter/material.dart';
import 'package:ra_scheduling/Models/calendar.dart';
import 'package:ra_scheduling/Models/day.dart';
import 'package:ra_scheduling/Models/shift.dart';
import 'package:ra_scheduling/Screens/Widgets/shifts_display.dart';

class CalendarD extends StatefulWidget {
  @override
  _CalendarDState createState() => _CalendarDState();
}

class _CalendarDState extends State<CalendarD> {
  DateTime selectedDate = DateTime.now(); // TO tracking date
  double _crossAxisSpacing = 8, _mainAxisSpacing = 8, _aspectRatio = 1;
  int _crossAxisCount = 7;

  List<Day> _populateCalendar(){
    var from = DateTime.now();
    var to = DateTime.now().add(const Duration(days: 30));
    var calendar = Calendar(from, to);
    return calendar.getCalendarData();
  }
  List<Widget> displayShifts(Day day) {
    List<Widget> listOfShiftsW = [];
    var listOfShifts = day.getShifts();
    listOfShiftsW.add(Text(day.toString()));
    for (Shift shift in listOfShifts){
      var shiftW = ShiftsDisplay(shiftName: shift.shiftName);
      listOfShiftsW.add(shiftW);
    }
    return listOfShiftsW;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var height = width / _aspectRatio;
    var calendarDay = _populateCalendar();
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount,
        crossAxisSpacing: _crossAxisSpacing,
        mainAxisSpacing: _mainAxisSpacing,
        // childAspectRatio: _aspectRatio,
      ),
      itemCount: calendarDay.length, 
      itemBuilder: (context, index) {
        var listOfShiftsW = displayShifts(calendarDay.elementAt(index));
        return Card(child: FittedBox(alignment: Alignment.topCenter, child: Column(children: listOfShiftsW,)), color: Colors.amberAccent,);
      },);
  }

  // List<Widget> buildsomething(){
  //   List<Widget> list = [];
  //   for(int i = 0; i < 42; i++){
  //     list.add(Center(child: Text("bb")));
  //   }
  //   return list;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   List<Widget> list = buildsomething();
  //   return GridView.count(
  //     crossAxisCount: 7,
  //     childAspectRatio: MediaQuery.of(context).size.height / 2000,
  //     children: list,
  //   );
  //   // return GridView.builder(
  //   //   shrinkWrap: true,

  //   //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //   //     crossAxisCount: 7

  //   //   ),
  //   //   itemBuilder: (context, index) {
  //   //     if (index < 7){
  //   //       return Center(child: Text(listOfDays.elementAt(index)));
  //   //     }
  //   //     return GridTile(child: Text("2"));
  //   //   },
  //   //   itemCount: 35
  //   // );
  // }
}
