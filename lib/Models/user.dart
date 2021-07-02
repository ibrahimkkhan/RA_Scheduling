import 'dart:ui';

import 'Shift.dart';
enum PositonType{
  ra,
  rd,
  ca,
}

class User{
  late String name;
  late Color userColor;
  late final int uid;
  late String password;
  late PositonType type;

  List<Shift> deskShifts = [];
  List<Shift> rodShifts = [];

  // int totalShiftsDesk = deskShifts.length;
  // int totalShiftsROD = desk_shifts.length;

}