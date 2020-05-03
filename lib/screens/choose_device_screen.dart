import 'package:flutter/material.dart';
import 'package:homebrew/screens/enter_amount_screen.dart';
import 'package:homebrew/models/coffee_Info.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() =>  _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool _enable = false;
  String coffeeType;
  @override
  Widget build(BuildContext context) {
    //variable to have continue deactivated
    var _onPressed;
    //function to go to next screen if _enabled is true
    if (_enable) {
      _onPressed = () {
        Selection information = Selection(0,coffeeType);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WaterAmount(information)));
        setState(() {_enable = false;});
        
      };
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "What coffee maker are you using?",
            key: Key('coffee-question-test'),
          ),
          //drip coffee button
          FlatButton(
            key: Key('french-press-selector'),
            child: Text("French Press"),
            onPressed: () {
              _enable = true;
              coffeeType = "coarse";
              setState(() {});
            },
          ),
          FlatButton(
              key: Key('drip-press-selector'),
              child: Text("Drip Press"),
              onPressed: () {
                _enable = true;
                coffeeType = "medium";
                setState(() {});
              }),
          FlatButton(
            key: Key('continue-btn'),
            onPressed: _onPressed,
            child: Text("Continue"),
          )
        ],
      ),
    );
  }
}
