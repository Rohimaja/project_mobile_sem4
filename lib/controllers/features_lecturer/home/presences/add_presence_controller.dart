import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/lecturers/active_school_year_model.dart';
import 'package:stipres/models/lecturers/data_prodi_model.dart';
import 'package:stipres/models/lecturers/matkul_model.dart';
import 'package:stipres/models/lecturers/presence_request_model.dart';
import 'package:stipres/screens/reusable/loading_screen.dart';
import 'package:stipres/services/lecturer/add_presence_lecturer_service.dart';

class AddPresenceController extends GetxController {
  final dosenId = 0.obs;
  final selectedSemester = ''.obs;
  final idMatkul = ''.obs;
  final tahunAjaran = ''.obs;
  final tahunAjaranId = 0.obs;
  final isEnabled = true.obs;
  final selectedDate = Rx<DateTime?>(null);
  final jamAwal = Rx<TimeOfDay?>(null);
  final jamAwalStr = ''.obs;
  final jamAkhir = Rx<TimeOfDay?>(null);
  final jamAkhirStr = ''.obs;
  final TextEditingController linkZoomController = TextEditingController();

  final selectedProdiName = ''.obs;
  final listProdi = <DataProdi>[].obs;
  final selectedProdiMap = <String, String>{}.obs;

  final selectedMatkul = ''.obs;
  final listMatkul = <MatkulModel>[].obs;
  final selectedMatkulMap = <String, String>{}.obs;

  final tahunAjar = <TahunAjaranAktif>{}.obs;

  final Logger log = Logger();
  final GetStorage _box = GetStorage();

  final AddPresenceLecturerService addPresenceLecturerService =
      AddPresenceLecturerService();

  @override
  void onInit() {
    super.onInit();
    dosenId.value = _box.read("dosen_id");
    fetchProdi();
    fetchTahunAjaran();
  }

  void validateMatkul() async {
    final idProdi = selectedProdiMap['id'];
    final semester = selectedSemester.value;
    if (semester.isNotEmpty && idProdi != null) {
      fetchMatkul(idProdi, semester);
    } else {
      null;
    }
  }

