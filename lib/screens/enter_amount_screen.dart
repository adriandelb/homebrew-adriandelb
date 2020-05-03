import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrew/constants.dart';
import 'package:homebrew/models/coffee_Info.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/screens/recommend_Screen.dart';

class WaterAmount extends StatefulWidget {
  Selection information;
  WaterAmount(this.information);

  @override
  _WaterAmountState createState() => _WaterAmountState();
}

class _WaterAmountState extends State<WaterAmount> {
  final _text = TextEditingController();
  bool enable = false;
  int cups;

  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    // Start listening to changes.
    _text.addListener(_printLatestValue);
  }

  _printLatestValue() {
    if (_text.text.isEmpty) {
      enable = false;
      setState(() {});
    } else {
      int i = _text.text.length - 1;
      if(_text.text[i] != "0" || _text.text[0] != "0" )
      {
      enable = true;
      setState(() {});
      }
      else{
      enable = false;
      setState(() {});
      }
    }
  }

  Widget build(BuildContext context) {
    var _onPressed;
    if (enable) {
      _onPressed = () {
        {
          cups = int.parse(_text.text);
          Selection information =
              Selection(cups, widget.information.coffeeType);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecommendationScreen(information)));
          setState(() {});
          _text.clear();
        }
      };
    } else {
      _onPressed = null;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      //top appbar where arrow is placed
      appBar: AppBar(
        leading: BackButton(
            color: greyBlue,
            key: Key('back-btn'),
            onPressed: () {
              //on press goes to previous screen
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChooseDeviceScreen()));
              setState(() {});
            }),
        //color of the appbar
        backgroundColor: Colors.transparent,
        //removes shadow
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      //main body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Main text question
          Text(
            "How many cups would you like?",
            key: Key('amountTitle-text'),
          ),
          //number textfield
          TextField(
              controller: _text,
              key: Key("cups-textfield"),
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                BlacklistingTextInputFormatter.singleLineFormatter
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              )),
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
