import 'package:flutter/material.dart';
import 'package:homebrew/constants.dart';
import 'package:homebrew/screens/enter_amount_screen.dart';
import 'package:homebrew/models/coffee_Info.dart';
import 'package:homebrew/screens/choose_device_screen.dart';

class RecommendationScreen extends StatefulWidget {
  Selection information;
  RecommendationScreen(this.information);

  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    String coffeeType = widget.information.coffeeType;
    double waterAmount = widget.information.numCups * 236.56;
    double coffeeAmount;

    if (coffeeType == "coarse") {
      coffeeAmount = waterAmount / 14.0;
    } else {
      coffeeAmount = waterAmount / 17.0;
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: greyBlue,
            key: Key('back-btn'),
            onPressed: () {
              //on press goes to previous screen
              Selection information = Selection(0,coffeeType);
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WaterAmount(information)));
            }),
        //color of the appbar
        backgroundColor: Colors.transparent,
        //removes shadow
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Text("Recommended", key: Key("recommended-text")),
          Text("${(coffeeAmount).round()}g - $coffeeType ground coffee", key: Key("coffeeAmount-text")),
          Text("${(waterAmount).round()}g - water",  key: Key("waterAmount-text")),
          FlatButton(
            key: Key("done-btn"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChooseDeviceScreen()));
            },
            child: Text("Done"),
          )
        ],
      ),
    );
  }
}
