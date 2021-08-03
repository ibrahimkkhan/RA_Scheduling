import 'User.dart';

enum ShiftType{RA,Desk}

class Shift{

  late String shiftName;
  late DateTime shiftTime;
  late String userTakingShift;
  late String nameOfPSOD;

  Shift(String shiftName){
    this.shiftName = shiftName;
    
  }

  Map<String, dynamic> toJson() => {
      'name': userTakingShift,
      //'email': email,
    };
  

  Shift.fromJson(Map<String, dynamic> json)
      : userTakingShift = json['name'];


  


}