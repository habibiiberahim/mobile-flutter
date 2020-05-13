import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/destination/list_place.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/model/Destination.dart';
import 'package:flutter_app/service/Api.dart';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  static Api apiService;


  @override
  void initState() {
    super.initState();
    apiService = Api();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: TrainAppBar("Destinasi"),
      body: FutureBuilder(
        future: apiService.getDestinations(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Destination>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Destination> data = snapshot.data;
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

  Widget makeCard(Destination item) {
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
                Icons.place,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              item.categoryDestination,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListPlace(destination: item)));
            },
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    );
  }

  Widget createList(List<Destination> data) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            Destination item = data[index];
            return makeCard(item);
          },
        ));
  }
}
