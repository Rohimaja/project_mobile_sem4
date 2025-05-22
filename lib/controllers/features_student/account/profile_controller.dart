import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';

class ProfileController extends GetxController {
  final storedName = ''.obs;
  final storedNim = ''.obs;
  final storedEmail = ''.obs;
  final storedProdi = ''.obs;
  final storedNamaProdi = ''.obs;
  var storedProfile = ''.obs;

  final url = ApiConstants.pathProfile;

  final _box = GetStorage();

  final log = Logger();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  Future<void> loadHeader() async {
    String? nama = _box.read("user_nama");
    String? nim = _box.read("user_nim");
    String? email = _box.read("user_email");
    String? namaProdi = _box.read("nama_prodi");
    int? idProdi = _box.read("id_prodi");
    String profile = _box.read("foto");

    storedName.value = nama ?? 'No name found';
    storedNim.value = nim ?? 'No nim found';
    storedEmail.value = email ?? 'No email found';
    storedNamaProdi.value = namaProdi ?? 'No name prodi found';
    storedProdi.value = idProdi.toString();
    final profileUrl =
        "$url${profile}?v=${DateTime.now().millisecondsSinceEpoch}";
    storedProfile.value = profileUrl;
  }

  void logout() {
    _box.erase();
    Get.offAllNamed("/");
    log.d(_box.read("user_name"));
  }
}
