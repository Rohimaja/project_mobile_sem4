import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/user_model.dart';
import 'package:stipres/services/api_manager.dart';
import 'package:http/http.dart' as http;

class LoginService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}auth/login.php";
  final GetStorage _box = GetStorage();

  var logger = Logger(printer: PrettyPrinter(methodCount: 0));

  Future<UserModel?> login(String nim, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseURL),
        body: {'nim': nim, 'password': password, 'role': "mahasiswa"},
      );

      logger.d("Response status: ${response.statusCode}");
      logger.d("Response status: ${response.body}");
      logger.d("Sending nim: $nim");
      logger.d("Sending password: $password");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          _box.write("user_nim", data['nim']);
          _box.write("user_nama", data['nama']);
          _box.write("id_prodi", data['id_prodi']);
          _box.write("semester", data['semester']);
          _box.write("role", "mahasiswa");

          return UserModel.fromJson(data);
        }
      }
      return null;
    } catch (e) {
      logger.e("Error during login: $e");
      return null;
    }
  }

  bool isLoggedIn() {
    return _box.hasData('user_nim');
  }
}
