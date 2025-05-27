class PresenceRequest {
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

  PresenceRequest({
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
      'action': "uploadPresensi",
      'presensi_id': presensiId,
      'tgl_presensi': tglPresensi,
      'jam_awal': jamAwal,
      'jam_akhir': jamAkhir,
      'dosen_id': dosenId.toString(),
      'prodi_id': prodiId.toString(),
      'semester': semester.toString(),
      'matkul_id': matkulId.toString(),
      'tahun_ajaran_id': tahunAjaranId.toString(),
      'link_zoom': linkZoom,
    };
  }
}
