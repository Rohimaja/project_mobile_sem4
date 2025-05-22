import 'dart:convert';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:stipres/models/base_response.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/models/lecturers/full_lecturer_model.dart';

class ProfileLecturerService extends GetxService {
  final String _baseURL = "${ApiConstants.globalUrl}activity/viewProfile.php";
  final global = ApiConstants.globalUrl;

  var log = Logger();

  Future<BaseResponse<FullLecturerModel>> tampilFullProfile(String nip) async {
    try {
      final url = Uri.parse("$_baseURL?nip=$nip");
      final response = await http.get(url);
      log.d(url);

      final body = jsonDecode(response.body);

      return BaseResponse.fromJson(
          body,
          (dataJson) =>
              FullLecturerModel.fromJson(dataJson as Map<String, dynamic>));
    } catch (e) {
      log.d("Error: $e");
      return BaseResponse(
          status: "error", message: "Terjadi kesalahan $e", data: null);
    }
  }

  Future<BaseResponse<String>> sendImage(int dosenId, File? profilePic) async {
    try {
      final url = Uri.parse("${global}activity/upProfileImage.php");
      final request = http.MultipartRequest('POST', url)
        ..fields['role'] = "dosen"
        ..fields['dosen_id'] = dosenId.toString();

      if (profilePic != null) {
        final dir = await getTemporaryDirectory();
        final targetPath =
            path.join(dir.path, 'compressed_${path.basename(profilePic.path)}');

        final compressedFile = await FlutterImageCompress.compressAndGetFile(
            profilePic.absolute.path, targetPath,
            quality: 70, format: CompressFormat.jpeg);

        if (compressedFile == null) {
          throw Exception("Gagal mengompresi gambar");
        }

        var stream = http.ByteStream(compressedFile.openRead());
        var length = await compressedFile.length();
        var multipartFile = http.MultipartFile("file", stream, length,
            filename: path.basename(compressedFile.path),
            contentType: MediaType("image", 'jpeg'));
        request.files.add(multipartFile);
        log.d(compressedFile);
      }

      final response = await request.send();
      final respStr = await http.Response.fromStream(response);
      log.d(respStr.body);

      final body = jsonDecode(respStr.body);

      return BaseResponse<String>.fromJson(
        body,
        (data) => data['foto'],
      );
    } catch (e) {
      log.e("Error: $e");
      return BaseResponse(status: "error", message: "Terjadi kesalahan: $e");
    }
  }
}
