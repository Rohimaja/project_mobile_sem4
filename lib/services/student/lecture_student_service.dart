import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:http/http.dart' as http;
import 'package:stipres/models/student/lecture_model.dart';
import 'package:stipres/constants/api.dart';

class LectureStudentService extends GetxService {
  final String _baseUrl = "${ApiConstants.globalUrl}listview/getZoom.php";

  var log = Logger();

  Future<BaseResponse<List<LectureModelApi>>> tampilZoom(String nim) async {
    try {
      final url = Uri.parse("$_baseUrl?nim=$nim");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
        body,
        (dataJson) => (dataJson as List)
            .map((e) => LectureModelApi.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
