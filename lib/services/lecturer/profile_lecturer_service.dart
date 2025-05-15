import 'dart:convert';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:stipres/models/basic_response.dart';
import 'package:stipres/services/api_manager.dart';

class ProfileLecturerService extends GetxService {
  final String _baseURL = "${ApiManager.globalUrl}activity/viewProfile.php";
  final global = ApiManager.globalUrl;

  var log = Logger();

  Future<BasicResponse> sendImage(int dosenId, File? profilePic) async {
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

      return BasicResponse.fromJson(body);
    } catch (e) {
      log.e("Error: $e");
      return BasicResponse(status: "error", message: "Terjadi kesalahan: $e");
    }
  }
}
