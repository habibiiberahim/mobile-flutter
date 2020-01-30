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
          style: TextStyle(
            fontSize: 20
          ),
        ),
        centerTitle: true,
        elevation: 0.8,
      ),
    );

    // return Container(
    //   padding: EdgeInsets.all(10),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Container(
    //         child: Row(
    //           children: <Widget>[
    //             Container(
    //               height: 28.0,
    //               width: 28,
    //               padding: EdgeInsets.all(6),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.all(Radius.circular(100.0)),
    //                   color: TrainPallete.blueAccent),
    //               alignment: Alignment.center,
    //               child: Icon(
    //                 Icons.person,
    //                 color: Colors.white,
    //                 size: 16.0,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Center(
    //         child: Text(title),
    //       ),
    //       Container(
    //         child: Row(
    //           children: <Widget>[
    //             Container(
    //               height: 28.0,
    //               width: 28,
    //               padding: EdgeInsets.all(6),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.all(Radius.circular(50.0)),
    //                   color: TrainPallete.blueAccent),
    //               alignment: Alignment.center,
    //               child: Icon(
    //                 Icons.help_outline,
    //                 color: Colors.white,
    //                 size: 16.0,
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
