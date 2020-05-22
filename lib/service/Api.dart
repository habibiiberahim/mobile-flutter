import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/model/Contact.dart';
import 'package:flutter_app/model/Destination.dart';
import 'package:flutter_app/model/Feedbacks.dart';
import 'package:flutter_app/model/Information.dart';
import 'package:flutter_app/model/Kereta.dart';
import 'package:flutter_app/model/News.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:flutter_app/model/Tipe.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:flutter_app/model/Taxi.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_app/constant.dart';


class Api {
  static String baseUrl = TrainPallete.baseURL;
  Client client = Client();

  Future<List<Trayek>> getTrayeks() async {
    final response = await client.get(baseUrl + "api/trayek");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Trayek().trayeksFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Taxi>> getTaxis() async {
    final response = await client.get(baseUrl + "api/taxi");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Taxi().taxisFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Destination>> getDestinations() async {
    final response = await client.get(baseUrl + "api/kategori");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Destination().destinationFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Place>> getPlaces(String key) async {
    final response = await client.get(baseUrl + "api/subkategori/" + key);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);

      return Place().placesFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<News>> getNews() async {
    final response = await client.get(baseUrl + "api/berita");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);

      return News().newsFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Contact>> getContactPelanggan() async {
    final response = await client.get(baseUrl + "api/kontak/1");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data = data['result'];
      var rest = jsonEncode(data['pelanggan']);

      return Contact().contactsFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Contact>> getContactDarurat() async {
    final response = await client.get(baseUrl + "api/kontak/1");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data = data['result'];
      var rest = jsonEncode(data['darurat']);

      return Contact().contactsFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Kereta>> getKeretas(int jenis) async {
    final response = await client.get(baseUrl + "api/keretainfo/"+jenis.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Kereta().keretasFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<InformationStation>> getInformation() async {
    final response = await client.get(baseUrl + "api/stasiuninfo");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var temp = data['result'];
      var rest = jsonEncode(temp);

      return InformationStation().informationFromJson(rest);
    } else {
      return null;
    }
  }

  Future<bool> createFeedback(Feedbacks data) async {
    
    final response = await client.post(
      "$baseUrl/api/feedback",
      headers: {"content-type": "application/json"},
      body: feedbackToJson(data),
    );
    var code = jsonDecode(response.body);
    var temp = code['status'];
    if (temp == 'OK') {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Tipe>> getTipes() async {
    final response = await client.get(baseUrl + "api/keretainfo/jenis");
     print(response);
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
     
      return Tipe().tipesFromJson(rest);
    } else {
      return null;
    }
  }

}
