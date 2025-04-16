import 'package:get/get.dart';

class LoginController extends GetxController {
  final isPasswordVisible = false.obs;

  void checkVisible() => isPasswordVisible.value = !(isPasswordVisible.value);
}
