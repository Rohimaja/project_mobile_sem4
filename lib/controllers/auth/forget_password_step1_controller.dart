import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/services/api_manager.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';

class ForgetPasswordStep1Controller extends GetxController {
  var isLoading = false.obs;

  var statusMessage = ''.obs;

  var logger = Logger();

  final String urlOtp = '${ApiManager.globalUrl}auth/forgetPassword.php';

  Future<void> sendOtp(String email) async {
    isLoading.value = true;
    showLoadingPopup();

    try {
      final response =
          await http.post(Uri.parse(urlOtp), body: {'email': email});

      final data = jsonDecode(response.body);
      final String message = data['message'];

      if (response.statusCode == 200 && data['status'] == "success") {
        statusMessage.value = message;
        Get.snackbar("Berhasil", message, snackPosition: SnackPosition.BOTTOM);
        Get.offNamed("/auth/forget-password/step2");
      } else {
        statusMessage.value = message;
        Get.snackbar("Gagal", message);
        logger.d(message);
        hideLoadingPopup();
      }
    } catch (e) {
      statusMessage.value = 'Terjadi kesalahan: $e';
      Get.snackbar("Gagal", statusMessage.value,
          snackPosition: SnackPosition.BOTTOM);
      logger.d("$e");
      hideLoadingPopup();
    } finally {
      isLoading.value = false;
      hideLoadingPopup();
    }
  }
}
