class PresensiDosenModel {
  final int semester;
  final int presensisId;
  final String jamAwal;
  final String jamAkhir;
  final String namaMatkul;
  String? namaRuangan;
  String? durasiPresensi;
  final String durasiMatkul;

  PresensiDosenModel({
    required this.semester,
    required this.presensisId,
    required this.jamAwal,
    required this.jamAkhir,
    required this.namaMatkul,
    required this.namaRuangan,
    required this.durasiMatkul,
    this.durasiPresensi,
  });

  factory PresensiDosenModel.fromJson(Map<String, dynamic> json) {
    return PresensiDosenModel(
      semester: json["semester"],
      presensisId: json["presensis_id"],
      jamAwal: json["jam_awal"],
      jamAkhir: json["jam_akhir"],
      namaMatkul: json["nama_matkul"],
      namaRuangan: json["nama_ruangan"],
      durasiMatkul: json["durasi_matkul"],
    );
  }
}
