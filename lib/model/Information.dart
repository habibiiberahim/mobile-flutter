import 'dart:convert';

class InformatonStation {
  String denahStasiun;
  String prosedurEvakuasi;
  String petaJaringan;
  String denahEvakuasi;

  InformatonStation(
      {this.denahStasiun,
      this.prosedurEvakuasi,
      this.petaJaringan,
      this.denahEvakuasi});

  factory InformatonStation.fromJson(Map<String, dynamic> map) {
    return InformatonStation(
        denahStasiun: map['denah_stasiun'],
        prosedurEvakuasi: map['prosedur_evakuasi'],
        petaJaringan: map['peta_jaringan'],
        denahEvakuasi: map['denah_evakuasi']);
  }

  Map<String, dynamic> toJson() {
    return {
      'denah_stasiun': this.denahStasiun,
      'prosedur_evakuasi': this.prosedurEvakuasi,
      'peta_jaringan': this.petaJaringan,
      'denah_evakuasi': this.denahEvakuasi
    };
  }

  InformatonStation informationFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return InformatonStation.fromJson(data);
  }

  String informationToJson(InformatonStation data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }

  String getProsedure(){
    return prosedurEvakuasi;
  }
}
