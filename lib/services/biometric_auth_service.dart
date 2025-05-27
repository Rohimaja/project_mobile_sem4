import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';

class BiometricAuthService extends GetxService {
  final String _baseURL = "${ApiConstants.globalUrl}auth/login.php";
  final GetStorage _box = GetStorage();
  final FlutterSecureStorage _secure = FlutterSecureStorage();
  final Logger log = Logger();
  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    final canCheck = await localAuthentication.canCheckBiometrics;
    final isSupported = await localAuthentication.isDeviceSupported();
    final avalaibleBiometrics =
        await localAuthentication.getAvailableBiometrics();

    return canCheck && isSupported && avalaibleBiometrics.isNotEmpty;
  }

  Future<bool> authenticate() async {
    try {
      return await localAuthentication.authenticate(
          localizedReason: "Gunakan sidik jari untuk masuk",
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: true));
    } catch (e) {
      log.f("Error: $e");
      return false;
    }
  }

  Future<void> saveTokens({required String accessToken}) async {
    await _secure.write(key: 'access_token', value: accessToken);
    await _secure.write(key: 'biometric_token', value: accessToken);
    await _box.write('isBiometricEnabled', true);
  }

  Future<String?> getBiometricToken() async {
    return await _secure.read(key: "biometric_token");
  }

  Future<void> clearAccessToken() async {
    await _secure.delete(key: "access_token");
  }

  Future<bool> isBiometricEnabled() async {
    final value = await _secure.read(key: 'isBiometricEnabled');
    return value == null ? true : value == 'true';
  }
}
