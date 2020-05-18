import 'package:flutter/material.dart';
import 'package:flutter_app/model/Information.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Procedure extends StatelessWidget {
  static String baseUrl = "";
  final apiservice = Api();

  Procedure(){
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    baseUrl = prefs.getString('baseURL');
    print(baseUrl);
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Prosedur Evakuasi'),
      ),
      body: FutureBuilder(
        future: apiservice.getInformation(),
        builder:
            (BuildContext context, AsyncSnapshot<InformatonStation> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            InformatonStation data = snapshot.data;
            return _showPhoto(data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }

  _showPhoto(InformatonStation data) {
    return Container(
      child: PhotoView(
          imageProvider:
              NetworkImage(baseUrl + '/images/denah/' + data.prosedurEvakuasi)),
    );
  }
}
