import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/student/rekap_model.dart';
import 'package:stipres/services/api_manager.dart';

class RekapMahasiswaService extends GetxService {
  final String _baseUrl = "${ApiManager.globalUrl}listview/getRekap.php";

  var log = Logger();

  Future<BaseResponse<List<RekapModelApi>>> tampilRekap(String nim) async {
    try {
      final url = Uri.parse("$_baseUrl?nim=$nim");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
        body,
        (dataJson) => (dataJson as List)
            .map((e) => RekapModelApi.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
