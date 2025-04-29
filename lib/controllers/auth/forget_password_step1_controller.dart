import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/services/api_manager.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/services/forget_password_service.dart';

class ForgetPasswordStep1Controller extends GetxController {
  var isLoading = false.obs;
  var isProcessing = false.obs;
  var statusMessage = ''.obs;
  var logger = Logger();
  var isSnackbarOpen = false.obs;

  final String urlOtp = '${ApiManager.globalUrl}auth/forgetPassword.php';

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
        Get.showSnackbar(GetSnackBar(
          title: "Gagal",
          message: "Email tidak boleh kosong",
          duration: Duration(seconds: 2),
        ));
        Future.delayed(Duration(seconds: 3), () {
          isSnackbarOpen.value = false;
        });
        logger.d("Email is empty");
        return;
        // return Get.offNamed("/auth/forget-password/step1");
      } else if (!email.contains("@") || !email.isEmail) {
        resetLoading();
        isSnackbarOpen.value = true;
        Get.showSnackbar(GetSnackBar(
          title: "Gagal",
          message: "Email tidak valid",
          duration: Duration(seconds: 2),
        ));
        Future.delayed(Duration(seconds: 3), () {
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
        Get.showSnackbar(GetSnackBar(
          title: "Gagal",
          message: "Email tidak valid",
          duration: Duration(seconds: 2),
        ));
        Future.delayed(Duration(seconds: 3), () {
          isSnackbarOpen.value = false;
        });
      }
    } catch (e) {
      resetLoading();
      isSnackbarOpen.value = true;
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "Error : $e",
        duration: Duration(seconds: 2),
      ));
      Future.delayed(Duration(seconds: 3), () {
        isSnackbarOpen.value = false;
      });
    } finally {
      // await Future.delayed(Duration(milliseconds: 100));
      // resetLoading();
      isProcessing.value = false;
    }
  }

  void resetLoading() {
    hideLoadingPopup();
    isLoading.value = false;
  }
}
