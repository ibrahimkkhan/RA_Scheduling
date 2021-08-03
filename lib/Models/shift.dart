import 'package:flutter/material.dart';

import 'User.dart';

enum ShiftType { RA, Desk }

class Shift {
  late String shiftName;
  late DateTime shiftDate;
  late TimeOfDay time;
  late String userTakingShift;
  late String nameOfPSOD;

  Shift({required String shiftName, required TimeOfDay time,
      required String userTakingShift, required String nameOfPSOD, required DateTime shiftDate}) {
    this.shiftName = shiftName;
    this.userTakingShift = userTakingShift;
    this.nameOfPSOD = nameOfPSOD;
    this.time = time;
    this.shiftDate = shiftDate;
  }

  Map<String, dynamic> toJson() => {
        'shiftName': shiftName,
        'time': time.toString(),
        'shiftDate': shiftDate.toString(),
        'nameOfPSOD': nameOfPSOD,
        'userTakingShift': userTakingShift
        //'email': email,
      };

  Shift.fromJson(Map<String, dynamic> json)
      : userTakingShift = json['userTakingShift'],
        time = json['time'],
        shiftDate = json['shiftDate'],
        nameOfPSOD = json['nameOfPSOD'],
        shiftName = json['shiftName'];
}
