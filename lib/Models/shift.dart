import 'User.dart';

enum DutyType{RA,Desk}

class Shift{

  late String shiftName;
  late DateTime shiftTime;
  late User userTakingShift;
  late String nameOfPSOD;

  Shift(String shiftName){
    this.shiftName = shiftName;
  }


}