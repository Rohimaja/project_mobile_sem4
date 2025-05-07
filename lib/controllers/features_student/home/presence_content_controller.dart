import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/student/get_presence_model.dart';
import 'package:stipres/services/presence_content_service.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class PresenceContentController extends GetxController {
  final _box = GetStorage();
  Logger log = Logger();

  final errorMessage = ''.obs;

  var presenceList = <GetPresenceApi>[].obs;
  final PresenceContentService presenceContentService =
      PresenceContentService();

  String? presensiId;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is String) {
      presensiId = Get.arguments as String;
    } else if (Get.arguments is List<String>) {
      presensiId = (Get.arguments as List<String>).first;
    }
    // presensiId = Get.arguments;
    log.d(presensiId);
  }

  @override
  void onReady() {
    super.onReady();
    checkAttendanceTime();
  }

  Future<void> checkAttendanceTime() async {
    log.d("message");
    final wib = await checkTime();
    log.d(wib);

    String mahasiswaId = _box.read('mahasiswa_id');
    log.d(mahasiswaId);
    log.d(presensiId);

    final result = await presenceContentService.getPresenceContent(
        mahasiswaId, presensiId!);

    if (result.status == "success" && result.data != null) {
      final data = result.data!;

      log.d(data);

      presenceList.assignAll([
        GetPresenceApi(
            durasiPresensi: data.durasiPresensi,
            namaMatkul: data.namaMatkul,
            kodeMatkul: data.kodeMatkul,
            tglPresensi: data.tglPresensi)
      ]);

      data.tglPresensi;
      data.durasiPresensi;
    } else {
      errorMessage.value = result.message;
    }
  }

  Future<dynamic> checkTime() async {
    tzdata.initializeTimeZones();
    var jakarta = tz.getLocation("Asia/Jakarta");
    var timeNow = tz.TZDateTime.now(jakarta);
    return timeNow;
  }
}
