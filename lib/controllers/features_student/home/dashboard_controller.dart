import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/student/jadwal_model.dart';
import 'package:stipres/screens/features_student/models/schedule_model.dart';
import 'package:stipres/services/dashboard_mahasiswa_service.dart';

class DashboardController extends GetxController {
  final storedName = ''.obs;
  final storedNim = ''.obs;
  final _box = GetStorage();

  Logger log = Logger();

  var jadwalList = <JadwalModel>[].obs;

  var errorMessage = ''.obs;

  String nim = '';

  final DashboardMahasiswaService dashboardMahasiswaService =
      DashboardMahasiswaService();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
    fetchJadwal();
  }

  void loadHeader() {
    String? nama = _box.read("user_nama");
    String nim = _box.read("user_nim");
    storedName.value = nama ?? "No name found";
    storedNim.value = nim;
  }

  void fetchJadwal() async {
    String nim = _box.read("user_nim");
    log.d(nim);
    final result = await dashboardMahasiswaService.tampilJadwalHariIni(nim);

    if (result.status == "success" && result.data != null) {
      final List<JadwalModelApi> updatedList = result.data!.map((jadwal) {
        jadwal.waktu = ("${jadwal.waktu} WIB").toString();
        jadwal.durasiMatkul = ("${jadwal.durasiMatkul} Jam").toString();
        if (jadwal.lokasi == null) {
          jadwal.lokasi = "Online";
          jadwal.chips.remove("Materi");
          jadwal.chips.add("'Presensi', 'Zoom'");
        }
        return jadwal;
      }).toList();

      // jadwalList.value = updatedList;
    } else {
      errorMessage.value = result.message;
    }
  }
}
