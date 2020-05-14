import 'package:flutter/material.dart';
import 'package:flutter_app/model/News.dart';
import 'package:photo_view/photo_view.dart';

class DetailPageNews extends StatelessWidget {
  static String baseUrl = "http://192.168.43.13:8000";
  final News news;
  DetailPageNews({Key key, this.news}) : super(key: key);

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
                    child: PhotoView(imageProvider: NetworkImage( 
                          baseUrl+'/images/berita/'+news.gambar)),
                  )),
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
                            child: Text(news.isi),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
