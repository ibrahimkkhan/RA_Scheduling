import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:ra_scheduling/Services/database.dart';

class AddShift extends StatefulWidget {
  String currentUID;

  AddShift({Key? key, required this.currentUID}) : super(key: key);

  @override
  _AddShiftState createState() => _AddShiftState();
}

class _AddShiftState extends State<AddShift> {
  // late double _height;
  // late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime, shiftName, nameOfPSOD;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  get currentUID => null;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = formatDate(selectedDate, [yy, '-', M, '-', DD]);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = formatDate(DateTime.now(), [yy, '-', M, '-', DD]);

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Shift"),
      content: Column(
        children: [
          Column(
            children: <Widget>[
              TextFormField(
                obscureText: false,
                onChanged: (nameValue) => {
                  setState(() {
                    shiftName = nameValue;
                  })
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Shift Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                validator: (nameValue) {
                  if (nameValue!.isEmpty) {
                    return 'Please enter the Shift Name';
                  }
                  return null;
                },
              ),

              TextFormField(
                obscureText: false,
                onChanged: (namePSOD) => {
                  setState(() {
                    nameOfPSOD = namePSOD;
                  })
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "PSOD Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                validator: (psodValue) {
                  if (psodValue!.isEmpty) {
                    return 'Please enter the PSOD Name';
                  }
                  return null;
                },
              ),
              Text(
                'Choose Date',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  // width: _width / 1.7,
                  // height: _height / 9,
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: TextFormField(
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _dateController,
                    onSaved: (val) {
                      _setDate = val!;
                    },
                    decoration: InputDecoration(
                        disabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        // labelText: 'Time',
                        contentPadding: EdgeInsets.only(top: 0.0)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: <Widget>[
              Text(
                'Choose Time',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              InkWell(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  // width: _width / 1.7,
                  // height: _height / 9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: TextFormField(
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                    onSaved: (val) {
                      _setTime = val!;
                    },
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _timeController,
                    decoration: InputDecoration(
                        disabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        // labelText: 'Time',
                        contentPadding: EdgeInsets.all(5)),
                  ),
                ),
              ),
            ],
          ),

          RaisedButton(child: Text("Submit"),onPressed: () async{
            DatabaseService(uid: currentUID, name: 'Ibrahim').addShiftToCollection(shiftName, selectedTime, "", nameOfPSOD, selectedDate);
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}
