import 'package:flutter/material.dart';
import 'package:ra_scheduling/Services/database.dart';

class ShiftsDisplay extends StatefulWidget {
  final String shiftName;
  final String currentUID;
  String userTakingShift;
  ShiftsDisplay({Key? key, required this.shiftName, required this.currentUID, required this.userTakingShift}) : super(key: key);

  @override
  _ShiftsDisplayState createState() => _ShiftsDisplayState();
}

class _ShiftsDisplayState extends State<ShiftsDisplay> {
  Color color = Colors.grey;
  bool clicked = false;
  bool shift_taken = false;

  

  // _changeColor(){
  //   setState(() {
  //     clicked = true;
  //   });
  // }

  _assignShift(){
    DatabaseService(uid: widget.currentUID, name: '').updateUserShift(widget.shiftName);
    widget.userTakingShift = DatabaseService(uid: widget.currentUID, name: '').nameOf;
  }

  


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: _assignShift, child: widget.userTakingShift == "NONE"? Text(widget.shiftName) : Text(widget.shiftName + widget.userTakingShift));
  }
}