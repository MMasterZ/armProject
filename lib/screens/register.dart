import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  Color textColor = Colors.redAccent.shade700;
  final formKey = GlobalKey<FormState>();
  String name , email , password; 

  // Methods
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Register');

        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $name , email = $email , password = $password');
        }
      },
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
        helperText: "Type Name in English",
        helperStyle: TextStyle(
          color: Colors.blue,
        ),
        hintText: "FirstName",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[400],
        ),
      ),
      validator: (String value) {
        value = value.trim();
        if (value.isEmpty) {
          return '* กรุณากรอกข้อมูล';
        }
      },
      onSaved: (String value){
        name = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.blue,
        ),
        labelText: "Email :",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        helperText: "Type Email Format",
        helperStyle: TextStyle(
          color: Colors.blue,
        ),
        hintText: "you@abc.com",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[400],
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return '* กรุณากรอกข้อมูลอีเมลให้ครบถ้วน';
        }
      },
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.blue,
        ),
        labelText: "Email :",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        helperText: "Type Your Password",
        helperStyle: TextStyle(
          color: Colors.blue,
        ),
        hintText: "@gmail.com",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey[400],
        ),
      ),
      validator: (String value) {
        if (value.length < 6) {
          return "* รหัสผ่านต้องมากว่า 6 ตัวอักษร";
        }
      },
      onSaved: (String value){
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          registerButton(),
        ],
        backgroundColor: textColor,
        title: Text('Register'),
      ),
      body: Center(
        child: Container(
          child: Form(
            key: formKey,
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
      ),
    );
  }
}
