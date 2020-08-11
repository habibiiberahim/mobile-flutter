import 'package:flutter/material.dart';
import 'package:flutter_app/model/News.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';
import '../constant.dart';

class DetailPageNews extends StatelessWidget {
  static String baseUrl = TrainPallete.baseURL;
  static News news;
  static Api api = Api();

  DetailPageNews(News item) {
    news = item;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(news.judul),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 0.8,
                    child: PhotoView(
                        imageProvider: NetworkImage(
                            baseUrl + 'images/berita/' + news.gambar)),
                  )),
              Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                news.isi,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        )),
                  )),
            ],
          )),
    );
  }
}
