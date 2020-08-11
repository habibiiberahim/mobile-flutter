import 'dart:convert';

class InformationStation {
  int id;
  String namaDenah;
  String gambar;
  String deskripsi;

  InformationStation({this.id, this.namaDenah, this.gambar, this.deskripsi});

  factory InformationStation.fromJson(Map<String, dynamic> map) {
    return InformationStation(
        id: map['id'],
        namaDenah: map['nama_denah'],
        gambar: map['gambar'],
        deskripsi: map['deskripsi']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nama_denah': this.namaDenah,
      'gambar': this.gambar,
      'deskripsi': this.deskripsi
    };
  }

  List<InformationStation> informationFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<InformationStation>.from(data.map((item) => InformationStation.fromJson(item)));
  }

  String informationToJson(InformationStation data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }

  List<String> getImages(String jsonData) {
    final data = json.decode(jsonData);
    return List<String>.from(data.map((item) => (item)));
  }
}
