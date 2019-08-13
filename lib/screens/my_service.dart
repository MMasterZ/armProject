import 'package:arm_project/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  Color textColor = Color.fromARGB(0xFF, 0x00, 0x3c, 0x8f);
  String nameLogin = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Methods

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameLogin = firebaseUser.displayName;
    });
  }

  Future<void> signOutProcess() async {
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());

      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset(
        'images/Video-logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showName() {
    return Text(
      'การเดินทาง',
      style: TextStyle(
          fontSize: 24.0,
          color: textColor,
          fontFamily: 'kanit',
          fontStyle: FontStyle.italic),
    );
  }

  Widget showLogin() {
    return Text(
      'Login $nameLogin',
      style: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myDrawerHead(),
          signOutMenu(),
        ],
      ),
    );
  }

  Widget myDrawerHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        children: <Widget>[showLogo(), showName(), showLogin()],
      ),
    );
  }

  Widget signOutMenu() {
    return ListTile(
      leading: Icon(
        Icons.android,
        size: 36.0,
      ),
      title: Text("Sign Out"),
      onTap: () {
        signOutProcess();
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('My Body'),
      drawer: myDrawerMenu(),
    );
  }
}
