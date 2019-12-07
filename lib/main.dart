import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/launcher/launcher_view.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stasiun Malang Kota',
      theme: new ThemeData(
        fontFamily:  'cyn' ,
        primaryColor: TrainPallete.blue,
        accentColor: TrainPallete.blue,

      ),

      home: new LauncherPage(),
    );
  }
}

