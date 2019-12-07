import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/constant.dart';



class TransportationPage extends StatefulWidget {
  @override
  _TransportationPageState createState () => new _TransportationPageState();
}

class _TransportationPageState extends State<TransportationPage> {

  int currentIndex = 2 ;
  List<Widget> _container = [
    _submenuTaksi(),
    _submenuOnline(),
    _submenuAngkot(),
  ];


  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
          appBar: new TrainAppBar(),
          body: new Container(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                new Container(
                  padding:EdgeInsets.only(left: 16,right: 16,top: 10) ,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _buildSubMenu()
                    ],
                  ) ,
                ),
                new Container(
                  padding:EdgeInsets.only(left: 16,right: 16,top: 10) ,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _container [ currentIndex ]
                    ],
                  ) ,
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _buildSubMenu() {
    return new Container(
        height: 140,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [TrainPallete.blue, TrainPallete.blueAccent],
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(9.0)),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(12),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [TrainPallete.blue, TrainPallete.blueAccent],
                  ),
                  borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(9.0),
                      topRight: new Radius.circular(9.0))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Transportasi yang tersedia",
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),

                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 32, right: 32, top: 12),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon:new Icon(
                          Icons.airport_shuttle,
                          color: Colors.white70,
                        ),
                        onPressed: null,
                        iconSize: 40,
                        tooltip: 'Angkutan Kota',
                      ),
                      new Text(
                        'Angkot',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),

                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon:new Icon(
                          Icons.local_taxi,
                          color: Colors.white70,
                        ),
                        onPressed:(){
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        iconSize: 40,
                        tooltip: 'Angkutan Kota',
                      ),
                      new Text(
                        'Taksi',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),

                      )

                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon:new Icon(
                          Icons.motorcycle,
                          color: Colors.white70,
                        ),
                        onPressed: null,
                        tooltip: 'Angkutan Kota',
                        iconSize: 40,
                      ),
                      new Text(
                        'Online',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),

                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  static Widget _submenuAngkot(){
    return new Container(
      height: 400,
      decoration: new BoxDecoration(
          color: TrainPallete.blue,
          borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:10,right: 10,top: 10.0),
            child: Container(
              height: 60,
              decoration: new BoxDecoration(
                  color:Colors.white70,
                  borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.airport_shuttle,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Jalur"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: Text("Tarif"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _submenuOnline(){
    return new Container(
      height: 400,

      decoration: new BoxDecoration(
          color: TrainPallete.blue,
          borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:10,right: 10,top: 10.0),
            child: Container(
              height: 60,
              decoration: new BoxDecoration(
                  color:Colors.white70,
                  borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.motorcycle,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Grab"),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left:10,right: 10,top: 10.0),
            child: Container(
              height: 60,
              decoration: new BoxDecoration(
                  color:Colors.white70,
                  borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.motorcycle,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Gojek"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _submenuTaksi(){
    return new Container(
      height: 400,
      decoration: new BoxDecoration(
          color: TrainPallete.blue,
          borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:10,right: 10,top: 10.0),
            child: Container(
              height: 60,
              decoration: new BoxDecoration(
                  color:Colors.white70,
                  borderRadius: new BorderRadius.all(new  Radius.circular(9.0))
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.local_taxi,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Nama Taksi"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: Text("Tarif"),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}
