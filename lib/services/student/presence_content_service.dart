import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/base_response.dart';
import 'package:http/http.dart' as http;
import 'package:stipres/models/basic_response.dart';
import 'package:stipres/models/students/get_presence_model.dart';
import 'package:stipres/constants/api.dart';

class PresenceContentService extends GetxService {
  final String _baseURL = "${ApiConstants.globalUrl}activity/getTransaksi.php";
  final global = ApiConstants.globalUrl;

  var log = Logger();

  Future<BaseResponse<GetPresenceApi>> getPresenceContent(
      int mahasiswaId, dynamic presensiId) async {
    try {
      final url = Uri.parse(
          "$_baseURL?presensi_id=$presensiId&mahasiswa_id=$mahasiswaId");
      log.d(url);
      final response = await http.get(url);
      log.e(url);

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

  Future<BasicResponse> uploadPresence(int mahasiswaId, var presensiId,
      int status, String waktuPresensi, String? alasan, File? bukti) async {
    try {
      final url = Uri.parse("${global}activity/presensiActivity.php");
      log.d(url);
      log.d("Mahasiswa ID: $mahasiswaId, Presensi ID: $presensiId");

      final request = http.MultipartRequest('POST', url)
        ..fields['mahasiswa_id'] = mahasiswaId.toString()
        ..fields['presensi_id'] = presensiId.toString()
        ..fields['status'] = status.toString()
        ..fields['waktu_presensi'] = waktuPresensi;

      if (alasan != null && alasan.isNotEmpty) {
        request.fields['alasan'] = alasan;
      }

      if (bukti != null) {
        var stream = http.ByteStream(bukti.openRead());
        var length = await bukti.length();
        var multipartFile = http.MultipartFile(
          'bukti',
          stream,
          length,
          filename: path.basename(bukti.path),
        );
        request.files.add(multipartFile);
      }

      log.d(bukti);

      final response = await request.send();

      final respStr = await http.Response.fromStream(response);
      log.d(respStr.body);

      final body = jsonDecode(respStr.body);

      return BasicResponse.fromJson(
        body,
      );
    } catch (e) {
      log.d("Error: $e");
      return BasicResponse(status: "error", message: "Terjadi kesalahan: $e");
    }
  }
}
