import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FileController extends GetxController {
  var pickedFile = Rxn<File>();

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      pickedFile.value = File(result.files.single.path!);
    }
  }
}
