import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/lecturers/active_school_year_model.dart';
import 'package:stipres/models/lecturers/data_prodi_model.dart';
import 'package:stipres/models/lecturers/matkul_model.dart';
import 'package:stipres/models/lecturers/presence_request_model.dart';
import 'package:stipres/services/lecturer/add_presence_lecturer_service.dart';

class AddPresenceController extends GetxController {
  final dosenId = 0.obs;
  final selectedSemester = ''.obs;
  final idMatkul = ''.obs;
  final tahunAjaran = ''.obs;
  final tahunAjaranId = ''.obs;
  final isEnabled = true.obs;
  final selectedDate = Rx<DateTime?>(null);
  final jamAwal = Rx<TimeOfDay?>(null);
  final jamAkhir = Rx<TimeOfDay?>(null);
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

  // void uploadPresence() async {
  //   try {
  //     final result = await addPresenceLecturerService.uploadPresensi(
  //         PresenceRequest(
  //             presensiId: presensiId,
  //             tglPresensi: selectedDate.value!.toString(),
  //             jamAwal: jamAwal.value.toString(),
  //             jamAkhir: jamAkhir.value.toString(),
  //             dosenId: dosenId.value,
  //             prodiId: int.parse(selectedProdiMap['id']!),
  //             semester: int.parse(selectedSemester.value),
  //             matkulId: int.parse(selectedMatkulMap['id']!),
  //             tahunAjaranId: int.parse(tahunAjaranId.value),
  //             linkZoom: linkZoomController.text));
  //   } catch (e) {
  //     log.f("Error: $e");
  //   }
  // }

  void submitPresence() {
    if (validatePresence() == true) {
      // uploadPresence();
    }
  }

  bool validatePresence() {
    log.d("SelectedProdi: ${selectedProdiName.value}");
    log.d("SelectedProdi: ${selectedProdiMap['id']}");
    log.d("SelectedMatkul: ${selectedMatkulMap['id']}");
    log.d("TahunAjar Id: ${tahunAjaranId.value}");
    if (selectedProdiName.isEmpty ||
        selectedSemester.isEmpty ||
        tahunAjaranId.isEmpty ||
        selectedMatkul.isEmpty ||
        idMatkul.isEmpty ||
        selectedDate.value == null ||
        jamAwal.value == null ||
        jamAkhir.value == null ||
        linkZoomController.text.isEmpty) {
      Get.snackbar("Gagal", "Mohon lengkapi semua data wajib");
      return false;
    }

    final awal = timeOfDayToString(jamAwal.value!);
    final akhir = timeOfDayToString(jamAkhir.value!);

    if (awal == akhir) {
      Get.snackbar("Gagal", "Jam akhir harus setelah jam awal",
          duration: Duration(seconds: 1));
      return false;
    } else if (!isAfter(jamAkhir.value!, jamAwal.value!)) {
      Get.snackbar("Gagal", "Jam akhir harus setelah jam awal",
          duration: Duration(seconds: 1));
      return false;
    }

    return true;
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
}
