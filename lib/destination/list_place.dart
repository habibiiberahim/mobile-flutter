
import 'package:flutter/material.dart';
import 'package:flutter_app/destination/detail_place.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:flutter_app/model/Destination.dart';
import 'package:flutter_app/service/Api.dart';
import '../constant.dart';

class ListPlace extends StatefulWidget {
  Destination destination;
  ListPlace({Key key, this.destination}) : super(key: key);
  static Api apiService = Api();

  @override
  _ListPlaceState createState() => _ListPlaceState();
}

class _ListPlaceState extends State<ListPlace> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.categoryDestination.toString()),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ListPlace.apiService.getPlaces(widget.destination.id.toString()),
        builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Place> data = snapshot.data;
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

  Widget createList(List<Place> data) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            Place item = data[index];
            return makeCard(context, item);
          },
        ));
  }

  Widget makeCard(BuildContext context, item) {
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
              item.placeName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPlace(place: item,)));
            },
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    );
  }
}
