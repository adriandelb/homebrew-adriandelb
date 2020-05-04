import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:homebrew/screens/choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "HOMEBREW",
            key: Key('homebrew-text'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Norwester',
                fontSize: 48,
                letterSpacing: 1),
          ),

          Text(
            "Great Coffee at Home",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kollektif',
                fontSize: 18,
                letterSpacing: 1),
          )
        ],
      )),
      backgroundColor: Color.fromRGBO(76, 116, 139, 100),
    );
  }
}
