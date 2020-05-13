import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  final Place place;
  GoogleMapPage({Key key, this.place}) : super(key: key);

  _GoogleMapsPage createState() => _GoogleMapsPage();
}

class _GoogleMapsPage extends State<GoogleMapPage> {
  LocationData currentLocation;
  static LatLng latLng;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    // _onAddMarkerPlace();
    getLocation();
  }

  Completer<GoogleMapController> _controller = Completer();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.place.placeName),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: GoogleMap(
                      markers: _markers,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: latLng,
                        zoom: 18.0,
                      )))
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  getLocation() async {
    setState(() {
      latLng = LatLng(
          double.parse(widget.place.lat), double.parse(widget.place.long));
      _markers.add(Marker(
        infoWindow: InfoWindow(title: widget.place.placeName),
        markerId: MarkerId("111"),  
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
