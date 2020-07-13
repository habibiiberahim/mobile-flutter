import 'dart:convert';

class Trayek {
  int id;
  String trayekName;
  String trayekPrice;
  String trayekDesc;
  String trayekSlug;

  Trayek(
      {this.id,
      this.trayekName,
      this.trayekPrice,
      this.trayekDesc,
      this.trayekSlug});

  factory Trayek.fromJson(Map<String, dynamic> map) {
    return Trayek(
      id: map['id'],
      trayekName: map['trayek_name'],
      trayekPrice: map['trayek_price'],
      trayekDesc: map['trayek_desc'],
      trayekSlug: map['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "trayek_name": trayekName,
      "trayek_price": trayekPrice,
      "trayek_desc": trayekDesc,
      "gambar": trayekSlug
    };
  }

  List<Trayek> trayeksFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Trayek>.from(data.map((item) => Trayek.fromJson(item)));
  }

  String trayekToJson(Trayek data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }

  List<String> getImages(String jsonData) {
    final data = json.decode(jsonData);
    return List<String>.from(data.map((item) => (item)));
  }
}
