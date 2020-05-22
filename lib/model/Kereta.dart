import 'dart:convert';

class Kereta {
  int id;
  String namaKereta;
  String noKa;
  String jam;
  int jalurId;
  String kelaska;
  String relasi;
  String progresStasiun;
  String gambarJalur;
  String jenisId;
  String keterangan;

  Kereta({
    this.id,
    this.namaKereta,
    this.noKa,
    this.jam,
    this.jalurId,
    this.kelaska,
    this.relasi,
    this.progresStasiun,
    this.jenisId,
    this.keterangan,
    this.gambarJalur
  });

  factory Kereta.fromJson(Map<String, dynamic> map) {
    return Kereta(
        id: map['id'],
        namaKereta: map['nama_kereta'],
        noKa: map['no_ka'],
        jam: map['jam'],
        jalurId: map['jalur_id'],
        kelaska: map['kelaska'],
        relasi: map['relasi'],
        progresStasiun: map['progres_stasiun'],
        jenisId: map['jenis_id'],
        gambarJalur:map['gambar_jalur'],
        keterangan: map['keterangan']);
        
  }


  Map<String, dynamic> toJson() {
    return {
     'id' : this.id,
    'nama_kereta' : this.namaKereta,
    'no_ka' : this.noKa,
    'jam' : this.jam,
    'jalur_id' : this.jalurId,
    'kelaska' : this.kelaska,
    'relasi' : this.relasi,
    'progres_stasiun' : this.progresStasiun,
    'jenis_id' : this.jenisId,
    'keterangan' : this.keterangan,
    'gambar_jalur':this.gambarJalur
    };
  }

  List<Kereta> keretasFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Kereta>.from(data.map((item) => Kereta.fromJson(item)));
  }

  String keretaToJson(Kereta data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
