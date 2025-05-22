import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/jadwal_model.dart';
import 'package:stipres/constants/api.dart';

class DashboardLecturerService extends GetxService {
  final String _baseURL =
      "${ApiConstants.globalUrl}listview/getLessonLecturer.php";
  final global = ApiConstants.globalUrl;

  var log = Logger();

  Future<BaseResponse<List<JadwalModelApi>>> tampilJadwalHariIni(
      int dosenId) async {
    try {
      final url = Uri.parse("$_baseURL?dosen_id=$dosenId");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
        body,
        (dataJson) => (dataJson as List)
            .map((e) => JadwalModelApi.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
