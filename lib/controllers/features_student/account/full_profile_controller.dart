import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/services/profile_mahasiswa_service.dart';

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

  final _box = GetStorage();

  final log = Logger();

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
          "${profile.tempatLahir}, ${profile.tglLahir}";
      storedAlamat.value = profile.alamat;
      storedSemester.value =
          "${profile.semester.toString()} (${numberToBahasa(profile.semester)})";
      storedProdi.value = profile.namaProdi;
      storedNoTelp.value = profile.noTelp;
    }
  }
}
