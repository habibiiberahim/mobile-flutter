import 'dart:convert';

class News {
  int id;
  String judul;
  String isi;
  String gambar;
  String createdAt;
  String updatedAt;

  News(
      {this.id,
      this.judul,
      this.isi,
      this.gambar,
      this.createdAt,
      this.updatedAt});

  factory News.fromJson(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      judul: map['judul'],
      isi: map['isi'],
      gambar: map['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'isi': isi,
      'gambar': gambar,
    };
  }

  List<News> newsFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<News>.from(data.map((item) => News.fromJson(item)));
  }

  String taxiToJson(News data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
  
}
