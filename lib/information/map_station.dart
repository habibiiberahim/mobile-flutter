import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/information/detail_map.dart';

import 'package:flutter_app/model/Information.dart';
import 'package:flutter_app/service/Api.dart';

class MapStation extends StatelessWidget {
  static String baseUrl = TrainPallete.baseURL;
  final apiService = Api();

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Informasi Stasiun'),
      ),
      body: FutureBuilder(
        future: apiService.getInformation(),
        builder: (BuildContext context,
            AsyncSnapshot<List<InformationStation>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<InformationStation> data = snapshot.data;
            return createList(data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }

  Widget makeCard(BuildContext context, InformationStation item) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: TrainPallete.blue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white))),
              child: Icon(
                Icons.map,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              item.namaDenah.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPageMap(item)));
            },
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    );
  }

  Widget createList(List<InformationStation> data) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            InformationStation item = data[index];
            return makeCard(context, item);
          },
        ));
  }
}
