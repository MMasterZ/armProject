import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  Color textColor = Colors.redAccent.shade700;

  // Methods
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.blue,
        ),
        labelText: "Display Name :",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        helperText: "* Type Name in English",
        helperStyle: TextStyle(
          color: Colors.red,
        ),
        hintText: "FirstName",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.green,
        ),
        labelText: "Email :",
        labelStyle: TextStyle(
          color: Colors.green,
        ),
        helperText: "* Type Email Format",
        helperStyle: TextStyle(
          color: Colors.red,
        ),
        hintText: "you@abc.com",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.orange,
        ),
        labelText: "Email :",
        labelStyle: TextStyle(
          color: Colors.orange,
        ),
        helperText: "* Type Your Password",
        helperStyle: TextStyle(
          color: Colors.red,
        ),
        hintText: "@gmail.com",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          registerButton(),
          registerButton(),
        ],
        backgroundColor: textColor,
        title: Text('Register'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.white, Colors.red.shade100],
                radius: 2,
                center: Alignment.topCenter),
          ),
          child: ListView(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
