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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/icon_app.png",
                        height: 250,
                        width: 600,
                        color: Colors.white,
                      ),
                    ),
                    makeCard(context, "Malang Kota Baru", LandingPage()),
                    makeCard(context, "Coming Soon", null),
                    makeCard(context, "Coming Soon", null)
                  ],
                ))));
  }
}

Widget makeCard(BuildContext context, String name, Widget page) {
  return Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9.0))),
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(
                        width: 1.0, color: TrainPallete.blueAccent))),
            child: Icon(
              Icons.train,
              color: TrainPallete.blueAccent,
              size: 30,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
                color: TrainPallete.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          onTap: () {
            if (page != null) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => page));
            } else {}
          },
          trailing: Icon(Icons.keyboard_arrow_right,
              color: TrainPallete.blueAccent, size: 30.0)),
    ),
  );
}
