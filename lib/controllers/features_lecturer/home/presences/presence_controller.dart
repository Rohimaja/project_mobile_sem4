import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/lecturers/presence_model.dart';
import 'package:stipres/screens/reusable/loading_screen.dart';
import 'package:stipres/services/lecturer/presence_lecturer_service.dart';

class PresenceController extends GetxController {
  final _box = GetStorage();
  Logger log = Logger();

  final errorMessage = ''.obs;
  var jamAwal = Rx<TimeOfDay?>(null);
  var jamAkhir = Rx<TimeOfDay?>(null);

  var presenceList = <PresensiDosenModel>[].obs;
  final PresenceLecturerService presenceLecturerService =
      PresenceLecturerService();

  @override
  void onReady() {
    super.onReady();
    String dosenId = _box.read("dosen_id").toString();
    fetchPresence(dosenId);
  }

  void fetchPresence(String dosenId) async {
    try {
      final result = await presenceLecturerService.fetchPresence(dosenId);
      log.d(result.data);

      if (result.status == "success" && result.data != null) {
        final List<PresensiDosenModel> updatedList =
            result.data!.map((presence) {
          if (presence.namaRuangan == null) {
            presence.namaRuangan = "-";
          } else {
            presence.namaRuangan = presence.namaRuangan;
          }
          presence.durasiPresensi =
              "${presence.jamAwal} - ${presence.jamAkhir} WIB";
          return presence;
        }).toList();
        presenceList.assignAll(updatedList);
      } else {
        errorMessage.value = result.message;
      }
    } catch (e) {
      log.f("Error: $e");
      Get.snackbar("Error", "Terjadi kesalahan $e");
    }
  }

  bool validateUpdate(String awal, String akhir) {
    final newAwal = timeOfDayToString(jamAwal.value!);
    final newAkhir = timeOfDayToString(jamAkhir.value!);

    if (newAwal == awal && newAkhir == akhir) {
      Get.back();
      Get.snackbar("Gagal", "Harus ada perbedaan jam",
          duration: Duration(seconds: 1));
      return false;
    } else if (!isAfter(jamAkhir.value!, jamAwal.value!)) {
      Get.back();
      Get.snackbar("Gagal", "Jam akhir harus setelah jam awal",
          duration: Duration(seconds: 1));
      return false;
    }
    return true;
  }

  Future<void> updatePresence(String presensisId) async {
    try {
      final awal = timeOfDayToString(jamAwal.value!);
      final akhir = timeOfDayToString(jamAkhir.value!);
      log.d(awal);
      log.d(akhir);

      showLoading();
      final result = await presenceLecturerService.updatePresence(
          presensisId, awal, akhir);
      if (result.status == "success") {
        Get.back();
        String dosenId = _box.read("dosen_id").toString();
        fetchPresence(dosenId);
      } else {
        Get.back();
        Get.snackbar("Error", result.message, duration: Duration(seconds: 1));
      }
    } catch (e) {
      Get.back();
      log.f("Error: $e");
      Get.snackbar("Error", "Terjadi kesalahan $e",
          duration: Duration(seconds: 1));
    }
  }

  Future<void> deletePresence(String presensisId) async {
    try {
      showLoading();
      final result = await presenceLecturerService.deletePresence(presensisId);
      if (result.status == "success") {
        Get.back();
        String dosenId = _box.read("dosen_id").toString();
        fetchPresence(dosenId);
      } else {
        Get.back();
        Get.snackbar("Error", result.message, duration: Duration(seconds: 1));
      }
    } catch (e) {
      Get.back();
      log.f("Error: $e");
      Get.snackbar("Error", "Terjadi kesalahan $e",
          duration: Duration(seconds: 1));
    }
  }

  bool isAfter(TimeOfDay a, TimeOfDay b) {
    if (a.hour > b.hour) return true;
    if (a.hour == b.hour && a.minute > b.minute) return true;
    return false;
  }

  String timeOfDayToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  TimeOfDay stringToTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  void setInitialTime(String awal, String akhir) {
    jamAwal.value = stringToTimeOfDay(awal);
    jamAkhir.value = stringToTimeOfDay(akhir);
  }

  void showLoading() {
    Get.dialog(
      const LoadingPopup(),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
    );
  }
}
