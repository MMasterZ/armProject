import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        onPressed: () {},
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
