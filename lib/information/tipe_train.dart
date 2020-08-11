import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/information/train.dart';
import 'package:flutter_app/model/Tipe.dart';
import 'package:flutter_app/service/Api.dart';

import '../constant.dart';

class TypeTrain extends StatelessWidget {
  static Api apiService = Api();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: TrainAppBar("Jenis Kereta"),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: FutureBuilder(
          future: apiService.getTipes(),
          builder: (BuildContext context, AsyncSnapshot<List<Tipe>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Tipe> data = snapshot.data;
              return _list(data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ));
  }

  static Widget _list(List<Tipe> items) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Tipe item = items[index];
        return makeCardKereta(context, item);
      },
    ));
  }

  static Widget makeCardKereta(BuildContext context, Tipe item) => Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [TrainPallete.blue, TrainPallete.blueAccent],
              ),
              // color: TrainPallete.blue,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white))),
                child: Icon(
                  Icons.train,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              title: Text(
                item.jenisKereta,
                style:
                    TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InformationTrainPage(tipe: item,)));
              },
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      );
}
