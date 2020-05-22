
import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/launcher/launcher_view.dart';

void main() =>
    runApp(MyApp());  
  

class MyApp extends StatefulWidget {
  
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Stasiun Malang Kota',
      theme: new ThemeData(
        fontFamily: 'cyn',
        primaryColor: TrainPallete.blue,
        accentColor: TrainPallete.blue,
      ),
      home: LauncherPage()
    );
  }
}
