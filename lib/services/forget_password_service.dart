import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/basic_response.dart';
import 'package:stipres/constants/api.dart';

class ForgetPasswordService extends GetxService {
  final String _baseURL = "${ApiConstants.globalUrl}auth/ForgetPassword.php";
  final GetStorage _box = GetStorage();
  final global = ApiConstants.globalUrl;

  var logger = Logger();

  Future<BaseResponse> sendOtpSv(String email) async {
    try {
      final response =
          await http.post(Uri.parse(_baseURL), body: {'email': email});

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['status'] == 'success') {
          _box.write("email_otp", email);
          logger.d(body);

          return BaseResponse(status: body['status'], message: body['message']);
        } else {
          return BaseResponse(status: body['status'], message: body['message']);
        }
      }
    } catch (e) {
      logger.e("Error during sending OTP: $e");
      throw Exception("Failed to send OTP: $e");
    }

    return BaseResponse(status: "error", message: "Failed to send OTP");
  }

  Future<bool> checkOtp(String email, String otp) async {
    try {
      final response = await http.post(Uri.parse(_baseURL),
          body: {'email': email, 'otp': otp, 'action': 'checkOtp'});

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body['status'] == "success") {
          logger.d(body);
          return true;
        }
      }
    } catch (e) {
      logger.e("Error during checking OTP: $e");
    }
    return false;
  }

  Future<BasicResponse> changePasswordSv(String email, String password) async {
    try {
      final String newUrl = "auth/forgetPassword.php";
      final response = await http.post(Uri.parse("$global$newUrl"),
          body: {'email': email, 'new_password': password});
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        logger.d(response.body);

        return BasicResponse.fromJson(body);
      }
    } catch (e) {
      logger.d("Error during change password: $e");
    }
    return BasicResponse(
        status: "error", message: "Terjadi kesalahan saat mengganti password");
  }

  // Future<ChangePasswordFPResponse> checkEmailSv(
  //     String email, String password) async {
  //   try {
  //     final String newUrl = "auth/forgetPassword.php";
  //     final response = await http.post(Uri.parse("$global$newUrl"),
  //         body: {'email': email, 'new_password': password});
  //     if (response.statusCode == 200) {
  //       final body = jsonDecode(response.body);

  //       return ChangePasswordFPResponse.fromJson(body);
  //     }
  //   } catch (e) {
  //     logger.d("Error during checking email: $e");
  //   }
  //   return ChangePasswordFPResponse(
  //       status: "error", message: "Terjadi kesalahan saat mengganti password");
  // }
}
