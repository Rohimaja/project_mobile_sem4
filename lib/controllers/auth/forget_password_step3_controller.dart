import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/basic_response.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/services/forget_password_service.dart';

class ForgetPasswordStep3Controller extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final forgetPasswordService = ForgetPasswordService();

  var isSnackbarOpen = false.obs;
  var isLoading = false.obs;

  final passwordErrorMessage = ''.obs;
  final confirmPasswordErrorMessage = ''.obs;
  final valuePassword = false.obs;
  final valueConfirmPassword = false.obs;
  final delaySnackbar = 1;

  Logger logger = Logger();

  Timer? passwordTypingTimer;
  Timer? confirmPasswordTypingTimer;

  final isPasswordVisible = false.obs;
  final isPasswordVisible2 = false.obs;

  int waktu = 2;

  void checkVisible() => isPasswordVisible.toggle();
  void checkVisible2() => isPasswordVisible2.toggle();

  void validatePassword(String value) {
    if (passwordController.text.length <= 7) {
      valuePassword.value = true;
      passwordErrorMessage.value = "Masukkan password lebih dari 7 huruf";
    }
  }

  void validateConfirmPassword(String value) {
    if (confirmPasswordController.text.length <= 7) {
      valueConfirmPassword.value = true;
      confirmPasswordErrorMessage.value =
          "Masukkan confirm password lebih dari 7 huruf";
    } else if (confirmPasswordController.text != passwordController.text) {
      valueConfirmPassword.value = true;
      confirmPasswordErrorMessage.value =
          "Konfirmasi password tidak sesuai dengan password";
    }
  }

  void startTimerPassword() {
    valuePassword.value = false;

    passwordTypingTimer?.cancel();
    passwordTypingTimer = Timer(Duration(seconds: waktu), () {
      validatePassword(passwordController.value.text);
    });
  }

  void startTimerConfirmPassword() {
    valueConfirmPassword.value = false;

    confirmPasswordTypingTimer?.cancel();
    confirmPasswordTypingTimer = Timer(Duration(seconds: waktu), () {
      validateConfirmPassword(confirmPasswordController.value.text);
    });
  }

  Future<void> changePassword() async {
    validatePassword(passwordController.text);
    validateConfirmPassword(confirmPasswordController.text);

    isLoading.value = true;

    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      // bisa juga kasih warning user
      logger.e("Password atau confirm password kosong/null");
      resetLoading();
      return;
    }

    if (valuePassword.value == true || valueConfirmPassword.value == true) {
      isLoading.value = false;

      isSnackbarOpen.value = true;
      Get.snackbar("Gagal", "Penuhi validasi terlebih dahulu",
          duration: Duration(seconds: delaySnackbar));
      Future.delayed(Duration(seconds: 2), () {
        isSnackbarOpen.value = false;
      });
      resetLoading();
      return;
    }

    if (valuePassword.value == false && valueConfirmPassword.value == false) {
      final String email = Get.arguments;
      logger.d(email);
      logger.d(passwordController.text);

      showLoadingPopup();
      BasicResponse response = await forgetPasswordService.changePasswordSv(
          email, passwordController.text);
      resetLoading();

      logger.d(response.message);

      if (response.status == "success") {
        Get.snackbar("Success", "Password berhasil diubah",
            duration: Duration(seconds: 2));
        Get.offAllNamed("/");
      } else {
        resetLoading();
        isSnackbarOpen.value = true;
        Get.snackbar("Gagal", response.message,
            duration: Duration(seconds: delaySnackbar));
        Future.delayed(Duration(seconds: 2), () {
          isSnackbarOpen.value = false;
        });
      }
      return;
    }
  }

  void resetLoading() {
    hideLoadingPopup();
    isLoading.value = false;
  }
}
