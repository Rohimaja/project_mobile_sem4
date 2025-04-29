class JadwalModel {
  String waktu;
  final String mataKuliah;
  String? lokasi;
  String durasiMatkul;
  List<String> chips;

  JadwalModel({
    required this.waktu,
    required this.mataKuliah,
    this.lokasi,
    required this.durasiMatkul,
    this.chips = const [],
  });

  factory JadwalModel.fromJson(Map<String, dynamic> json) {
    return JadwalModel(
        waktu: json['durasi_presensi'],
        mataKuliah: json['nama_matkul'],
        lokasi: json['nama_ruangan'],
        durasiMatkul: json['durasi_matkul'],
        chips: ['']);
  }
}
