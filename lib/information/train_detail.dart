import 'package:flutter/material.dart';
import 'package:flutter_app/model/Kereta.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';
import '../constant.dart';

class DetailTrain extends StatelessWidget {
  static String baseUrl = TrainPallete.baseURL;
  static Api api = Api();
  static Kereta kereta;

  DetailTrain(Kereta item) {
    kereta = item;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(kereta.namaKereta),
              centerTitle: true,
            ),
            body: _buildDetailCard(context)));
  }

  _buildDetailCard(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: ListTile(
                      title: Text("Nama Kereta"),
                      subtitle: Text(kereta.namaKereta),
                    )),
                Flexible(
                    flex: 1,
                    child: ListTile(
                      title: Text("Nomor Kereta Api"),
                      subtitle: Text(kereta.noKa),
                    )),
                Flexible(
                    flex: 1,
                    child: ListTile(
                      title: Text("Jam Keberangkatan"),
                      subtitle: Text(kereta.jam),
                    )),
                Flexible(
                    flex: 1,
                    child: ListTile(
                      title: Text("Kelas Kereta"),
                      subtitle: Text(kereta.kelaska),
                    )),
                Flexible(
                    flex: 1,
                    child: ListTile(
                      title: Text("Relasi"),
                      subtitle: Text(kereta.relasi),
                    )),
                Flexible(
                    flex: 1,
                    child: ListTile(
                      title: Text("Jalur"),
                      subtitle: Text(kereta.jalurId),
                    )),
                Flexible(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text("Letak Kereta"),
                        subtitle: Container(
                          color: Colors.black26,
                          height: 250,
                          width: 40,
                          child: PhotoView(
                              imageProvider: NetworkImage(baseUrl +
                                  'images/keretainfo/' +
                                  kereta.gambarJalur)),
                        ),
                      ),
                    )),
                Flexible(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text("Stasiun Pemberhentian"),
                        subtitle: Container(
                          color: Colors.black26,
                          height: 180,
                          width: 20,
                          child: PhotoView(
                              imageProvider: NetworkImage(baseUrl +
                                  'images/keretainfo/' +
                                  kereta.progresStasiun)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
