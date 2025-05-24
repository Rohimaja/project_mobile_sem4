class PresensiRequest {
  final String presensiId;
  final String tglPresensi;
  final String jamAwal;
  final String jamAkhir;
  final int dosenId;
  final int prodiId;
  final int semester;
  final int matkulId;
  final int tahunAjaranId;
  final String linkZoom;

  PresensiRequest({
    required this.presensiId,
    required this.tglPresensi,
    required this.jamAwal,
    required this.jamAkhir,
    required this.dosenId,
    required this.prodiId,
    required this.semester,
    required this.matkulId,
    required this.tahunAjaranId,
    required this.linkZoom,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'presensi_id': presensiId,
      'tgl_presensi': tglPresensi,
      'jam_awal': jamAwal,
      'jam_akhir': jamAkhir,
      'dosen_id': dosenId,
      'prodi_id': prodiId,
      'semester': semester,
      'matkul_id': matkulId,
      'tahun_ajaran_id': tahunAjaranId,
      'link_zoom': linkZoom,
    };
  }
}