  void fetchMatkul(String prodiId, String semester) async {
    try {
      listMatkul.clear();
      final result =
          await addPresenceLecturerService.fetchMatkul(prodiId, semester);

      if (result.status == "success") {
        final matkulList = result.data!.whereType<MatkulModel>().toList();
        listMatkul.assignAll(matkulList);

        if (selectedMatkul.value.isNotEmpty) {
          final stillExists = listMatkul
              .any((matkul) => matkul.namaMatkul == selectedMatkul.value);

          if (!stillExists) {
            selectedMatkul.value = "";
            selectedMatkulMap.value = {
              'id': '',
              'nama_matkul': '',
              'kode_matkul': '',
            };
          }
        }
      } else {
        log.e(result.message);
        listMatkul.clear;
        selectedMatkul.value = "";
        selectedMatkulMap.value = {
          'id': '',
          'nama_matkul': '',
          'kode_matkul': '',
        };
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }

  void fetchTahunAjaran() async {
    try {
      final result = await addPresenceLecturerService.fetchTahunAjaran();

      if (result.status == "success" && result.data != null) {
        final tahunList = result.data!;
        tahunAjaran.value =
            "${tahunList.tahunAwal}/${tahunList.tahunAkhir} ${tahunList.keterangan}";
        tahunAjaranId.value = tahunList.id ?? 0;
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }

  void fetchProdi() async {
    try {
      final result = await addPresenceLecturerService.fetchProdi();

      if (result.status == "success" && result.data != null) {
        final prodiList = result.data!.whereType<DataProdi>().toList();
        listProdi.assignAll(prodiList);
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }

  Future<String> getPresensiId() async {
    try {
      final result = await addPresenceLecturerService.getPresensiId();

      if (result.status == "success" && result.data != null) {
        final responPresence = result.data!;
        final year = responPresence.tahun;
        final lastInc = responPresence.lastIncrement! + (1);
        final presenceId = "TR$year${lastInc.toString().padLeft(4, '0')}";
        return presenceId;
      } else {
        return '';
      }
    } catch (e) {
      log.f("Error: $e");
      return '';
    }
  }

  Future<bool> checkPresence(int prodiId, int semester, String jamAwal,
      String jamAkhir, String tglPresensi) async {
    try {
      final result = await addPresenceLecturerService.checkPresence(
          prodiId, semester, jamAwal, jamAkhir, tglPresensi);

      if (result.status == "conflict") {
        final statusPresence = result.data;
        final tgl = statusPresence!.tanggalPresensi!.toString();
        final durasi = statusPresence.durasiPresensi;

        Get.snackbar("Conflict",
            "Pada tanggal $tgl sudah terdapat absensi di jam $durasi");

        return false;
      } else if (result.status == "no_conflict") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log.f("Error: $e");
      return false;
    }
  }

  void uploadPresence(String presensiId) async {
    try {
      showLoading();
      final result = await addPresenceLecturerService.uploadPresensi(
          PresenceRequest(
              presensiId: presensiId,
              tglPresensi: selectedDate.value!.toString(),
              jamAwal: jamAwalStr.value,
              jamAkhir: jamAkhirStr.value,
              dosenId: dosenId.value,
              prodiId: int.parse(selectedProdiMap['id']!),
              semester: int.parse(selectedSemester.value),
              matkulId: int.parse(selectedMatkulMap['id']!),
              tahunAjaranId: tahunAjaranId.value,
              linkZoom: linkZoomController.text.trim()));

      if (result.status == "success") {
        Get.back();
        Get.back();
        isEnabled.value = false;
        Get.snackbar("Sukses", "Data Presensi berhasil ditambahkan");
        Future.delayed(
          Duration(seconds: 3),
          () => isEnabled.value = true,
        );
      } else {
        Get.back();
        isEnabled.value = false;
        Get.snackbar("Gagal", result.message);
        Future.delayed(
          Duration(seconds: 3),
          () => isEnabled.value = true,
        );
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }

  void submitPresence() async {
    if (validatePresence() == true) {
      final isConflictFree = await checkPresence(
          int.parse(selectedProdiMap['id']!),
          int.parse(selectedSemester.value),
          jamAwalStr.value,
          jamAkhirStr.value,
          selectedDate.value!.toString());

      if (isConflictFree) {
        final presensiId = await getPresensiId();
        log.d("Presensi Id : $presensiId");
        uploadPresence(presensiId);
      }
    }
  }

  bool validatePresence() {
    jamAwalStr.value = timeOfDayToString(jamAwal.value!);
    jamAkhirStr.value = timeOfDayToString(jamAkhir.value!);
    final awal = timeOfDayToString(jamAwal.value!);
    final akhir = timeOfDayToString(jamAkhir.value!);

    log.d("Dosen ID:  ${dosenId.value}");
    log.d("SelectedProdi id: ${selectedProdiMap['id']}");
    log.d("SelectedMatkul id: ${selectedMatkulMap['id']}");
    log.d("semester: ${selectedSemester.value}");
    log.d("TahunAjar Id: ${tahunAjaranId.value}");
    log.d("selectedDate : ${selectedDate.value}");
    log.d("Jam Awal : ${jamAwal.value}");
    log.d("Jam Akhir : ${jamAkhir.value}");
    log.d("Jam Awal Str : ${jamAwalStr.value}");
    log.d("Jam Akhir Str: ${jamAkhirStr.value}");
    log.d("LinkZoom : ${linkZoomController.text}");
    if (!selectedProdiMap.containsKey('id') ||
        selectedProdiMap['id'] == null ||
        selectedProdiMap['id']!.isEmpty ||
        selectedSemester.isEmpty ||
        !selectedMatkulMap.containsKey('id') ||
        selectedMatkulMap['id'] == null ||
        selectedMatkulMap['id']!.isEmpty ||
        tahunAjaranId.value == 0 ||
        selectedDate.value == null ||
        jamAwal.value == null ||
        jamAkhir.value == null ||
        jamAwalStr.value.isEmpty ||
        jamAkhirStr.value.isEmpty ||
        linkZoomController.text.isEmpty) {
      isEnabled.value = false;
      Get.snackbar("Gagal", "Mohon lengkapi semua data wajib",
          duration: Duration(seconds: 2));
      Future.delayed(
        Duration(seconds: 3),
        () => isEnabled.value = true,
      );
      return false;
    } else if (!isAfter(jamAkhir.value!, jamAwal.value!) || awal == akhir) {
      isEnabled.value = false;
      Get.snackbar("Gagal", "Jam akhir harus setelah jam awal",
          duration: Duration(seconds: 2));
      Future.delayed(
        Duration(seconds: 3),
        () => isEnabled.value = true,
      );
      return false;
    } else {
      return true;
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

  void showLoading() {
    Get.dialog(
      const LoadingPopup(),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
    );
  }
}
