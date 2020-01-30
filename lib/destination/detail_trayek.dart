import 'package:flutter/material.dart';
import 'package:flutter_app/model/Trayek.dart';

class DetailPage extends StatelessWidget {
  final Trayek trayek;
  DetailPage({Key key, this.trayek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(trayek.trayekName),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: Card(
                    elevation: 0.8,
                    child: Image(
                      frameBuilder: (BuildContext context, Widget child,
                          int frame, bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedOpacity(
                          child: child,
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                        );
                      },
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Card(
                      color: Colors.white,
                     
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(trayek.trayekDesc),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
