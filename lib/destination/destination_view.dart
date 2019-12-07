import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/constant.dart';


class DestinationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
        appBar: new TrainAppBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                   return listitem(Colors.blue, "Nama Destinasi");
                },
              childCount: 8),
            )
          ],
        )
      )
    );
  }

  Widget listitem(Color color, String title) => Container(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: Container(
      decoration: new BoxDecoration(
          boxShadow: [new BoxShadow(
            color: Colors.black12,
            offset: new Offset(10.0, 10.0),
          )],
          color: TrainPallete.blue,
          borderRadius: new BorderRadius.all(new  Radius.circular(9.0))

      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      new Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
            icon:new Icon(
              Icons.place,
              color: Colors.white70,
            ),
            onPressed: null,
            iconSize: 80,
            tooltip: 'Angkutan Kota',
          ),
          new Text(
            '$title',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
        ]
      )
    )


  );
}




