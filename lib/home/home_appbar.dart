import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
class TrainAppBar extends AppBar {
  TrainAppBar() : super(
    elevation: 0.25,
    backgroundColor: Colors.white,

    flexibleSpace:_buildTrainAppBar());

  static Widget _buildTrainAppBar(){
    return new Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  height: 28.0,
                  width: 28,
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                      color: TrainPallete.blueAccent),

                  alignment: Alignment.center,
                  child: new Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ],
            ),
          ),
          
//          new Container(
//             child: Text("Train"),
//          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  height: 28.0,
                  width: 28,
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                      color: TrainPallete.blueAccent),
                  alignment: Alignment.center,
                  child: new Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
//                new Container(
//                  padding: EdgeInsets.all(6.0),
//                  decoration: new BoxDecoration(
//                    borderRadius: new BorderRadius.all(new Radius.circular(5)),
//                    color: Color(0x50FFD180)),
//                  child: new Text(
//                    "1.781 poin",
//                    style: TextStyle(fontSize: 14.0),
//                  ),
//                )
              ],
            ),
          )
        ],
      ),
    );
  }
}