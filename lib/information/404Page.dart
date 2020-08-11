import 'package:flutter/material.dart';


class MaintenancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Tidak Normal"),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.error,
                              color: Colors.redAccent,
                              size: 100,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                color: Colors.white),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Mohon maaf untukk saat ini keadaan kereta sedang tidak normal sehingga belum dapat menampilkan informasi'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
