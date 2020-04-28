import 'dart:convert';

class Place {
  int id;
  String long;
  String lat;
  String placeName;

  Place({this.id, this.placeName, this.lat, this.long});

  factory Place.fromJson(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      lat: map['lat'],
      long: map['long'],
      placeName: map['nama_subkategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "lat": lat,
      "long": long,
      "nama_subkategori": placeName,
    };
  }

  List<Place> placesFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Place>.from(data.map((item) => Place.fromJson(item)));
  }

  String taxiToJson(Place data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
