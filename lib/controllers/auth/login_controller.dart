import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/dosen_model.dart';
import 'package:stipres/models/mahasiswa_model.dart';
import 'package:stipres/services/biometric_auth_service.dart';
import 'package:stipres/services/login_service.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  final GetStorage _box = GetStorage();

  final Logger log = Logger();

  final mahasiswa = Rxn<Mahasiswa>();
  final dosen = Rxn<Dosen>();
  final loginService = LoginService();
  final biometricService = BiometricAuthService();
  final isBiometricEnabled = false.obs;
  final isSaveLoginInfo = false.obs;

  void checkVisible() => isPasswordVisible.toggle();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkStatusLogin();
      isBiometricEnabled.value = _box.read('isBiometricEnabled') ?? false;
      checkBiometricAvailability();
    });
  }

  void checkBiometricAvailability() async {
    final isAvailable = await biometricService.isBiometricAvailable();

    if (!isAvailable) {
      _box.write("isBiometricAvailable", false);
    }
  }

  Future<void> loginWithBiometric() async {
    final canUse = await biometricService.isBiometricAvailable();
    isBiometricEnabled.value = _box.read('isBiometricEnabled') ?? false;
    final enabled = isBiometricEnabled.value;
    isSaveLoginInfo.value = _box.read("isSaveLoginInfo") ?? false;

    log.d("canuse: $canUse");
    log.d("enabled: $enabled");

    if (!canUse || !enabled || !isSaveLoginInfo.value) {
      Get.snackbar("Biometrik tidak tersedia", "Pastikan fitur diaktifkan");
      return;
    }

    final success = await biometricService.authenticate();
    if (!success) {
      Get.snackbar("Gagal", "Autentikasi biometrik gagal");
      return;
    }

    final token = await biometricService.getBiometricToken();
    if (token != null) {}
  }

  void checkStatusLogin() {
    final statusUser = _box.read("logged");
    final statusUserRole = _box.read("role");

    if (statusUser == true) {
      if (statusUserRole == "mahasiswa") {
        Get.offAllNamed("/student/base-screen");
      } else if (statusUserRole == "dosen") {
        Get.offAllNamed("/lecturer/base-screen");
      }
    } else {}
  }

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
        _box.write("logged", true);
        _box.write("role", "dosen");
        Get.offAllNamed("/lecturer/base-screen");
        return;
      } else {
        Get.snackbar("Gagal", "Login gagal");
      }

      isLoading.value = false;
    } else {
      final result = await loginService.loginMahasiswa(username, password);

      if (result != null) {
        mahasiswa.value = result;
        log.d("nama log ${_box.read("user_name")}");
        _box.write("logged", true);
        _box.write("role", "mahasiswa");
        Get.offAllNamed("/student/base-screen");
      } else {
        Get.snackbar("Gagal", "Login gagal");
      }

      isLoading.value = false;
    }
  }
}
