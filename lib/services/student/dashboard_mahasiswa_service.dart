import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/jadwal_model.dart';
import 'package:stipres/services/api_manager.dart';

class DashboardMahasiswaService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}listview/getLesson.php";
  final global = ApiManager.globalUrl;

  var log = Logger();

  Future<BaseResponse<List<JadwalModelApi>>> tampilJadwalHariIni(
      int mahasiswaId) async {
    try {
      final url = Uri.parse("$_baseURL?mahasiswa_id=$mahasiswaId");
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
