import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/student/jadwal_model.dart';
import 'package:stipres/services/dashboard_mahasiswa_service.dart';

class DashboardController extends GetxController {
  final storedName = ''.obs;
  final storedNim = ''.obs;
  final _box = GetStorage();

  final statusOffline = false.obs;

  Logger log = Logger();

  var jadwalList = <JadwalModelApi>[].obs;

  var errorMessage = ''.obs;

  final DashboardMahasiswaService dashboardMahasiswaService =
      DashboardMahasiswaService();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  void loadHeader() {
    String? nama = _box.read("user_nama");
    String nim = _box.read("user_nim");
    storedName.value = nama ?? "No name found";
    storedNim.value = nim;
  }

  Future<void> fetchJadwal() async {
    log.d("fetch jadwal");
    String nim = _box.read("user_nim");
    log.d(nim);
    final result = await dashboardMahasiswaService.tampilJadwalHariIni(nim);
    log.d(result);

    if (result.status == "success" && result.data != null) {
      final List<JadwalModelApi> updatedList = result.data!.map((jadwal) {
        jadwal.waktu = ("${jadwal.waktu} WIB").toString();
        jadwal.durasiMatkul = ("${jadwal.durasiMatkul} Jam").toString();
        if (jadwal.lokasi == null) {
          jadwal.lokasi = "Online";
          statusOffline.value = false;
        } else {
          statusOffline.value = true;
        }

        log.d("Status offline: ${statusOffline.value}");

        log.d(jadwal);
        return jadwal;
      }).toList();
      jadwalList.value = updatedList;
    } else {
      errorMessage.value = result.message;
    }
  }

  void buttonAction(JadwalModelApi jadwal) {
    if (jadwal.lokasi == "Online") {
      Get.toNamed("/student/presence-content-screen",
          arguments: [jadwal.presensiId]);
    } else {
      Get.toNamed("/student/offline-screen");
    }
  }
}
