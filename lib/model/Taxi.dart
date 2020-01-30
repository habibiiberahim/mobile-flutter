import 'dart:convert';

class Taxi {
  int id;
  String taxiName;
  String taxiPrice;
  String taxiDesc;

  Taxi({
    this.id,
    this.taxiName,
    this.taxiPrice,
    this.taxiDesc,
  });

  factory Taxi.fromJson(Map<String, dynamic> map) {
    return Taxi(
      id: map['id'],
      taxiName: map['taxi_name'],
      taxiPrice: map['taxi_price'],
      taxiDesc: map['taxi_desc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "trayek_name": taxiName,
      "taxi_price": taxiPrice,
      "taxi_desc": taxiDesc,
     
    };
  }

  List<Taxi> taxisFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Taxi>.from(data.map((item) => Taxi.fromJson(item)));
  }

  String taxiToJson(Taxi data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
