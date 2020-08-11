import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';

import '../constant.dart';

class DetailPage extends StatelessWidget {
  static String baseUrl = TrainPallete.baseURL;
  static Trayek trayek;
  static Api api = Api();

  DetailPage(Trayek item) {
    trayek = item;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(trayek.trayekName),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(flex: 1, child: _buildCarrousel(trayek.trayekSlug)),
              Flexible(
                  flex: 1,
                  child: Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              trayek.trayekDesc,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }

  _buildCarrousel(String item) {
    var images = trayek.getImages(item);

    return CarouselSlider(
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.white60),
                child: Card(
                  elevation: 10,
                  child: PhotoView(
                      imageProvider:
                          NetworkImage(baseUrl + 'images/trayek/$i')),
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 250,
        ));
  }
}
