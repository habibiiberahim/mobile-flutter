import 'dart:convert';

class Contact {
  int id;
  String nama;
  String nomor;
  Contact({this.id, this.nama, this.nomor});


  factory Contact.fromJson(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      nama: map['nama'],
      nomor: map['nomor']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nomor': nomor,
    
    };
  }

  List<Contact> contactsFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Contact>.from(data.map((item) => Contact.fromJson(item)));
  }

  String contactToJson(Contact data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
