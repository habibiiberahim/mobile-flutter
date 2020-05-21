import 'dart:convert';

class Tipe {
  int id;
  String jenisKereta;
  

  Tipe({this.id, this.jenisKereta,});

   factory Tipe.fromJson(Map<String, dynamic> map) {
    return Tipe(
      id: map['id'],
      jenisKereta: map['jenis_kereta'],
   
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "jenis_kereta": jenisKereta,

    };
  }

  List<Tipe> tipesFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Tipe>.from(data.map((item) => Tipe.fromJson(item)));
  }

  String tipeToJson(Tipe data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}