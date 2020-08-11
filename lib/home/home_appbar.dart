import 'package:flutter/material.dart';
// import 'package:flutter_app/constant.dart';

class TrainAppBar extends AppBar {
  TrainAppBar(String title)
      : super(
            elevation: 0.25,
            backgroundColor: Colors.white,
            flexibleSpace: _buildTrainAppBar(title));

  static Widget _buildTrainAppBar(String title) {
    return Container(
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0.8,
      ),
    );
  }
}
