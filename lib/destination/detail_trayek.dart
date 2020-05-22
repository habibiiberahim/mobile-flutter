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
              Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 0.8,
                    child: PhotoView(
                        imageProvider: NetworkImage(
                            baseUrl + 'images/trayek/' + trayek.trayekSlug)),
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
                            child: Text(trayek.trayekDesc),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
