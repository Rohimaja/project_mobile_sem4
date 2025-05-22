import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/lecturers/header_detail_presence_model.dart';
import 'package:stipres/services/lecturer/presence_detail_lecturer_service.dart';

class PresenceDetailController extends GetxController {
  final errorMessage = ''.obs;
  final storedProdi = ''.obs;
  final storedMatkul = ''.obs;
  final storedDurasiPresensi = ''.obs;

  final _box = GetStorage();
  Logger log = Logger();

  final PresenceDetailLecturerService presenceDetailLecturerService =
      PresenceDetailLecturerService();

  @override
  void onInit() {
    super.onInit();
    int presensisId = Get.arguments;
    fetchCourseDetail(presensisId.toString());
  }

  void fetchCourseDetail(String presensisId) async {
    try {
      final result =
          await presenceDetailLecturerService.fetchHeader(presensisId);

      if (result.status == "success") {
        final header = result.data!;
        storedMatkul.value = header.namaMatkul;
        storedProdi.value = header.namaProdi;
        storedDurasiPresensi.value = header.durasiPresensi;
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }
}
