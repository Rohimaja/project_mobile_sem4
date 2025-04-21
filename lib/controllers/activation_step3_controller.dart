import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ActivationStep3Controller extends GetxController {
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isPasswordVisible2 = false.obs;

  void checkVisible() => isPasswordVisible.value = !(isPasswordVisible.value);
  void checkVisible2() => isPasswordVisible2.value = !(isPasswordVisible2.value);
}
