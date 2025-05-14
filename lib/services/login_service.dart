import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/dosen_model.dart';
import 'package:stipres/models/mahasiswa_model.dart';
import 'package:stipres/services/api_manager.dart';
import 'package:http/http.dart' as http;

class LoginService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}auth/login.php";
  final GetStorage _box = GetStorage();

  var logger = Logger(printer: PrettyPrinter(methodCount: 0));

  Future<Mahasiswa?> loginMahasiswa(String nim, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseURL),
        body: {'nim': nim, 'password': password, 'role': "mahasiswa"},
      );

      logger.d("Response status: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['status'] == 'success') {
          final data = body['data'];

          _box.write("user_nim", data['nim']);
          _box.write("mahasiswa_id", data['mahasiswa_id']);
          _box.write("user_nama", data['nama']);
          _box.write("user_email", data['email']);
          _box.write("id_prodi", data['prodi_id']);
          _box.write("nama_prodi", data['nama_prodi']);
          _box.write("semester", data['semester']);
          _box.write("role", "mahasiswa");

          logger.d(_box.read("id_prodi"));

          return Mahasiswa.fromJson(data);
        }
      }
      return null;
    } catch (e) {
      logger.e("Error during login: $e");
      return null;
    }
  }

  Future<Dosen?> loginDosen(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(_baseURL),
          body: {'email': email, 'password': password, 'role': 'dosen'});

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['status'] == 'success') {
          final data = body['data'];

          _box.write("user_nip", data['nip']);
          _box.write("dosen_id", data['dosen_id']);
          _box.write("user_nama", data['nama']);
          _box.write("user_email", data['email']);
          _box.write("role", data['role']);

          logger.d(body);

          return Dosen.fromJson(data);
        }
      }
      return null;
    } catch (e) {
      logger.e('Error during login: $e');
      return null;
    }
  }
}
