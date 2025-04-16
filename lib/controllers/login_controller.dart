import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stipres/models/user_model.dart';
import 'package:stipres/screens/features_student/home/dashboard.dart';
import 'package:stipres/services/login_service.dart';

class LoginController extends GetxController {
  final nimController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final user = Rxn<UserModel>();

  final loginService = LoginService();

  final isPasswordVisible = false.obs;

  void checkVisible() => isPasswordVisible.value = !(isPasswordVisible.value);

  void login() async {
    isLoading.value;

    final nim = nimController.text.trim();
    final password = passwordController.text.trim();

    if (nim.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "NIM dan Password tidak boleh kosong");
      isLoading.value = false;
      return;
    }

    final result = await loginService.login(nim, password);

    if (result != null) {
      user.value = result;
      Get.snackbar("Berhasil", 'Login berhasil sebagai ${result.nama}');
      Get.off(DashboardPage());
    } else {
      Get.snackbar("Gagal", "Login gagal");
    }

    isLoading.value = false;
  }

  bool isLoggedIn() {
    return loginService.isLoggedIn();
  }
}
