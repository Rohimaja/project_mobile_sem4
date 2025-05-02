class PresensiModelApi {
  String nim;
  int semester;
  String presensiId;
  String durasiPresensi;
  String namaMatkul;
  String? namaRuangan;
  String durasiMatkul;
  String linkZoom;

  PresensiModelApi(
      {required this.nim,
      required this.semester,
      required this.presensiId,
      required this.durasiPresensi,
      required this.namaMatkul,
      this.namaRuangan,
      required this.durasiMatkul,
      required this.linkZoom});

  factory PresensiModelApi.fromJson(Map<String, dynamic> json) {
    return PresensiModelApi(
        nim: json['nim'],
        semester: json['semester'],
        presensiId: json['presensi_id'],
        durasiPresensi: json['durasi_presensi'],
        namaMatkul: json['nama_matkul'],
        namaRuangan: json['nama_ruangan'],
        durasiMatkul: json['durasi_matkul'],
        linkZoom: json['link_zoom']);
  }
}
