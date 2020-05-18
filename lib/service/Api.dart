import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/model/Contact.dart';
import 'package:flutter_app/model/Destination.dart';
import 'package:flutter_app/model/Feedbacks.dart';
import 'package:flutter_app/model/Information.dart';
import 'package:flutter_app/model/Kereta.dart';
import 'package:flutter_app/model/News.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:flutter_app/model/Taxi.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static String baseUrl = "http://maucobain.com/";
  Client client = Client();

  Api() {
    setPref();
  }

  setPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('baseURL', baseUrl);
  }

  

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

  Future<List<Kereta>> getKeretas() async {
    final response = await client.get(baseUrl + "api/keretainfo");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Kereta().keretasFromJson(rest);
    } else {
      return null;
    }
  }

  Future<InformatonStation> getInformation() async {
    final response = await client.get(baseUrl + "api/stasiuninfo");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var temp = data['result'];
      var rest = jsonEncode(temp[0]);

      return InformatonStation().informationFromJson(rest);
    } else {
      return null;
    }
  }

  Future<bool> createProfile(Feedbacks data) async {
    final response = await client.post(
      "$baseUrl/api/profile",
      headers: {"content-type": "application/json"},
      body: feedbackToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
