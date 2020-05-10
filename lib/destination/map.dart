import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: GoogleMap(initialCameraPosition: CameraPosition(
             target: LatLng(45.521563, -122.677433),
            zoom: 11.0,
          ))
              )
            ],
          ),
        ),
      ),
    );
  }
}
