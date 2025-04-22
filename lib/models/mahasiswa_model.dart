class Mahasiswa {
  final String nim;
  final String nama;
  final int idProdi;
  final int semester;

  Mahasiswa(
      {required this.nim,
      required this.nama,
      required this.idProdi,
      required this.semester});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      nim: json['nim'],
      nama: json['nama'],
      idProdi: json['id_prodi'],
      semester: json['semester'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nim': nim,
        'nama': nama,
        'id_prodi': idProdi,
        'semester': semester,
      };
}
