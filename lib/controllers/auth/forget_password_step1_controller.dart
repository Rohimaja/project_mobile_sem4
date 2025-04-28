import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/forget_password.response.dart';
import 'package:stipres/services/api_manager.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/services/forget_password_service.dart';

class ForgetPasswordStep1Controller extends GetxController {
  var isLoading = false.obs;
  var statusMessage = ''.obs;
  var logger = Logger();

  final String urlOtp = '${ApiManager.globalUrl}auth/forgetPassword.php';

  Future<void> sendOtp(String email) async {
    try {
      isLoading.value = true;
      showLoadingPopup();

      if (email.isEmpty) {
        isLoading.value = false;
        hideLoadingPopup();
        Get.snackbar("Gagal", "Email tidak boleh kosong");
        logger.d("Email is empty");
        return Get.offNamed("/auth/forget-password/step1");
      } else if (!email.contains("@")) {
        hideLoadingPopup();
        Get.snackbar("Gagal", "Email tidak valid");
        logger.d("Email is not valid");
        return Get.offNamed("/auth/forget-password/step1");
      }

      ChangePasswordFPResponse result =
          await ForgetPasswordService().sendOtpSv(email);
      if (result.status == "success") {
        isLoading.value = false;
        hideLoadingPopup();
        Get.offNamed("/auth/forget-password/step2");
      } else {
        isLoading.value = false;
        hideLoadingPopup();
        Get.snackbar("Gagal", "Gagal mengirim otp");
      }
    } catch (e) {
      isLoading.value = false;
      hideLoadingPopup();
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
      hideLoadingPopup();
    }
    // try {
    //   final response =
    //       await http.post(Uri.parse(urlOtp), body: {'email': email});

    //   final data = jsonDecode(response.body);
    //   final String message = data['message'];

    //   if (response.statusCode == 200 && data['status'] == "success") {
    //     statusMessage.value = message;
    //     Get.snackbar("Berhasil", message, snackPosition: SnackPosition.BOTTOM);
    //     // hideLoadingPopup();
    //     isLoading.value = false;
    //     Get.offNamed("/auth/forget-password/step2");
    //     GetStorage().write("email_otp", email);
    //     logger.d(email + "lol");
    //     hideLoadingPopup();
    //     return;
    //   } else {
    //     hideLoadingPopup();
    //     statusMessage.value = message;
    //     Get.snackbar("Gagal", message);
    //     logger.d(message + "anjay");
    //     // hideLoadingPopup();
    //   }
    // } catch (e) {
    //   hideLoadingPopup();
    //   statusMessage.value = 'Terjadi kesalahan: $e';
    //   Get.snackbar("Gagal", statusMessage.value,
    //       snackPosition: SnackPosition.BOTTOM);
    //   logger.d("$e");
    // } finally {
    //   isLoading.value = false;
    //   hideLoadingPopup();
    // }
  }
}
