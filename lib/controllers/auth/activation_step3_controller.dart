import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ActivationStep3Controller extends GetxController {
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isPasswordVisible2 = false.obs;

  void checkVisible() => isPasswordVisible.toggle();
  void checkVisible2() => isPasswordVisible2.toggle();
}
