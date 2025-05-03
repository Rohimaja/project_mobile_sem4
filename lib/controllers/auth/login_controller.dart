import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stipres/models/dosen_model.dart';
import 'package:stipres/models/mahasiswa_model.dart';
import 'package:stipres/services/login_service.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  final mahasiswa = Rxn<Mahasiswa>();
  final dosen = Rxn<Dosen>();
  final loginService = LoginService();

  void checkVisible() => isPasswordVisible.toggle();

  void login() async {
    isLoading.value = true;

    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "NIM dan Password tidak boleh kosong");
      isLoading.value = false;
      return;
    }

    final pass = password.length;
    if (pass <= 7) {
      Get.snackbar(
        "Gagal",
        "Masukkan lebih dari 7 huruf password",
      );
      return;
    }

    if (username.contains('@')) {
      final result = await loginService.loginDosen(username, password);

      if (result != null) {
        dosen.value = result;
        Get.snackbar("Berhasil", "Login berhasil sebagai ${result.nama}");
        Get.offAllNamed("/lecturer/base-screen");
        return;
      } else {
        Get.snackbar("Gagal", "Login gagal");
      }

      isLoading.value = false;
    }

    final result = await loginService.loginMahasiswa(username, password);

    if (result != null) {
      mahasiswa.value = result;
      Get.snackbar("Berhasil", 'Login berhasil sebagai ${result.nama}');
      Get.offAllNamed("/student/base-screen");
    } else {
      Get.snackbar("Gagal", "Login gagal");
    }

    isLoading.value = false;
  }

  // bool isLoggedIn() {
  //   return loginService.isLoggedIn();
  // }
}
