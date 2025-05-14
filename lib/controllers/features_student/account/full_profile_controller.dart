import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stipres/services/student/profile_mahasiswa_service.dart';

class FullProfileController extends GetxController {
  final storedFullName = ''.obs;
  final storedNim = ''.obs;
  final storedEmail = ''.obs;
  final storedJenisKelamin = ''.obs;
  final storedAgama = ''.obs;
  final storedTempatTglLahir = ''.obs;
  final storedAlamat = ''.obs;
  final storedSemester = ''.obs;
  final storedProdi = ''.obs;
  final storedNoTelp = ''.obs;

  static const int maxSizeInBytes = 5 * 1024 * 1024;

  final _box = GetStorage();
  final log = Logger();
  final ImagePicker pickedImage = ImagePicker();

  final ProfileMahasiswaService profileMahasiswaService =
      ProfileMahasiswaService();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  String numberToBahasa(int number) {
    List<String> angka = [
      "",
      "Satu",
      "Dua",
      "Tiga",
      "Empat",
      "Lima",
      "Enam",
      "Tujuh",
      "Delapan",
      "Sembilan",
    ];

    if (number < 10) {
      return angka[number];
    } else if (number < 20) {
      return "${angka[number - 10]} Belas";
    } else {
      return number.toString();
    }
  }

  String formatTanggal(String tanggal) {
    final bulan = {
      '01': 'Januari',
      '02': 'Februari',
      '03': 'Maret',
      '04': 'April',
      '05': 'Mei',
      '06': 'Juni',
      '07': 'Juli',
      '08': 'Agustus',
      '09': 'September',
      '10': 'Oktober',
      '11': 'November',
      '12': 'Desember',
    };

    final parts = tanggal.split('-');
    if (parts.length != 3) return tanggal;

    final year = parts[0];
    final month = bulan[parts[1]] ?? parts[1];
    final day = parts[2];

    return "$day $month $year";
  }

  void loadData() async {
    String nim = _box.read("user_nim");

    final result = await profileMahasiswaService.tampilFullProfile(nim);

    if (result.status == "success" && result.data != null) {
      final profile = result.data!;

      log.d(profile.agama);

      storedFullName.value = profile.nama;
      storedNim.value = profile.nim;
      storedEmail.value = profile.email;
      storedJenisKelamin.value = profile.jenisKelamin;
      storedAgama.value = profile.agama;
      storedTempatTglLahir.value =
          "${profile.tempatLahir}, ${formatTanggal(profile.tglLahir)}";
      storedAlamat.value = profile.alamat;
      storedSemester.value =
          "${profile.semester.toString()} (${numberToBahasa(profile.semester)})";
      storedProdi.value = profile.namaProdi;
      storedNoTelp.value = profile.noTelp;
    }
  }

  Future<void> getImageFromGallery() async {
    final XFile? image =
        await pickedImage.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      int fileSize = await file.length();

      if (fileSize > maxSizeInBytes) {
        Get.snackbar("Error", "Ukuran gambar melebihi 5MB");
        return;
      }
      // bukti.value = File(image.path);
    }
  }

  Future<void> getImageFromCamera() async {
    try {
      final XFile? image =
          await pickedImage.pickImage(source: ImageSource.camera);
      if (image != null) {
        final file = File(image.path);
        int fileSize = await file.length();

        if (fileSize > maxSizeInBytes) {
          Get.snackbar("Error", "Ukuran gambar melebihi 5MB");
          return;
        }

        // bukti.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Gagal", "Kamera tidak tersedia: $e");
    }
  }

  void addImage() {
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
