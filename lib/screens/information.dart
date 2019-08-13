import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Information",
        style: TextStyle(
          fontSize: 36.0,
        ),
      ),
    );
  }
}
