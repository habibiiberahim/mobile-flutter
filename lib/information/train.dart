import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/information/404Page.dart';
import 'package:flutter_app/information/train_detail.dart';
import 'package:flutter_app/model/Kereta.dart';
import 'package:flutter_app/model/Tipe.dart';
import 'package:flutter_app/service/Api.dart';
import '../constant.dart';

class InformationTrainPage extends StatefulWidget {
  final Tipe tipe;
  InformationTrainPage({Key key, @required this.tipe}) : super(key: key);

  @override
  _InformationPageState createState() => new _InformationPageState();
}

class _InformationPageState extends State<InformationTrainPage> {
  static Api apiService;

  @override
  void initState() {
    super.initState();
    apiService = Api();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: TrainAppBar(widget.tipe.jenisKereta.toUpperCase()),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: FutureBuilder(
          future: apiService.getKeretas(widget.tipe.id),
          builder:
              (BuildContext context, AsyncSnapshot<List<Kereta>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Kereta> data = snapshot.data;
              return _listKereta(data);
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

  static Widget _listKereta(List<Kereta> keretas) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: keretas.length,
      itemBuilder: (BuildContext context, int index) {
        Kereta item = keretas[index];
        return makeCardKereta(context, item);
      },
    ));
  }

  static Widget makeCardKereta(BuildContext context, Kereta item) => Card(
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
                item.namaKereta,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.white54,
                    size: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child:
                        Text(item.jam, style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              onTap: () {
                if (item.keterangan == "Normal") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailTrain(
                                item,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaintenancePage()));
                }
              },
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      );
}
