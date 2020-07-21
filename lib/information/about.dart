import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Tentang"),
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
                              padding: EdgeInsets.all(10),
                              child: Tab(
                                icon: Container(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/icon_app.jpeg',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              )),
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
                                  TextSpan(text: 'FISCAL FIJAY SAKSENA'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Tab(
                                icon: Container(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/icon_univ.jpeg',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              )),
                        ],
                      ))),
            ],
          )),
    );
  }
}
