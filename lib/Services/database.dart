import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ra_scheduling/Models/shift.dart';

class DatabaseService {
  var uid;
  final String name;

  DatabaseService({required this.uid, required this.name});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference shiftCollection =
      FirebaseFirestore.instance.collection('shifts');

  Future updateUserData(String name) async {
    return await userCollection.doc(uid).set({"name": name});
  }

  String get nameOf {
    return this.name;
  }

  // Future updateUserData(String name, List<Shift> shifts) async {
  //   return await userCollection
  //       .doc(currentUserUID)
  //       .set({"name": name, "courses": shifts});
  // }

  Stream<QuerySnapshot> getRealtimeUpdates() {
    // QuerySnapshot uids = await userCollection.get();
    Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
        .collection('users')
        .snapshots(includeMetadataChanges: true);
    return collectionStream;
  }

  Future<List<String>> fetchUsers() async {
    List<String> names = [];
    try {
      QuerySnapshot uids = await userCollection.get();

      uids.docs.forEach((uid) {
        names.add(uid.get("name"));
      });
    } catch (e) {
      print(e.toString());
    }
    return names;
  }

  Future updateUserShift(String shiftName) async {
    return await userCollection.doc(uid).set({"shift": shiftName});
  }

  Future addShiftToCollection(String shiftName, TimeOfDay time,
      String userTakingShift, String nameOfPSOD, DateTime shiftDate) async {
        Shift shift = Shift(shiftName: shiftName, userTakingShift: "", nameOfPSOD: nameOfPSOD, time: time, shiftDate: shiftDate);
        Map<String, dynamic> shiftJSON = shift.toJson();
        shiftCollection.add(shiftJSON);
  }

  //   return names;
  //   // Map<String,Map<dynamic, dynamic>> mapapna = {};
  //   // uids.docs.forEach((uid) {
  //   //   mapapna.putIfAbsent(uid.id, () => uid.data());
  //   // });
  // }

  // Future <List<String>> fetchCourseSuggestions(String text) async {
  //   GetOptions g;
  //   // QuerySnapshot courses =
  //   //      await FirebaseFirestore.instance.collection('courses').where("course_id", "==",text).get();

  //   // print(courses.docs.first.id);

  //   // Map<String,Map<dynamic, dynamic>> mapapna = {};
  //   // uids.docs.forEach((uid) {
  //   //   mapapna.putIfAbsent(uid.id, () => uid.data());
  //   // });
  // }

}
