import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var pickedFile = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedFile.value = File(image.path);
    }
  }

  Future<void> getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedFile.value = File(image.path);
    }
  }
}
