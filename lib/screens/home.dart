import 'package:arm_project/screens/my_service.dart';
import 'package:arm_project/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// StatefulWidget เป็นการทายเท Data
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Explicit
  double mySizeLogo = 120.0;
  Color myColor = Color.fromARGB(0xFF, 0x00, 0x3c, 0x8f);

  // Method
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute = MaterialPageRoute(
        builder: (BuildContext context) => MyService(),
      );
      Navigator.of(context).pushAndRemoveUntil(
        materialPageRoute,
        (Route<dynamic> route) => false,
      );
    }
  }

  Widget showLogo() {
    return Container(
      child: Image.asset('images/Video-logo.png'),
      width: mySizeLogo,
      height: mySizeLogo,
    );
  }

  Widget showAppName() {
    return Text(
      'การเดินทาง',
      style: TextStyle(
          fontSize: 30.0,
          color: myColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Kanit'),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          signInButton(),
          mySizeBox(),
          signUpButton(),
        ],
      ),
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: myColor,
        child: Text(
          'Sing In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: myColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: myColor),
        ),
        onPressed: () {
          //Create Route With Arrow Back
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => Register(),
          );

          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
      height: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.grey],
              radius: 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showLogo(),
              showAppName(),
              mySizeBox(),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
