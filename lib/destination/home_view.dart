import 'package:flutter/material.dart';
import 'package:flutter_app/home/feedback.dart';
import 'package:flutter_app/home/home_appbar.dart';
import 'package:flutter_app/home/news_detail.dart';
import 'package:flutter_app/model/News.dart';
import 'package:flutter_app/service/Api.dart';

import '../constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Api apiService;

  @override
  void initState() {
    super.initState();
    apiService = Api();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: TrainAppBar("Berita Terbaru"),
      body: FutureBuilder(
          future: apiService.getNews(),
          builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<News> data = snapshot.data;
              return createList(data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.feedback),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedbackPage()));
          }),
    ));
  }

  Widget createList(List<News> data) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            News item = data[index];
            return makeCard(item);
          },
        ));
  }

  Widget makeCard(News item) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: TrainPallete.blue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white))),
            child: Icon(
              Icons.library_books,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            item.judul,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPageNews(item)));
          },
        ),
      ),
    );
  }
}
