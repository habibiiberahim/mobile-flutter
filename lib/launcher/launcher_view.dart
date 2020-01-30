import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/landing/landingpage_view.dart';
import 'package:flutter_app/constant.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 1);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new LandingPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TrainPallete.blueAccent,
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [TrainPallete.blue, TrainPallete.blueAccent],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                  height: 150,
                  width: 400,
                  color: Colors.white,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Stasiun Kota Malang'),
                    ],
                  ),
                )
              ],
            )));
  }
}
