import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final storedName = ''.obs;
  final storedNim = ''.obs;
  final _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  void loadHeader() {
    String? nama = _box.read("user_nama");
    String? nim = _box.read("user_nim");
    storedName.value = nama ?? "No name found";
    storedNim.value = nim ?? "No nim found";
  }
}
