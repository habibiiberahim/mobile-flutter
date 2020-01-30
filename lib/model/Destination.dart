import 'dart:convert';

class Destination {
  int id;
  String categoryDestination;


  Destination(
      {this.id, this.categoryDestination});

  factory Destination.fromJson(Map<String, dynamic> map) {
    return Destination(
      id: map['id'],
      categoryDestination: map['category_destination'],
    
     );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category_destination": categoryDestination,    
    };
  }

  List<Destination> destinationFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Destination>.from(data.map((item) => Destination.fromJson(item)));
  }

  String destinationToJson(Destination data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
