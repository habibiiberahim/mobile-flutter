import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/destination/map.dart';
import 'package:flutter_app/model/Place.dart';

class DetailPlace extends StatelessWidget {
  final Place place;
  DetailPlace({Key key, this.place}) : super(key: key);
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(place.placeName)),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.map), onPressed: (){
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GoogleMapPage()));
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        child: CarouselSlider(
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.white60),
                    child: Text(
                      ' $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(height: 350.0)),
      )
    ));
  }
}
