import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/lecturers/lecture_model.dart';
import 'package:stipres/models/students/lecture_model.dart';

class LectureLecturerService extends GetxService {
  final String _baseUrl = "${ApiConstants.globalUrl}listview/getZoomDosen.php";

  var log = Logger();

  Future<BaseResponse<List<LectureModelApi>>> tampilZoom(String dosenId) async {
    try {
      final action = 'dataLecture';
      final url = Uri.parse("$_baseUrl?dosen_id=$dosenId&action=$action");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      // Cek null atau kunci yang tidak valid
      if (body == null || body['data'] == null) {
        return BaseResponse(
            status: "error", message: "Data tidak valid", data: null);
      }

      try {
        return BaseResponse.fromJson(
          body,
          (dataJson) => (dataJson as List)
              .map((e) => LectureModelApi.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      } catch (parseError) {
        log.d("Error parsing data: $parseError");
        return BaseResponse(
            status: "error",
            message: "Gagal memproses data: $parseError",
            data: null);
      }
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BaseResponse<LectureModelApi>> tampilZoomContent(
      String presensisId) async {
    try {
      final action = "dataContentLecture";
      final url =
          Uri.parse("$_baseUrl?presensis_id=$presensisId&action=$action");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
        body,
        (dataJson) =>
            LectureModelApi.fromJson(dataJson as Map<String, dynamic>),
      );
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
