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
          body: Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "assets/about.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          )),
    );
  }
}
