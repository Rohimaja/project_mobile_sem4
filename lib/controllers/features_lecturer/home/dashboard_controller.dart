import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/jadwal_model.dart';
import 'package:stipres/services/lecturer/dashboard_lecturer_service.dart';

class DashboardController extends GetxController {
  final storedName = ''.obs;
  final storedNip = ''.obs;
  final _box = GetStorage();

  final statusOffline = false.obs;
  Logger log = Logger();
  var jadwalList = <JadwalModelApi>[].obs;
  var errorMessage = ''.obs;

  final DashboardLecturerService dashboardLecturerService =
      DashboardLecturerService();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  void loadHeader() {
    String? nama = _box.read("user_nama");
    String? nip = _box.read("user_nip");
    log.d(_box.read("user_nama"));
    log.d(_box.read("user_nip"));
    storedName.value = nama ?? "No name found";
    storedNip.value = nip ?? "No name found";
  }

  Future<void> fetchSchedule() async {
    try {
      int dosenId = _box.read("dosen_id");
      log.d(dosenId);

      final result =
          await dashboardLecturerService.tampilJadwalHariIni(dosenId);
      log.d(result);

      if (result.status == "success" && result.data != null) {
        final List<JadwalModelApi> updatedList = result.data!.map((jadwal) {
          jadwal.waktu = ("${jadwal.waktu} WIB").toString();
          jadwal.durasiMatkul = ("${jadwal.durasiMatkul} Jam").toString();
          if (jadwal.lokasi == null) {
            jadwal.lokasi = "-";
            jadwal.keterangan = "Daring";
            statusOffline.value = false;
          } else {
            statusOffline.value = true;
            jadwal.keterangan = "Luring";
          }

          log.d(jadwal);
          return jadwal;
        }).toList();
        jadwalList.value = updatedList;
      } else {
        errorMessage.value = result.message;
      }
    } catch (e) {
      log.e("Error: $e");
    }
  }
}
