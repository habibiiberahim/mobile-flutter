import 'package:flutter/material.dart';
import 'package:flutter_app/model/Information.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPageMap extends StatelessWidget {
  static String baseUrl = "";
  static InformationStation map;
  static Api api = Api();
  
  DetailPageMap(InformationStation informationStation){
    getData();
    map = informationStation;
    
  }


  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    baseUrl = prefs.getString('baseURL');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(map.namaDenah),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 0.8,
                    child: PhotoView(imageProvider: NetworkImage( 
                          baseUrl+'images/denah/'+map.gambar)),
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
                            child: Text(map.deskripsi),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}