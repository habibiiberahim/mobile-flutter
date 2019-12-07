import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState () => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
          appBar: new TrainAppBar(),
          body: new Container(
            child: Center(
              child: Text('Home Page'),
            )
          ),
        )
    );
  }
}