import 'dart:convert';

class Place {
  int id;
  String categoryDestination;
  String placeName;

  Place({this.id, this.categoryDestination, this.placeName});

  factory Place.fromJson(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      categoryDestination: map['category_destination'],
      placeName: map['place_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category_destination": categoryDestination,
      "place_name": placeName,
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
