import 'package:flutter/material.dart';
import 'package:flutter_app/destination/detail_taxi.dart';
import 'package:flutter_app/destination/detail_trayek.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/model/Taxi.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';

class TransportationPage extends StatefulWidget {
  @override
  _TransportationPageState createState() => _TransportationPageState();
}

class _TransportationPageState extends State<TransportationPage> {
  static List<Map<String, String>> installedApps;
  static Api apiService;
  static List<Trayek> list;
  static List<Taxi> taxis;
  @override
  void initState() {
    super.initState();
    apiService = Api();
  }

  static int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _container = [
      menuAngkot(context),
      menuTaksi(context),
      menuOnline(context)
    ];

    return SafeArea(
        child: Scaffold(
      appBar: TrainAppBar("Transportasi"),
      body: Column(
        children: <Widget>[
          Flexible(flex: 1, child: _buildSubMenu()),
          _container[_currentIndex]
        ],
      ),
    ));
  }

  static Widget menuOnline(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: RaisedButton(
              elevation: 0.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.motorcycle,
                      color: Colors.green,
                      size: 75.0,
                    ),
                    Text("Grab", style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              onPressed: () {
                AppAvailability.launchApp('com.grabtaxi.passenger');
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              elevation: 0.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.motorcycle,
                      color: Colors.green,
                      size: 75.0,
                    ),
                    Text("Gojek", style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              onPressed: () {
                AppAvailability.launchApp('com.gojek.app');
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget menuTaksi(BuildContext context) {
    return Flexible(
      flex: 3,
      child: FutureBuilder(
        // get list taksi
        future: apiService.getTaxis(),
        builder: (BuildContext context, AsyncSnapshot<List<Taxi>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Taxi> data = snapshot.data;
            return _submenuTaksi(data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  static Widget menuAngkot(BuildContext context) {
    return Flexible(
      flex: 3,
      child: FutureBuilder(
        future: apiService.getTrayeks(),
        builder: (BuildContext context, AsyncSnapshot<List<Trayek>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Trayek> data = snapshot.data;
            return _submenuAngkot(data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildSubMenu() {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [TrainPallete.blue, TrainPallete.blueAccent],
          ),
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: new Offset(2.0, 3.0),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [TrainPallete.blue, TrainPallete.blueAccent],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9.0),
                      topRight: Radius.circular(9.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text(
                  //   "Transportasi yang tersedia",
                  //   style: TextStyle(fontSize: 16.0, color: Colors.white),
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 32, right: 32, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.airport_shuttle,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        iconSize: 40,
                        tooltip: 'Angkutan Kota',
                      ),
                      Text(
                        'Angkot',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.local_taxi,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        iconSize: 40,
                        tooltip: 'Taksi',
                      ),
                      Text(
                        'Taksi',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.motorcycle,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        tooltip: 'online',
                        iconSize: 40,
                      ),
                      Text(
                        'Online',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  static Widget _submenuAngkot(List<Trayek> trayeks) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: trayeks.length,
      itemBuilder: (BuildContext context, int index) {
        Trayek item = trayeks[index];
        return makeCardTrayek(context, item);
      },
    ));
  }

  static Widget _submenuTaksi(List<Taxi> taxis) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: taxis.length,
      itemBuilder: (BuildContext context, int index) {
        Taxi item = taxis[index];
        return makeCardTaxi(context, item);
      },
    ));
  }

  static Widget makeCardTrayek(BuildContext context, Trayek item) => Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [TrainPallete.blue, TrainPallete.blueAccent],
              ),
              // color: TrainPallete.blue,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white))),
                child: Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              title: Text(
                item.trayekName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Icon(
                    Icons.monetization_on,
                    color: Colors.white54,
                    size: 15,
                  ),
                  Text(item.trayekPrice, style: TextStyle(color: Colors.white))
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(trayek: item)));
              },
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      );

  static Widget makeCardTaxi(BuildContext context, Taxi item) => Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [TrainPallete.blue, TrainPallete.blueAccent],
              ),
              // color: TrainPallete.blue,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white))),
                child: Icon(
                  Icons.local_taxi,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              title: Text(
                item.taxiName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Icon(
                    Icons.monetization_on,
                    color: Colors.white54,
                    size: 15,
                  ),
                  Text(item.taxiPrice, style: TextStyle(color: Colors.white))
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPageTaxi(taxi: item)));
              },
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      );
}
