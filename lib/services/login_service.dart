import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/dosen_model.dart';
import 'package:stipres/models/mahasiswa_model.dart';
import 'package:stipres/constants/api.dart';
import 'package:http/http.dart' as http;

class LoginService extends GetxService {
  final String _baseURL = "${ApiConstants.globalUrl}auth/login";
  final String global = ApiConstants.globalUrl;
  final GetStorage _box = GetStorage();
  final FlutterSecureStorage _secure = FlutterSecureStorage();

  var logger = Logger(printer: PrettyPrinter(methodCount: 0));

  Future<Mahasiswa?> loginMahasiswa(String nim, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseURL),
        body: {'nim': nim, 'password': password, 'role': "mahasiswa"},
      );
      logger.d(_baseURL);

      logger.d("Response status: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['status'] == 'success') {
          final token = body['token'];
          final tokenType = body['token_type'];
          final expiresIn = body['expires_in'];
          final refreshToken = body['refresh_token'];

          await _box.write("auth_token", token);
          await _box.write("auth_token_type", tokenType);
          await _secure.write(key: "refresh_token", value: refreshToken);
          final expirationTime =
              DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);
          await _box.write("auth_expires_in", expirationTime.toString());

          logger.d("Token: $token");
          logger.d("Refresh Token: $refreshToken");
          logger.d("Token Type: $tokenType");
          logger.d("Expires In: $expiresIn");

          final data = body['data'];
          logger.d(data);

          _box.write("user_nim", data['nim']);
          _box.write("mahasiswa_id", data['mahasiswa_id']);
          _box.write("user_nama", data['nama']);
          _box.write("user_email", data['email']);
          _box.write("id_prodi", data['prodi_id']);
          _box.write("nama_prodi", data['nama_prodi']);
          _box.write("semester", data['semester']);
          _box.write("foto", data['foto']);
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
          final token = body['token'];
          final tokenType = body['token_type'];
          final expiresIn = body['expires_in'];
          final refreshToken = body['refresh_token'];

          await _box.write("auth_token", token);
          await _box.write("auth_token_type", tokenType);
          await _secure.write(key: "refresh_token", value: refreshToken);
          final expirationTime =
              DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);
          await _box.write("auth_expires_in", expirationTime.toString());

          logger.d("Token: $token");
          logger.d("Refresh Token: $refreshToken");
          logger.d("Token Type: $tokenType");
          logger.d("Expires In: $expiresIn");

          final data = body['data'];

          _box.write("user_nip", data['nip']);
          _box.write("dosen_id", data['dosen_id']);
          _box.write("user_nama", data['nama']);
          _box.write("user_email", data['email']);
          _box.write("foto", data['foto']);
          _box.write("role", 'dosen');

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
