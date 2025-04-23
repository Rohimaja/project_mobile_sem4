import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final storedName = ''.obs;
  final storedNim = ''.obs;
  final storedEmail = ''.obs;
  final storedProdi = ''.obs;

  final _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  void loadHeader() {
    String? nama = _box.read("user_nama");
    String? nim = _box.read("user_nim");
    String? email = _box.read("user_email");
    int? idProdi = _box.read("id_prodi");

    storedName.value = nama ?? 'No name found';
    storedNim.value = nim ?? 'No nim found';
    storedEmail.value = email ?? 'No email found';
    storedProdi.value = idProdi.toString();
  }
}
