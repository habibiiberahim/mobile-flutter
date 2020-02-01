import 'package:flutter/material.dart';
import 'package:flutter_app/home/feedback.dart';
import 'package:flutter_app/home/home_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: TrainAppBar("Beranda"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FeedbackPage()));
        },
        label: Text('Feedback'),
        icon: Icon(Icons.feedback),
      ),
    ));
  }
}
