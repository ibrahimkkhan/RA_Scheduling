import 'package:flutter/material.dart';

class ShiftsDisplay extends StatefulWidget {
  final String shiftName;
  ShiftsDisplay({Key? key, required this.shiftName}) : super(key: key);

  @override
  _ShiftsDisplayState createState() => _ShiftsDisplayState();
}

class _ShiftsDisplayState extends State<ShiftsDisplay> {
  Color color = Colors.grey;
  bool clicked = false;

  _changeColor(){
    setState(() {
      clicked = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: _changeColor, child: clicked == false ? Text(widget.shiftName) : Text(widget.shiftName + "RA NAME"));
  }
}