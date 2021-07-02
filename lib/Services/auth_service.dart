import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future _createPersonFromFirebase(User user)async{
  //   // Person personCreated;
  //   user != null ? Person(user.uid, "firstName", "lastName"): null;
  //   // await DatabaseService().updateUserData(personCreated);
  // } 

  Future signUp(String uid, String name) async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      
      // User user = result.user;
      
      // user.updateProfile(displayName: name);
      //_createPersonFromFirebase(user);
      await DatabaseService(uid:uid).updateUserData(name);
    }catch (e){
      print(e.toString());  
    }
    
    
  }



}