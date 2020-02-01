import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: Container(
                    width: 600,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: .0,
                      color: TrainPallete.blueAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "FEEDBACK.",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text(
                            "Terima kasih telah membantu kami",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: "Nama ",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: "Email ",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 10.0),
                          labelText: "Pesan ",
                          prefixIcon: Icon(Icons.message),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Send'),
          onPressed: () => {},
          icon: Icon(Icons.send),
        ),
      ),
    );
  }
}
