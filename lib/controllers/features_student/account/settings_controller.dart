import 'package:get/get.dart';
import 'package:stipres/services/biometric_auth_service.dart';

class SettingsController extends GetxController {
  final biometricService = BiometricAuthService();

  void checkAvalaiblityBiometric() async {
    final canUse = await biometricService.isBiometricAvailable();

    if (canUse == true) {
      Get.toNamed("/student/biometric-screen");
    } else {
      Get.snackbar("Gagal",
          "Fitur biometrik / sidik jari tidak tersedia pada perangkat anda");
    }
  }
}
