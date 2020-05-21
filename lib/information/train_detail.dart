import 'package:flutter/material.dart';
import 'package:flutter_app/model/Kereta.dart';

class DetailTrain extends StatelessWidget {
  final Kereta kereta;
  const DetailTrain({Key key, this.kereta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(kereta.namaKereta),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 0.8,
                    child: Text(''),
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
                            child: Text(kereta.noKa),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}