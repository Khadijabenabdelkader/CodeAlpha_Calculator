import 'package:flutter/material.dart';

class ClavierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Clavier(),
    );
  }
}

class Clavier extends StatefulWidget {
  @override
  _ClavierState createState() => _ClavierState();
}

class _ClavierState extends State<Clavier> {
  String displayval = '';

  Widget valeurs(String btnval, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onPressedButton(btnval);
        },
        child: Text(
          btnval,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget iconValeurs(IconData icon, Color btncolor, Color iconColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onPressedIcon(icon);
        },
        child: Icon(
          icon,
          color: iconColor,
          size: 35,
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  void onPressedButton(String btnval) {
    setState(() {
      displayval += btnval;
    });
  }

  void onPressedIcon(IconData icon) {
    if (icon == Icons.auto_delete) {
      setState(() {
        if (displayval.isNotEmpty) {
          displayval = displayval.substring(0, displayval.length - 1);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        displayval,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 100),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    valeurs('1', Colors.grey, Colors.black),
                    valeurs('2', Colors.grey, Colors.black),
                    valeurs('3', Colors.grey, Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    valeurs('4', Colors.grey, Colors.black),
                    valeurs('5', Colors.grey, Colors.black),
                    valeurs('6', Colors.grey, Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    valeurs('7', Colors.grey, Colors.black),
                    valeurs('8', Colors.grey, Colors.black),
                    valeurs('9', Colors.grey, Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    valeurs('*', Colors.grey, Colors.black),
                    valeurs('0', Colors.grey, Colors.black),
                    valeurs('#', Colors.grey, Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    valeurs('', Colors.white, Colors.white),
                    iconValeurs(Icons.phone, Colors.green, Colors.white),
                    iconValeurs(Icons.auto_delete, Colors.grey, Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
