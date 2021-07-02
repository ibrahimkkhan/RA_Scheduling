import 'package:flutter/material.dart';
import 'package:ra_scheduling/Services/auth_service.dart';
import 'package:ra_scheduling/Services/database.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  
  List<String> courses = [];

  String name = "";
  String uid = "";
  String password = "";
  final AuthService _auth =  AuthService();

  String error = "";

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      obscureText: false,
      onChanged: (nameValue) => {
        setState(() {
          name = nameValue;
        })
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (nameValue) {
        if (nameValue!.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );

    final uidField = TextFormField(
      obscureText: false,
      onChanged: (uidValue) => {
        setState(() {
          uid = uidValue;
        })
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "UID Number",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (uidValue) {
        if (uidValue!.isEmpty) {
          return 'Please enter your UID';
        }
        return null;
      },
    );

    final passwordField = TextFormField(
      obscureText: true,
      onChanged: (passwordValue) => {
        setState(() {
          password = passwordValue;
        })
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (passwordValue) {
        if (passwordValue!.isEmpty) {
          return 'Please enter your Password';
        }
        return null;
      },
    );

    final loginButton = ElevatedButton(
      style: ButtonStyle(backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return Colors.black38;
        return Colors.black;
      })),
      onPressed: () async {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        if (_formKey.currentState!.validate()) {
          //DatabaseService _databaseService = DatabaseService(uid: uidField);

          dynamic result = await _auth.signUp(uid, name);
          result == "Failed to sign up"
              ? setState(() {
                  error = "Failed to sign up. Try again.";
                })
              : setState(() {
                  Navigator.of(context).pushNamed("/choose_shift");
                });
        }
      },
      child: Text(
        "Sign Up",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 450.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  nameField,
                  SizedBox(height: 15.0),
                  uidField,
                  SizedBox(height: 15.0),
                  passwordField,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: loginButton,
                  ),
                  error != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(error),
                        )
                      : Text(""),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}