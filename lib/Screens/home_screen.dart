import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ra_scheduling/Models/calendar.dart';
import 'package:ra_scheduling/Screens/Widgets/calendar_diplay.dart';
import 'package:ra_scheduling/Services/database.dart';


class ChooseShiftScreen extends StatefulWidget {
  ChooseShiftScreen({Key? key}) : super(key: key);

  @override
  _ChooseShiftScreenState createState() => _ChooseShiftScreenState();
}

class _ChooseShiftScreenState extends State<ChooseShiftScreen> {
  final String currentUID = "12132423";
  final String name = "Hello";

  // var from = DateTime.now();
  // var to = DateTime.now().add(const Duration(days: 30));
  // // }
  // void populateCalendar(){
  //   print("here");
  //   var calendar = Calendar(from, to);
  //   calendar.getCalendarData;
  // }
  // Widget? displayShifts() {
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Users"),
          ),
          body: Container(child: Row(children: [
             Flexible(  
              flex: 1,
              child: StreamBuilder<QuerySnapshot>(
                stream: DatabaseService(uid: currentUID, name: name).getRealtimeUpdates(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return ListTile(
                        title: Text(document.data()['name']),
                      );
                    },).toList(),
                  );
                },
              ),
            ),

            Flexible(flex: 3, child: CalendarD())
          ],),


         

          // body: FutureBuilder(
          //   future: DatabaseService(uid: currentUID).fetchUsers(),
          //   builder: (context, AsyncSnapshot<List<String>?> snapshot) {
          //     if (snapshot.hasData) {
          //       List<String>? listNames = snapshot.data;
          //       return Center(
          //         child: ListView.builder(
          //             itemCount: listNames!.length,
          //             itemBuilder: (context, index) {
          //               return Card(child: Text(listNames.elementAt(index)));
          //             }),
          //       );
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          ),
    );
  }
}
