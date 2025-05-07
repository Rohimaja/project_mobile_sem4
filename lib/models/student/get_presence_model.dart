class GetPresenceApi {
  final String durasiPresensi;
  final String namaMatkul;
  final String kodeMatkul;
  final DateTime? tglPresensi;

  GetPresenceApi({
    required this.durasiPresensi,
    required this.namaMatkul,
    required this.kodeMatkul,
    required this.tglPresensi,
  });

  factory GetPresenceApi.fromJson(Map<String, dynamic> json) {
    return GetPresenceApi(
      durasiPresensi: json["durasi_presensi"],
      namaMatkul: json["nama_matkul"],
      kodeMatkul: json["kode_matkul"],
      tglPresensi: DateTime.tryParse(json["tgl_presensi"] ?? ""),
    );
  }
}
