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
                Selection information = Selection(0, coffeeType);
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
        body: Center(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 200, horizontal: 25),
              child: Container(
                height: 175,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0),
                    ),
                    border: Border.all(color: greyBlue, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Recommended",
                          key: Key("recommended-text"),
                          style: TextStyle(
                              fontFamily: 'Kollektif',
                              color: greyBlue,
                              fontSize: 18,
                              letterSpacing: 1)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                      child: Divider(
                        color: greyBlue,
                        height: 0,
                        thickness: 1,
                      ),
                    ),
                    Text(
                        "${(coffeeAmount).round()}g - $coffeeType ground coffee",
                        key: Key("coffeeAmount-text"),
                        style: TextStyle(
                            fontFamily: 'Kollektif',
                            color: greyBlue,
                            fontSize: 14,
                            letterSpacing: 1)),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 50),
                      child: Text("${(waterAmount).round()}g - water",
                          key: Key("waterAmount-text"),
                          style: TextStyle(
                              fontFamily: 'Kollektif',
                              color: greyBlue,
                              fontSize: 14,
                              letterSpacing: 1)),
                    ),
                    Text("Enjoy your delicious coffee",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: greyBlue,
                            fontSize: 10,
                            letterSpacing: 1,
                            fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
              child: Container(
                height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                child: FlatButton(
                  key: Key("done-btn"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseDeviceScreen()));
                  },
                  child: Text("Done",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: eggWhite,
                          fontSize: 14,
                          letterSpacing: 1)),
                  color: greyBlue,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0), width: 1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        )));
  }
}
