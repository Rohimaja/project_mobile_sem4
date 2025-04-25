import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/services/api_manager.dart';

class ForgetPasswordService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}auth/ForgetPassword.php";
  final GetStorage _box = GetStorage();

  var logger = Logger();

  Future<void> sendOtpSv(String email) async {
    try {
      final response =
          await http.post(Uri.parse(_baseURL), body: {'email': email});

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['status'] == 'success') {
          _box.write("email_otp", email);
          logger.d(body);

          return;
        }
      }
    } catch (e) {
      logger.e("Error during sending OTP: $e");
      throw Exception("Failed to send OTP: $e");
    }
  }

  Future<bool> checkOtp(String email, String otp) async {
    try {
      final response = await http.post(Uri.parse(_baseURL),
          body: {'email': email, 'otp': otp, 'action': 'checkOtp'});

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        logger.d(body);
        return body['status'] == 'success';
      }
    } catch (e) {
      logger.e("Error during checking OTP: $e");
    }
    return false;
  }
}
