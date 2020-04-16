import 'dart:convert';

class Place {
  int id;
  // String categoryDestination;
  String placeName;

  Place({this.id , this.placeName});// this.categoryDestination, 

  factory Place.fromJson(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      // categoryDestination: map['Deskrip'],
      placeName: map['nama_subkategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      // "Deskrip": categoryDestination,
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
