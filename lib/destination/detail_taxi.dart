import 'package:flutter/material.dart';
import 'package:flutter_app/model/Taxi.dart';
// import 'package:photo_view/photo_view.dart';

class DetailPageTaxi extends StatelessWidget {
  final Taxi taxi;
  DetailPageTaxi({Key key, this.taxi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(taxi.taxiName),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              // Flexible(
              //     flex: 1,
              //     child: Card(
              //       elevation: 0.8,
              //       child: PhotoView(imageProvider: NetworkImage( 
              //            '')),
              //     )),
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
                            child: Text(taxi.taxiDesc),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
