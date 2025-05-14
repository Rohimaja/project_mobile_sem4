import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/student/rekap_model.dart';
import 'package:stipres/services/student/rekap_mahasiswa_service.dart';

class RekapController extends GetxController {
  final _box = GetStorage();

  Logger log = Logger();

  var rekapList = <RekapModelApi>[].obs;

  final persentase = ''.obs;

  var errorMessage = ''.obs;

  final RekapMahasiswaService rekapMahasiswaService = RekapMahasiswaService();

  @override
  void onInit() {
    super.onInit();
    fetchRekap();
  }

  void fetchRekap() async {
    try {
      String nim = _box.read('user_nim');
      log.d(nim);
      final result = await rekapMahasiswaService.tampilRekap(nim);
      log.d(result);

      if (result.status == "success" && result.data != null) {
        final List<RekapModelApi> updatedList = result.data!.map((rekap) {
          final statusPresensi = rekap.status;

          switch (statusPresensi) {
            case 1:
              rekap.hadir = (rekap.hadir ?? 0) + 1;
              break;
            case 2:
              rekap.izin = (rekap.izin ?? 0) + 1;
              break;
            case 3:
              rekap.sakit = (rekap.sakit ?? 0) + 1;
              break;
            case 0:
              rekap.alpa = (rekap.alpa ?? 0) + 1;
              break;
          }

          final totalPertemuan = (rekap.hadir ?? 0) +
              (rekap.izin ?? 0) +
              (rekap.sakit ?? 0) +
              (rekap.alpa ?? 0);

          double persentase = 0;

          log.d(totalPertemuan);

          if (totalPertemuan > 0) {
            persentase = ((rekap.hadir ?? 0) / totalPertemuan) * 100;
          }

          if (persentase % 1 == 0) {
            rekap.persentase = "${persentase.toInt()}";
          } else {
            rekap.persentase = "${persentase.toStringAsFixed(1)}";
          }

          log.d(rekap.persentase);

          log.d(rekap);

          return rekap;
        }).toList();
        rekapList.assignAll(updatedList);
        log.d(updatedList);
      } else {
        errorMessage.value = result.message;
      }
    } catch (e) {
      log.d("Errorr: $e");
    }
  }
}
