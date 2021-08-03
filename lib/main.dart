import 'package:flutter/material.dart';
import 'package:ra_scheduling/Screens/auth_screen.dart';
import 'package:ra_scheduling/Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/choose_shift' : (context) => ChooseShiftScreen(currentUID: "1115661851",),
        
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseShiftScreen(currentUID:"1115661851",),
    );
  }
}


//! Need to take the shifts from collection and update them on the calendar (remember to convert Date and time from String to the actual formats)
//! Day class may not be needed. Rethink design!
//! As user clicks the shift update accordingly 
//! 
