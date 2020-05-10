import 'package:flutter/material.dart';
import 'package:flutter_app/model/Contact.dart';
import 'package:flutter_app/service/Api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class ListContact extends StatefulWidget {
  final String jenisKontak;
  static Contact contact;
  static Api apiService = Api();

  ListContact({Key key, this.jenisKontak});

  @override
  _Contacts createState() => _Contacts();
}

class _Contacts extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Kontak Darurat'),
      ),
      body: FutureBuilder(
          future: jenis(widget.jenisKontak),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Contact> data = snapshot.data;
              return createList(data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }

  Widget createList(List<Contact> data) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            Contact item = data[index];
            return makeCard(item);
          },
        ));
  }

  Widget makeCard(Contact item) {
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
              Icons.contacts,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            item.nama,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(
            item.nomor,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
          onTap: () {
            launch('tel: ' + item.nomor);
          },
        ),
      ),
    );
  }

  jenis(String key) {
    if (key == 'darurat') {
      return ListContact.apiService.getContactDarurat();
    } else {
      return ListContact.apiService.getContactPelanggan();
    }
  }
}
