class JadwalModelApi {
  String waktu;
  final String mataKuliah;
  String? lokasi;
  String durasiMatkul;

  JadwalModelApi({
    required this.waktu,
    required this.mataKuliah,
    this.lokasi,
    required this.durasiMatkul,
  });

  factory JadwalModelApi.fromJson(Map<String, dynamic> json) {
    return JadwalModelApi(
        waktu: json['durasi_presensi'],
        mataKuliah: json['nama_matkul'],
        lokasi: json['nama_ruangan'],
        durasiMatkul: json['durasi_matkul']);
  }
}
