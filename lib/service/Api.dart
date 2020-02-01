import 'dart:async';
import 'package:flutter_app/model/Destination.dart';
import 'package:flutter_app/model/Place.dart';
import 'package:flutter_app/model/Trayek.dart';
import 'package:flutter_app/model/Taxi.dart';
import 'package:http/http.dart' show Client;

class Api {
  final String baseUrl = "http://station.maucobain.com/api/";
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
    final response = await client.get(baseUrl + "destination");
    if (response.statusCode == 200) {
      return Destination().destinationFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Place>> getPlaces(String key) async {
    final response = await client.get(baseUrl + "place/" + key);
    if (response.statusCode == 200) {

      return Place().placesFromJson(response.body);
    } else {
      return null;
    }
  }
}
