import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:http/http.dart' as http;
import 'package:stipres/models/student/get_presence_model.dart';
import 'package:stipres/services/api_manager.dart';

class PresenceContentService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}activity/getTransaksi.php";
  final global = ApiManager.globalUrl;

  var log = Logger();

  Future<BaseResponse<GetPresenceApi>> getPresenceContent(
      String mahasiswaId, String presensiId) async {
    try {
      final url = Uri.parse(
          "$_baseURL?presensi_id=$presensiId&mahasiswa_id=$mahasiswaId");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);

      return BaseResponse.fromJson(
          body,
          (dataJson) =>
              GetPresenceApi.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan: $e", data: null);
    }
  }
}
