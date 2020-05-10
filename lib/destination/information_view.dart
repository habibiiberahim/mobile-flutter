import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/information/contact.dart';
import 'package:flutter_app/information/evacuation_way.dart';
import 'package:flutter_app/information/map_station.dart';
import 'package:flutter_app/information/procedure.dart';
import 'package:flutter_app/information/train.dart';

import '../constant.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => new _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: TrainAppBar("Information"),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                TrainPallete.blue,
                                TrainPallete.blueAccent
                              ],
                            ),
                            // color: TrainPallete.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.map,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Denah Stasiun",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapStation()));
                          },
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                TrainPallete.blue,
                                TrainPallete.blueAccent
                              ],
                            ),
                            // color: TrainPallete.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Informasi Kereta",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InformationTrainPage()));},
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                TrainPallete.blue,
                                TrainPallete.blueAccent
                              ],
                            ),
                            // color: TrainPallete.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.streetview,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Jalur Evakuasi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Evacuation()));
                          },
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                TrainPallete.blue,
                                TrainPallete.blueAccent
                              ],
                            ),
                            // color: TrainPallete.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.add_alert,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Prosedur Evakuasi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Procedure()));
                          },
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                TrainPallete.blue,
                                TrainPallete.blueAccent
                              ],
                            ),
                            // color: TrainPallete.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Kontak Darurat",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListContact(jenisKontak: "darurat")));
                          },
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                TrainPallete.blue,
                                TrainPallete.blueAccent
                              ],
                            ),
                            // color: TrainPallete.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Kontak Pelanggan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListContact(jenisKontak: "pelanggan")));
                          },
                        ),
                      ),
                    )),
              ],
            )));
  }
}
