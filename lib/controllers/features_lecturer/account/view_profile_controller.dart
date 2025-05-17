import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:stipres/constants/api.dart';
import 'package:stipres/controllers/features_lecturer/account/profile_controller.dart';
import 'package:stipres/controllers/features_lecturer/home/dashboard_controller.dart';
import 'package:stipres/screens/reusable/loading_screen.dart';
import 'package:stipres/services/lecturer/profile_lecturer_service.dart';

class ViewProfileController extends GetxController {
  static const int maxSizeInBytes = 2 * 1024 * 1024;

  final _box = GetStorage();
  final log = Logger();
  final ImagePicker pickedImage = ImagePicker();
  final profilePic = Rxn<File>();
  var storedProfiles = ''.obs;
  final url = ApiConstants.pathProfile;

  final conDashboard = Get.find<DashboardController>();
  final conProfile = Get.find<ProfileController>();

  final ProfileLecturerService profileLecturerService =
      ProfileLecturerService();

  @override
  void onInit() {
    super.onInit();
    loadHeader();
  }

  Future<void> loadHeader() async {
    String profile = _box.read('foto');
    final profileUrl =
        "$url${profile}?v=${DateTime.now().millisecondsSinceEpoch}";
    storedProfiles.value = profileUrl;
    log.e("Profile: ${storedProfiles.value}");
  }

  Future<void> getImageFromGallery() async {
    final XFile? image =
        await pickedImage.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      final cropped = await cropImage(file);
      if (cropped == null) return;
      final compressed = await compressImage(cropped);

      int fileSize = await compressed.length();
      if (fileSize > maxSizeInBytes) {
        Get.snackbar("Error", "Ukuran gambar melebihi 2MB");
        return;
      }

      profilePic.value = compressed;
      uploadProfilePic(compressed);
    }
  }

  Future<void> getImageFromCamera() async {
    try {
      final XFile? image =
          await pickedImage.pickImage(source: ImageSource.camera);
      if (image != null) {
        final file = File(image.path);
        final cropped = await cropImage(file);
        if (cropped == null) return;
        final compressed = await compressImage(cropped);

        int fileSize = await compressed.length();
        if (fileSize > maxSizeInBytes) {
          Get.snackbar("Error", "Ukuran gambar melebihi 2MB");
          return;
        }

        profilePic.value = compressed;
        uploadProfilePic(compressed);
      }
    } catch (e) {
      Get.snackbar("Gagal", "Kamera tidak tersedia: $e");
    }
  }

  Future<File?> cropImage(File file) async {
    final cropped = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Pangkas Gambar",
              hideBottomControls: true,
              lockAspectRatio: true),
          IOSUiSettings(aspectRatioLockEnabled: true)
        ]);
    return cropped != null ? File(cropped.path) : null;
  }

  Future<File> compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = path.join(dir.path, 'temp.jpg');

    final XFile? compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 70, format: CompressFormat.jpeg);

    if (compressedFile == null) {
      throw Exception("Gagal mengompresi gambar");
    }
    return File(compressedFile.path);
  }

  Future<void> uploadProfilePic(File? profilePicture) async {
    try {
      LoadingPopup();
      int dosenId = _box.read("dosen_id");

      final result =
          await profileLecturerService.sendImage(dosenId, profilePicture);
      if (result.status == "success" && result.data != null) {
        String? foto = result.data;
        _box.write('foto', foto);
        log.f(foto);

        // conDashboard.storedProfile.value = "${ApiConstants.pathProfile}$foto";
        // conDashboard.storedProfile.refresh();
        await conDashboard.loadHeader();
        await conProfile.loadHeader();
        await loadHeader();
        Get.back();
        Get.snackbar("Berhasil", result.message,
            duration: Duration(seconds: 1));
      } else {
        Get.back();

        Get.snackbar("Error", result.message);
      }
    } catch (e) {
      Get.back();
      log.e("Error: $e");
    }
  }

  void showFileOptions() {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Ambil Foto"),
            onTap: () async {
              Get.back();
              await getImageFromCamera();
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Pilih Gambar"),
            onTap: () async {
              Get.back();
              await getImageFromGallery();
            },
          ),
        ],
      ),
    ));
  }
}
