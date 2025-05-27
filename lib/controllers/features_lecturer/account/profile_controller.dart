import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart' show Logger;
import 'package:stipres/constants/api.dart';

class ProfileController extends GetxController {
  final storedName = ''.obs;
  final storedNip = ''.obs;
  final storedEmail = ''.obs;
  var storedProfile = ''.obs;

  final url = ApiConstants.path;

  final _box = GetStorage();
  final log = Logger();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  Future<void> loadHeader() async {
    log.d("Fetch profile controller");
    String? nama = _box.read("user_nama");
    String? nip = _box.read("user_nip");
    String? email = _box.read("user_email");
    String? profile = _box.read("foto");
    log.d("profile: $profile");

    storedName.value = nama ?? 'No name found';
    storedNip.value = nip ?? 'No nim found';
    storedEmail.value = email ?? 'No email found';
    final profileUrl =
        "$url${profile}?v=${DateTime.now().millisecondsSinceEpoch}";
    storedProfile.value = profileUrl;
  }

  void logout() {
    _box.erase();
    Get.offAllNamed("/");
  }
}
