import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/student/get_presence_model.dart';
import 'package:stipres/screens/reusable/loading_screen.dart';
import 'package:stipres/services/presence_content_service.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

enum StatusPresensi { hadir, ijin, sakit }

class PresenceContentController extends GetxController {
  final _box = GetStorage();
  Logger log = Logger();

  final alasanController = TextEditingController();
  var jumlahKarakter = 0.obs;
  final int maksKarakter = 200;

  final statusAbsen = 0.obs;

  var status = Rxn<StatusPresensi>();
  var presence = GetPresenceApi().obs;
  final PresenceContentService presenceContentService =
      PresenceContentService();

  var presensiId = ''.obs;
  var presensisId = 0.obs;
  var errorMessage = ''.obs;

  var statusData = false.obs;

  @override
  void onInit() {
    super.onInit();
    alasanController.addListener(hitungKarakter);
    presensiId.value = Get.arguments[0];
    presensisId.value = Get.arguments[1] as int;
    log.d(presensiId);
  }

  @override
  void onReady() {
    super.onReady();
    if (presensiId.value.isNotEmpty) {
      checkAttendanceTime();
    } else {}
  }

  @override
  void onClose() {
    alasanController.dispose();
    super.onClose();
  }

  void hitungKarakter() {
    final text = alasanController.text;
    jumlahKarakter.value = text.length;

    if (jumlahKarakter > maksKarakter) {
      alasanController.text = text.substring(0, maksKarakter);
      alasanController.selection = TextSelection.fromPosition(
        TextPosition(offset: maksKarakter),
      );
    }
  }

  bool validate() {
    if (status.value == null) {
      showError("Silakan pilih status presensi terlebih dahulu.");
      return false;
    }
    if ((status.value == StatusPresensi.ijin ||
            status.value == StatusPresensi.sakit) &&
        alasanController.text.trim().isEmpty) {
      showError("Silakan isi alasan ketidakhadiran.");
      return false;
    }
    return true;
  }

  void submitPresence() async {
    if (!validate()) return;

    showLoading();
    await checkPresence();
  }

  Future<void> checkPresence() async {
    try {
      var mahasiswaId = _box.read("mahasiswa_id");

      if (status.value == StatusPresensi.hadir) {
        statusAbsen.value = 1;
      } else if (status.value == StatusPresensi.ijin) {
        statusAbsen.value = 2;
      } else if (status.value == StatusPresensi.sakit) {
        statusAbsen.value = 3;
      } else {
        statusAbsen.value = 0;
      }
      var waktuPresensi = await checkTime();

      waktuPresensi = formatWaktuPresensi(waktuPresensi);
      log.d("${statusAbsen.value}");
      log.d("${mahasiswaId}");
      log.d("${waktuPresensi}");
      log.d("${alasanController.text}");

      final alasan =
          alasanController.text.isEmpty ? null : alasanController.text;

      final result = await presenceContentService.checkPresence(
          mahasiswaId, presensisId, statusAbsen.value, waktuPresensi, alasan);

      if (result.status == "success") {
        Get.back();
        Get.snackbar("Berhasil", "${result.message}",
            duration: Duration(seconds: 1));
        Get.toNamed("/student/base-screen");
      } else {
        showError("$result.message");
      }
    } catch (e) {
      log.d("Error: $e");
    }
  }

  Future<void> checkAttendanceTime() async {
    try {
      int mahasiswaId = _box.read('mahasiswa_id');
      log.d(mahasiswaId);
      log.d(presensiId);

      final result = await presenceContentService.getPresenceContent(
          mahasiswaId, presensiId.value);

      if (result.status == "success" && result.data != null) {
        final data = result.data!;
        log.d(data);

        presence.value = GetPresenceApi(
            durasiPresensi: data.durasiPresensi,
            tglPresensi: data.tglPresensi,
            namaMatkul: data.namaMatkul,
            kodeMatkul: data.kodeMatkul);

        final isOnSchedule =
            await checkPresenceTime(data.tglPresensi!, data.durasiPresensi!);
        log.d("hasil schedule: $isOnSchedule");
        if (!isOnSchedule) {
          // Get.offNamed("/student/fallback-screen", arguments: "inComing");
          log.d("tgl: ${data.tglPresensi}");
          log.d("durasi: ${data.durasiPresensi}");
          statusData.value = false;
        } else {
          statusData.value = true;
        }
      } else {
        errorMessage.value = result.message;
      }
    } catch (e) {
      log.d("Error: $e");
    }
  }

  Future<bool> checkPresenceTime(
      DateTime tglPresensi, String durasiPresensi) async {
    try {
      final now = await checkTime();

      if (now.year != tglPresensi.year ||
          now.month != tglPresensi.month ||
          now.day != tglPresensi.day) {
        return false;
      }

      final times = durasiPresensi.split('-');
      if (times.length != 2) return false;

      final startTimeString = times[0].trim();
      final endTimeString = times[1].trim();

      final startParts = startTimeString.split(':');
      final endParts = endTimeString.split(':');

      log.d("startparts: $startParts");

      final startTime = DateTime(
        tglPresensi.year,
        tglPresensi.month,
        tglPresensi.day,
        int.parse(startParts[0]),
        int.parse(startParts[1]),
      );

      final endTime = DateTime(
        tglPresensi.year,
        tglPresensi.month,
        tglPresensi.day,
        int.parse(endParts[0]),
        int.parse(endParts[1]),
      );
      log.d("now: $now");
      log.d("startTime: $startTime");
      log.d("endTime: $endTime");

      if (now.isBefore(startTime) || now.isAfter(endTime)) {
        return false;
      }

      return true;
    } catch (e) {
      log.d("chekPresenceTime error: $e");
      return false;
    }
  }

  Future<dynamic> checkTime() async {
    tzdata.initializeTimeZones();
    var jakarta = tz.getLocation("Asia/Jakarta");
    var timeNow = tz.TZDateTime.now(jakarta);
    return timeNow;
  }

  String formatWaktuPresensi(DateTime waktu) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(waktu);
  }

  void showLoading() {
    Get.dialog(
      const LoadingPopup(),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
    );
  }

  void showError(String message) {
    Get.defaultDialog(
      title: "Validasi",
      middleText: message,
      textConfirm: "OK",
      onConfirm: () {
        Get.back();
      },
    );
  }
}
