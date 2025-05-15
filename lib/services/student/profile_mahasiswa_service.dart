import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:stipres/models/base_response.dart';
import 'package:stipres/models/basic_response.dart';
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

  Future<BasicResponse> sendImage(int mahasiswaId, File? profilePic) async {
    try {
      final url = Uri.parse("${global}activity/upProfileImage.php");
      final request = http.MultipartRequest('POST', url)
        ..fields['role'] = "mahasiswa"
        ..fields['mahasiswa_id'] = mahasiswaId.toString();

      if (profilePic != null) {
        var stream = http.ByteStream(profilePic.openRead());
        var length = await profilePic.length();
        var multipartFile = http.MultipartFile("file", stream, length,
            filename: path.basename(profilePic.path));
        request.files.add(multipartFile);
        log.d(profilePic);
      }

      final response = await request.send();
      final respStr = await http.Response.fromStream(response);
      log.d(respStr.body);

      final body = jsonDecode(respStr.body);
      return BasicResponse.fromJson(body);
    } catch (e) {
      log.e("Error: $e");
      return BasicResponse(status: "error", message: "Terjadi kesalahan: $e");
    }
  }
}
