import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/model/Destination.dart';
import 'package:flutter_app/model/Kereta.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:flutter_app/model/Taxi.dart';
import 'package:http/http.dart' show Client;


class Api {
  static String baseUrl = "http://192.168.1.17:8000/api/";
  Client client = Client();

  Future<List<Trayek>> getTrayeks() async {
    final response = await client.get(baseUrl + "trayek");
    if (response.statusCode == 200) {
      return Trayek().trayeksFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Taxi>> getTaxis() async {
    final response = await client.get(baseUrl + "taxi");
    if (response.statusCode == 200) {
      return Taxi().taxisFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Destination>> getDestinations() async {
    final response = await client.get(baseUrl + "kategori");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Destination().destinationFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Place>> getPlaces(String key) async {
    final response = await client.get(baseUrl + "subkategori/" + key);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Place().placesFromJson(rest);
    } else {
      return null;
    }
  }

  Future<List<Kereta>> getKeretas() async {
    final response = await client.get(baseUrl + "keretainfo");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var rest = jsonEncode(data['result']);
      return Kereta().keretasFromJson(rest);
    } else {
      return null;
    }
  }
}
