import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/basic_response.dart';
import 'package:stipres/models/lecturers/presence_model.dart';

class PresenceLecturerService extends GetxService {
  final String _baseUrl =
      "${ApiConstants.globalUrl}listview/getPresenceLecturer.php";

  var log = Logger();

  Future<BaseResponse<List<PresensiDosenModel>>> fetchPresence(
      String dosenId) async {
    try {
      const action = "presensi";
      final url = Uri.parse("$_baseUrl?dosen_id=$dosenId&action=$action");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) => (dataJson as List)
              .map(
                  (e) => PresensiDosenModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BasicResponse> updatePresence(
      String presensisId, String jamAwal, String jamAkhir) async {
    try {
      const action = "updatePresensi";
      final url = Uri.parse(_baseUrl);
      final response = await http.post(url, body: {
        'action': action,
        'presensis_id': presensisId,
        'jam_awal': jamAwal,
        'jam_akhir': jamAkhir
      });
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BasicResponse.fromJson(body);
    } catch (e) {
      log.f("Error: $e");
      return BasicResponse(status: "Error", message: "Terjadi kesalahan $e");
    }
  }

  Future<BasicResponse> deletePresence(String presensisId) async {
    try {
      const action = "deletePresensi";
      final url = Uri.parse(_baseUrl);
      final response = await http.post(url, body: {
        'action': action,
        'presensis_id': presensisId,
      });
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BasicResponse.fromJson(body);
    } catch (e) {
      log.f("Error: $e");
      return BasicResponse(status: "Error", message: "Terjadi kesalahan $e");
    }
  }
}
