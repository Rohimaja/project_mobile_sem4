import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/lecturers/data_prodi_model.dart';
import 'package:stipres/models/lecturers/attendance_model.dart';

class AttendanceLecturerService extends GetxService {
  final String _baseUrl =
      "${ApiConstants.globalUrl}activityLecturer/getPencarianRekapDosen.php";
  final String globalUrl = ApiConstants.globalUrl;

  var log = Logger();

  Future<BaseResponse<List<DataProdi>>> fetchDataProdi() async {
    try {
      final action = "dataProdi";
      final url = Uri.parse("$_baseUrl?action=$action");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) => (dataJson as List)
              .map((e) => DataProdi.fromJson(e as Map<String, dynamic>))
              .toList());
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(status: "Error", message: "Error: $e");
    }
  }

  Future<BaseResponse<List<DataMahasiswa>>> fetchMahasiswa(
      String semester, String prodiId) async {
    try {
      final action = "dataMahasiswa";
      final url = Uri.parse(
          "$_baseUrl?semester=$semester&prodi_id=$prodiId&action=$action");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) => (dataJson as List)
              .map((e) => DataMahasiswa.fromJson(e as Map<String, dynamic>))
              .toList());
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(status: "Error", message: "Error: $e");
    }
  }
}
