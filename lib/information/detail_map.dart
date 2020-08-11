import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Information.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';
import '../constant.dart';

class DetailPageMap extends StatelessWidget {
  static String baseUrl = TrainPallete.baseURL;
  static InformationStation map;
  static Api api = Api();

  DetailPageMap(InformationStation informationStation) {
    map = informationStation;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(map.namaDenah),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(flex: 1, child: _buildCarrousel(map.gambar)),
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
                            child: Text(map.deskripsi,
                                textAlign: TextAlign.justify),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }

  _buildCarrousel(String item) {
    var images = map.getImages(item);

    return CarouselSlider(
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 0.5),
                decoration: BoxDecoration(color: Colors.white60),
                child: Card(
                  elevation: 10,
                  child: PhotoView(
                      imageProvider: NetworkImage(baseUrl + 'images/denah/$i')),
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(height: 200.0));
  }
}
