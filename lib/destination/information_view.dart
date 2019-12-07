import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/constant.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState () => new _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
          appBar: new TrainAppBar(),
          body: new Container(
            child: Center(
              child: Text("Station Information Page"),
            ),
          ),
        )
    );
  }
}