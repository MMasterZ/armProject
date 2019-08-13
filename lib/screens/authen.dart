import 'package:arm_project/screens/my_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String emailString, passwrodString;

  // Methods

  Widget emailText() {
    return TextFormField(
      onSaved: (String value) {
        emailString = value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'email', helperText: 'Your Email'),
    );
  }

  Widget passwrodText() {
    return TextFormField(
      onSaved: (String value) {
        passwrodString = value;
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'password', helperText: 'More 6 Charactor'),
    );
  }

  Widget showForm() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(200, 255, 255, 255),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0)),
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              emailText(),
              passwrodText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 36.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget showBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg-01.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget okButton() {
    return FlatButton(
      child: Text("ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> checkAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailString,
      password: passwrodString,
    )
        .then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            okButton(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          showBackground(),
          backButton(),
          showForm(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.navigate_next,
          color: Colors.blue,
          size: 36.0,
        ),
        onPressed: () {
          formKey.currentState.save();
          print("name = $emailString password = $passwrodString");
          checkAuthen();
        },
      ),
    );
  }
}
