import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/basic_response.dart';
import 'package:stipres/models/lecturers/active_school_year_model.dart';
import 'package:stipres/models/lecturers/check_presence_model.dart';
import 'package:stipres/models/lecturers/data_prodi_model.dart';
import 'package:stipres/models/lecturers/matkul_model.dart';
import 'package:stipres/models/lecturers/presence_id_model.dart';
import 'package:stipres/models/lecturers/presence_request_model.dart';

class AddPresenceLecturerService extends GetxService {
  final String _baseUrl =
      "${ApiConstants.globalUrl}activityLecturer/uploadPresensi.php";
  final global = ApiConstants.globalUrl;

  final Logger log = Logger();

  Future<BaseResponse<List<MatkulModel>>> fetchMatkul(
      String prodiId, String semester) async {
    try {
      const action = 'showMatkuls';
      final url = Uri.parse(
          "$_baseUrl?action=$action&prodi_id=$prodiId&semester=$semester");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) => (dataJson as List)
              .map((e) => MatkulModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BaseResponse<List<DataProdi>>> fetchProdi() async {
    try {
      const action = 'showProdis';
      final url = Uri.parse("$_baseUrl?action=$action");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) => (dataJson as List)
              .map((e) => DataProdi.fromJson(e as Map<String, dynamic>))
              .toList());
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BaseResponse<TahunAjaranAktif>> fetchTahunAjaran() async {
    try {
      const action = 'showTahunAjarans';
      final url = Uri.parse("$_baseUrl?action=$action");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) =>
              TahunAjaranAktif.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BaseResponse<CheckPresenceModel>> checkPresence(int prodiId,
      int semester, String jamAwal, String jamAkhir, String tglPresensi) async {
    try {
      log.d("Param : $prodiId");
      log.d("Param : $semester");
      log.d("Param : $jamAwal");
      log.d("Param : $jamAkhir");
      log.d("Param : $tglPresensi");
      const action = 'uploadP';
      final url = Uri.parse("$global/activityLecturer/checkPresensi.php");
      log.d(url);
      final response = await http.post(url, body: {
        "action": action,
        "jam_awal": jamAwal,
        "jam_akhir": jamAkhir,
        "tgl_presensi": tglPresensi,
        "prodi_id": prodiId.toString(),
        "semester": semester.toString(),
      });

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(
          body,
          (dataJson) =>
              CheckPresenceModel.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BaseResponse<PresensiId>> getPresensiId() async {
    try {
      final url = Uri.parse("${global}activityLecturer/getPresensiId.php");
      log.d(url);
      final response = await http.get(url);

      final body = jsonDecode(response.body);
      log.d(body);

      return BaseResponse.fromJson(body,
          (dataJson) => PresensiId.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.f("Error: $e");
      return BaseResponse(
          status: "Error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BasicResponse> uploadPresensi(PresenceRequest presensiRequest) async {
    try {
      final url = Uri.parse(_baseUrl);
      log.d(url);
      final response = await http.post(url, body: presensiRequest.toJson());

      final body = jsonDecode(response.body);
      log.d(body);

      return BasicResponse.fromJson(body);
    } catch (e) {
      log.f("Error: $e");
      return BasicResponse(status: "Error", message: "Terjadi kesalahan $e");
    }
  }
}
