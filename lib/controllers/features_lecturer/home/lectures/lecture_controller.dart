import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/lecturers/lecture_model.dart';
import 'package:stipres/services/lecturer/lecture_lecturer_service.dart';

class LectureController extends GetxController {
  final _box = GetStorage();
  Logger log = Logger();
  final errorMessage = ''.obs;

  var lectureList = <LecturerLectureModel>[].obs;
  final LectureLecturerService lectureLecturerService =
      LectureLecturerService();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments == null) {
      fetchLecture();
    } else {
      final presensisId = Get.arguments;
      // fetchContentLecture(presensisId);
    }
  }

  String formatTanggal(String tanggal) {
    try {
      DateTime date = DateFormat('dd-MM-yyyy').parse(tanggal);

      return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(date);
    } catch (e) {
      log.d("Error: $e");
      Get.snackbar("Error", "Terjadi error: $e");
      return tanggal;
    }
  }

  void fetchLecture() async {
    try {
      String dosenId = _box.read("dosen_id").toString();
      String namaDosen = _box.read("user_nama");
      log.d(namaDosen);
      log.d("Check Dosen Id: $dosenId");
      final result = await lectureLecturerService.tampilZoom(dosenId);
      log.f("fmalmfa;lmf");

      if (result.status == "success") {
        final List<LecturerLectureModel> updatedList =
            result.data!.map((lecture) {
          lecture.tglPresensi = formatTanggal(lecture.tglPresensi);
          lecture.namaDosen ??= namaDosen;
          log.f(lecture.namaDosen);
          log.d(lectureList);

          return lecture;
        }).toList();
        lectureList.assignAll(updatedList);
      } else {
        errorMessage.value = result.message;
      }
    } catch (e) {
      log.d("Error : $e");
    }
  }
}
