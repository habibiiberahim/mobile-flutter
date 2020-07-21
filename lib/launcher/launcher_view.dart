import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 30, color: TrainPallete.blueAccent),
                          children: <TextSpan>[
                            TextSpan(text: 'Passenger Information Center'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 100),
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 150,
                        width: 400,
                        color: Colors.white,
                      ),
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 30, color: TrainPallete.blueAccent),
                          children: <TextSpan>[
                            TextSpan(text: 'Stasiun Malang Kota Baru'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.white
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 30, color: TrainPallete.blueAccent),
                          children: <TextSpan>[
                            TextSpan(text: 'Coming Soon'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.white
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 30, color: TrainPallete.blueAccent),
                          children: <TextSpan>[
                            TextSpan(text: 'Coming Soon'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
