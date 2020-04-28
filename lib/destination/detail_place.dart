import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/model/Place.dart';

class DetailPlace extends StatelessWidget {
  final Place place;
  DetailPlace({Key key, this.place}) : super(key: key);
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Container(
              height: 400,
              width: 400,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(1),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(double.parse(place.lat), double.parse(place.long)),
                  zoom: 18.0,
                ),
              ),
            )));
  }
}
