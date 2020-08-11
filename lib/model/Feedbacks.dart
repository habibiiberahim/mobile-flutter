import 'dart:convert';

class Feedbacks {

  String nama;
  String email;
  String saran;
  
  Feedbacks({this.nama, this.email, this.saran});

  Map<String, dynamic> toJson() {
    return { "nama": nama, "email": email, "saran": saran};
  }
}

String feedbackToJson(Feedbacks data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}