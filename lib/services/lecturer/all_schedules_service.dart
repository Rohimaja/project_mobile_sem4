import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/lecturers/all_schedule_model.dart';

class LecturerAllSchedulesService extends GetxService {
  final String _baseUrl =
      "${ApiConstants.globalUrl}activityLecturer/getSchedule.php";

  final Logger log = Logger();

  Future<BaseResponse<List<LecturerAllScheduleModel>>> fetchSchedule(
      String dosenId) async {
    try {
      final action = 'dataAllSchedule';
      final url =
          Uri.parse("$_baseUrl?action=$action&dosen_id=$dosenId");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
        body,
        (dataJson) => (dataJson as List)
            .map((e) => LecturerAllScheduleModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
