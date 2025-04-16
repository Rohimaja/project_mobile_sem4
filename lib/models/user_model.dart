class UserModel {
  final String nim;
  final String nama;
  final int idProdi;
  final int semester;
  // final String role;

  UserModel(
      {required this.nim,
      required this.nama,
      required this.idProdi,
      // required this.role,
      required this.semester});

  factory UserModel.fromJson(Map<String, dynamic> object) {
    return UserModel(
        nim: object['nim'],
        nama: object['nama'],
        idProdi: object['id_prodi'],
        // role: object['role'],
        semester: object['semester']);
  }

  Map<String, dynamic> toJson() => {
        'nim': nim,
        'nama': nama,
        'id_prodi': idProdi,
        'semester': semester,
      };
}
