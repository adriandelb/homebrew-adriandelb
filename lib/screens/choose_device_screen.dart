import 'package:flutter/material.dart';
import 'package:homebrew/screens/enter_amount_screen.dart';
import 'package:homebrew/models/coffee_Info.dart';
import 'package:homebrew/constants.dart';


class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool _enable = false;
  bool active = false;
  bool active2 = false;
  String coffeeType;
  @override
  Widget build(BuildContext context) {
    //variable to have continue deactivated
    var _onPressed;
    //function to go to next screen if _enabled is true
    if (_enable) {
      _onPressed = () {
        Selection information = Selection(0, coffeeType);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WaterAmount(information)));
        setState(() {
          _enable = false;
          active = false;
          active2 = false;
        });
      };
    }
    return Scaffold(
      body: Center(
        child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 25, right: 25, bottom: 100),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "What coffee maker are you using?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat', color: greyBlue, fontSize: 18 ),
                key: Key('coffee-question-test'),
              ),
            ),
            Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                      bottomLeft: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0),
                    ),
                    border: Border.all(color: greyBlue, width: 2)),
                child: ListView(
                 shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      height: 48,
                      width: 500,
                      child: CheckboxListTile(
                        title: Text("French Press", style: TextStyle(fontFamily: 'Montserrat', color: greyBlue, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        key: Key('french-press-selector'),
                        value: active,
                        activeColor: Color(0),
                        checkColor: greyBlue,
                        onChanged: (bool value) {
                          setState(() {
                            if (!active2) {
                              _enable = value ? true : false;
                              active = value ? true : false;
                              coffeeType = "coarse";
                            } else {
                              coffeeType = "coarse";
                              active2 = false;
                              active = value ? true : false;
                              _enable = value ? true : false;
                            }
                          });
                        },
                      ),
                    ),
                    Divider(
                      color: greyBlue,
                      height: 0,
                      thickness: 1,
                    ),
                    Container(
                      height: 48,
                      width: 500,
                      child: CheckboxListTile(
                        title: Text("Drip Machine", style: TextStyle(fontFamily: 'Montserrat', color: greyBlue, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        key: Key('drip-press-selector'),
                        value: active2,
                        activeColor: Color(0),
                        checkColor: greyBlue,
                        onChanged: (bool value) {
                          setState(() {
                            if (!active) {
                              _enable = value ? true : false;
                              active2 = value ? true : false;
                              coffeeType = "medium";
                            } else {
                              coffeeType = "medium";
                              active = false;
                              active2 = value ? true : false;
                              _enable = value ? true : false;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FlatButton(
                    key: Key('continue-btn'),
                    disabledColor: litGrey,
                    disabledTextColor: drkGrey,
                    color: greyBlue,
                    textColor: eggWhite,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0),
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: _onPressed,
                    child: Text("Continue", style: TextStyle(
                                fontFamily: 'Montserrat',
                            
                                fontSize: 14,
                                letterSpacing: 2)),
                  ),
                ))
          ],
        ),
      )),
    );
    
  } 
}
