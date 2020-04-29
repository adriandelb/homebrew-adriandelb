import 'package:flutter/material.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homebrew"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "What coffee maker are you using?",
          )
        ],
      ),
    );
  }
}