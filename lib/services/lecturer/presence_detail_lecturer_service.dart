import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/lecturers/header_detail_presence_model.dart';

class PresenceDetailLecturerService extends GetxService {
  final String _baseUrl =
      "${ApiConstants.globalUrl}activityLecturer/getDetailPresensiDosen.php";

  var log = Logger();

  Future<BaseResponse<HeaderDetailPresensi>> fetchHeader(
      String presensisId) async {
    try {
      const action = "dataHeader";
      final url =
          Uri.parse("$_baseUrl?action=$action&presensis_id=$presensisId");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) =>
              HeaderDetailPresensi.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }
}
