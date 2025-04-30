import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/services/api_manager.dart';
import 'package:stipres/services/forget_password_service.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ForgetPasswordStep2Controller extends GetxController {
  var isButtonEnabled = true.obs;
  var isSnackbarOpen = false.obs;

  final otpController = TextEditingController();
  final forgetPasswordService = ForgetPasswordService();

  var isLoading = false.obs;
  final delaySnackbar = 1;

  late StopWatchTimer resendTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(5));

  var textKirim = 'Kirim'.obs;
  var statusMessage = ''.obs;

  final String email = GetStorage().read("email_otp");

  var logger = Logger();

  final String urlOtp = '${ApiManager.globalUrl}auth/ForgetPassword.php';

  String maskedEmail() {
    logger.d(email);
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];

    final visiblePart =
        username.length >= 4 ? username.substring(0, 4) : username;
    final masked = visiblePart + '*' * (username.length - visiblePart.length);

    return '$masked@$domain';
  }

  void send() {
    if (isButtonEnabled.value == true && isLoading.value == false) {
      reSendOtp(email);
      startTimer();
    }
  }

  void startTimer() async {
    logger.d("Starting timer...");
    logger.d(resendTimer);

    if (!isButtonEnabled.value) return;

    isButtonEnabled.value = false;

    resendTimer.onResetTimer();
    resendTimer.onStartTimer();

    resendTimer.rawTime.listen((rawTime) {
      final remainingTime = StopWatchTimer.getDisplayTime(rawTime,
          milliSecond: false, hours: false);
      textKirim.value = remainingTime;
    });

    await Future.delayed(Duration(minutes: 5));
    isButtonEnabled.value = true;
    textKirim.value = "Kirim";
  }

  Future<void> reSendOtp(String email) async {
    try {
      isLoading.value = true;

      showLoadingPopup();
      final result = await ForgetPasswordService().sendOtpSv(email);
      resetLoading();

      if (result.status == "success") {
        resetLoading();
        isSnackbarOpen.value = true;
        Get.snackbar("Berhasil", "OTP baru telah dikirim ke $email",
            duration: Duration(seconds: delaySnackbar));
        Future.delayed(Duration(seconds: 2), () {
          isSnackbarOpen.value = false;
        });
      }
    } catch (e) {
      resetLoading();
      isSnackbarOpen.value = true;
      Get.snackbar("Error", e.toString(),
          duration: Duration(seconds: delaySnackbar));
      Future.delayed(Duration(seconds: 2), () {
        isSnackbarOpen.value = false;
      });
    }
  }

  Future<void> checkOtp() async {
    logger.d("checking");
    isLoading.value = true;

    final otp = otpController.text.trim();
    logger.d(otp);

    if (otp.length < 4) {
      resetLoading();
      isSnackbarOpen.value = true;
      Get.snackbar("Error", "OTP harus lengkap",
          duration: Duration(seconds: delaySnackbar));
      Future.delayed(Duration(seconds: 2), () {
        isSnackbarOpen.value = false;
      });
      return;
    }

    showLoadingPopup();
    bool success = await forgetPasswordService.checkOtp(email, otp);
    resetLoading();

    logger.d(success);

    if (success) {
      // resetLoading();
      Get.offNamed("/auth/forget-password/step3", arguments: email);
      logger.d(email);
    } else {
      resetLoading();
      isSnackbarOpen.value = true;
      Get.snackbar("Gagal", "OTP salah atau kadaluwarsa");
      Future.delayed(Duration(seconds: 2), () {
        isSnackbarOpen.value = false;
      });
    }
  }

  void resetLoading() {
    hideLoadingPopup();
    isLoading.value = false;
  }
}
