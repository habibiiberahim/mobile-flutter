import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/destination/map.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant.dart';

class DetailPlace extends StatelessWidget {
  static String baseUrl = TrainPallete.baseURL;
  static Api api = Api();
  static Place place;

  DetailPlace(Place item) {
    place = item;
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(place.placeName),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print(place.noTelp);
                    launch('tel: ' + place.noTelp);
                  },
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.place),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoogleMapPage(place: place)));
                }),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: Container(
                child: Column(
              children: <Widget>[
                Flexible(flex: 1, child: _buildCarrousel(place.gambar)),
                Flexible(flex: 1, child: _buildCard(place.deskripsi))
              ],
            ))));
  }

  _buildCard(String item) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 1.0),
          decoration: BoxDecoration(color: Colors.white60),
          child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(item, textAlign: TextAlign.justify),
              )),
        );
      },
    );
  }

  _buildCarrousel(String item) {
    var images = place.getImages(item);

    return CarouselSlider(
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 0.5, vertical: 1),
                decoration: BoxDecoration(color: Colors.white60),
                child: Card(
                  elevation: 10,
                  child: PhotoView(
                      imageProvider:
                          NetworkImage(baseUrl + 'images/destinasi/$i')),
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(height: 200.0));
  }
}
