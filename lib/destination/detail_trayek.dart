import 'package:flutter/material.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:photo_view/photo_view.dart';

class DetailPage extends StatelessWidget {
  final Trayek trayek;
  DetailPage({Key key, this.trayek}) : super(key: key);

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
                    child: PhotoView(imageProvider: NetworkImage( 
                          'http://192.168.1.17:8000/images/trayek/'+trayek.trayekSlug)),
                  )),
              Flexible(
                  flex: 2,
                  child: Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(trayek.trayekDesc),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
