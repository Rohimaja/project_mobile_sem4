import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/services/forget_password_service.dart';

class ForgetPasswordStep1Controller extends GetxController {
  var isLoading = false.obs;
  var isProcessing = false.obs;
  var statusMessage = ''.obs;
  var logger = Logger();
  final delayedSnackbar = 1;
  var isSnackbarOpen = false.obs;

  final String urlOtp = '${ApiConstants.globalUrl}auth/forgetPassword.php';

  Future<void> sendOtp(String email) async {
    if (isProcessing.value) {
      logger.d("Process already running");
      return;
    }

    isProcessing.value = true;
    isLoading.value = true;
    try {
      logger.d("email masuk: $email");

      if (email.isEmpty) {
        resetLoading();
        isSnackbarOpen.value = true;
        Get.snackbar("Gagal", "Email tidak boleh kosong",
            duration: Duration(seconds: delayedSnackbar));
        Future.delayed(Duration(seconds: 2), () {
          isSnackbarOpen.value = false;
        });
        logger.d("Email is empty");
        return;
        // return Get.offNamed("/auth/forget-password/step1");
      } else if (!email.contains("@") || !email.isEmail) {
        resetLoading();
        isSnackbarOpen.value = true;
        Get.snackbar("Gagal", "Email tidak valid",
            duration: Duration(seconds: delayedSnackbar));
        Future.delayed(Duration(seconds: 2), () {
          isSnackbarOpen.value = false;
        });
        logger.d("Email is not valid");
        return;
        // return Get.offNamed("/auth/forget-password/step1");
      }

      showLoadingPopup();
      BaseResponse result = await ForgetPasswordService().sendOtpSv(email);
      resetLoading();

      if (result.status == "success") {
        resetLoading();
        Get.offNamed("/auth/forget-password/step2");
      } else {
        resetLoading();
        isSnackbarOpen.value = true;
        Get.snackbar("Gagal", "Email tidak valid",
            duration: Duration(seconds: delayedSnackbar));
        Future.delayed(Duration(seconds: 2), () {
          isSnackbarOpen.value = false;
        });
      }
    } catch (e) {
      resetLoading();
      isSnackbarOpen.value = true;
      Get.snackbar("Error", "Error ; $e",
          duration: Duration(seconds: delayedSnackbar));
      Future.delayed(Duration(seconds: 2), () {
        isSnackbarOpen.value = false;
      });
    } finally {
      isProcessing.value = false;
    }
  }

  void resetLoading() {
    hideLoadingPopup();
    isLoading.value = false;
  }
}
