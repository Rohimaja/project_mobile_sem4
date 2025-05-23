import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/lecturers/detail_student_presence_model.dart';
import 'package:stipres/models/lecturers/list_detail_biodata.model.dart';
import 'package:stipres/models/lecturers/list_detail_presence_model.dart';
import 'package:stipres/screens/reusable/loading_screen.dart';
import 'package:stipres/services/lecturer/presence_detail_lecturer_service.dart';

class PresenceDetailController extends GetxController {
  final errorMessage = ''.obs;
  final storedProdi = ''.obs;
  final storedMatkul = ''.obs;
  final storedDurasiPresensi = ''.obs;

  Logger log = Logger();
  final url = ApiConstants.path;

  var studentList = <ListDetailPresensi>[].obs;
  Rxn<ListDetailBiodata> biodata = Rxn<ListDetailBiodata>();
  Rxn<DetailMahasiswaPresensi> detail = Rxn<DetailMahasiswaPresensi>();
  final PresenceDetailLecturerService presenceDetailLecturerService =
      PresenceDetailLecturerService();

  @override
  void onInit() {
    super.onInit();
    int presensisId = Get.arguments;
    fetchCourseDetail(presensisId.toString());
    fetchListStudent(presensisId.toString());
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

  void fetchListStudent(String presensisId) async {
    try {
      final result =
          await presenceDetailLecturerService.fetchStudent(presensisId);

      if (result.status == "success" && result.data != null) {
        final List<ListDetailPresensi> updatedList =
            result.data!.map((student) {
          int status = student.status!;
          switch (status) {
            case 1:
              (student.keterangan = "hadir");
              break;
            case 2:
              (student.keterangan = "izin");
              break;
            case 3:
              (student.keterangan = "sakit");
              break;
            default:
              (student.keterangan = "alpa");
              break;
          }
          return student;
        }).toList();
        studentList.assignAll(updatedList);
      } else {
        errorMessage.value = result.message;
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }

  Future<void> fetchBiodata(String nim) async {
    try {
      showLoading();
      biodata.value = null;
      final result = await presenceDetailLecturerService.fetchBiodata(nim);

      if (result.status == "success" && result.data != null) {
        if (result.data!.foto != null) {
          result.data!.foto = "${ApiConstants.path}${result.data!.foto}";
        }
        Get.back();
        biodata.value = result.data;
      } else {
        Get.back();
        errorMessage.value = result.message;
      }
    } catch (e) {
      Get.back();
      log.f("Error: $e");
    }
  }

  Future<void> fetchDetailMahasiswa(String nim) async {
    try {
      showLoading();
      detail.value = null;
      final result =
          await presenceDetailLecturerService.fetchDetailStudent(nim);

      if (result.status == "success" && result.data != null) {
        final data = result.data;

        int status = data!.status!;
        switch (status) {
          case 1:
            (data.keterangan = "Hadir");
            break;
          case 2:
            (data.keterangan = "Izin");
            break;
          case 3:
            (data.keterangan = "Sakit");
            break;
          default:
            (data.keterangan = "Alpa");
            break;
        }

        if (data.waktuPresensi != null) {
          data.waktu = "${DateFormat.Hm().format(data.waktuPresensi!)} WIB";
        } else {
          data.waktu = "-";
        }

        detail.value = result.data;
        Get.back();
      } else {
        Get.back();
        errorMessage.value = result.message;
      }
    } catch (e) {
      Get.back();
      log.f("Error: $e");
    }
  }

  void openBukti(String buktiPath) async {
    final ext = buktiPath.toLowerCase();
    if (ext.endsWith('.png') || ext.endsWith('.jpg') || ext.endsWith('.jpeg')) {
    } else {
      Get.back();
      Get.snackbar(
          "Tidak Didukung", "Tipe file belum didukung untuk ditampilkan.");
    }
  }

  void showLoading() {
    Get.dialog(
      const LoadingPopup(),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
    );
  }
}
