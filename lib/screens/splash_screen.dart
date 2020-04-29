import 'package:flutter/material.dart';
import 'dart:async';

import 'package:homebrew/screens/choose_device_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, navigateToDeviceScreen);
  }
  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "HOMEBREW",
          ),
          Text(
            "Great Coffee at Home",
          )
        ],
      )),
    );
  }
}