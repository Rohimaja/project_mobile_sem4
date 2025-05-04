import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/student/full_student_model.dart';
import 'package:stipres/services/api_manager.dart';

class ProfileMahasiswaService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}activity/viewProfile.php";
  final global = ApiManager.globalUrl;

  var log = Logger();

  Future<BaseResponse<FullStudentModelApi>> tampilFullProfile(
      String nim) async {
    try {
      final url = Uri.parse("$_baseURL?nim=$nim");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);

      return BaseResponse.fromJson(
          body,
          (dataJson) =>
              FullStudentModelApi.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
