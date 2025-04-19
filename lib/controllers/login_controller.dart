import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stipres/models/user_model.dart';
import 'package:stipres/screens/features_student/home/base_screen.dart';
import 'package:stipres/services/login_service.dart';

class LoginController extends GetxController {
  final noController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final user = Rxn<UserModel>();

  final loginService = LoginService();

  final isPasswordVisible = false.obs;

  void checkVisible() => isPasswordVisible.value = !(isPasswordVisible.value);

  void login() async {
    isLoading.value = true;

    final nim = noController.text.trim();
    final password = passwordController.text.trim();

    if (nim.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "NIM/NIP dan Password tidak boleh kosong");
      isLoading.value = false;
      return;
    }

    final pass = password.length;
    if (pass <= 7) {
      Get.snackbar("Gagal", "Masukkan lebih dari 7 huruf password");
    }

    final result = await loginService.login(nim, password);

    if (result != null) {
      user.value = result;
      Get.snackbar("Berhasil", 'Login berhasil sebagai ${result.nama}');
      Get.off(BaseScreen());
    } else {
      Get.snackbar("Gagal", "Login gagal");
    }

    isLoading.value = false;
  }

  bool isLoggedIn() {
    return loginService.isLoggedIn();
  }
}
