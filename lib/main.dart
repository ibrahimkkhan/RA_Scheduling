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
        '/choose_shift' : (context) => ChooseShiftScreen(),
        
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseShiftScreen(),
    );
  }
}