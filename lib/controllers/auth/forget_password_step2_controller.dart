import 'dart:async';

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

  final otpController = TextEditingController();
  final forgetPasswordService = ForgetPasswordService();

  var isLoading = false.obs;

  late StopWatchTimer resendTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(5));

  var textKirim = 'Kirim'.obs;
  var statusMessage = ''.obs;

  // final GetStorage _box = GetStorage();

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

      await ForgetPasswordService().sendOtpSv(email);
      hideLoadingPopup();
      isLoading.value = false;
      // Get.offNamed("/auth/forget-password/step2");
      Get.snackbar("Berhasil", "OTP baru telah dikirim ke $email");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> checkOtp() async {
    logger.d("checking");
    isLoading.value = true;
    showLoadingPopup();

    final otp = otpController.text.trim();
    logger.d(otp);

    if (otp.length < 4) {
      hideLoadingPopup();
      Get.snackbar("Error", "OTP harus lengkap");
      isLoading.value = false;
      return;
    }

    bool success = await forgetPasswordService.checkOtp(email, otp);
    if (success) {
      hideLoadingPopup();
      Get.toNamed("/auth/forget-password/step3", arguments: email);
    } else {
      hideLoadingPopup();
      Get.snackbar("Gagal", "OTP salah atau kadaluwarsa");
    }
  }
}
