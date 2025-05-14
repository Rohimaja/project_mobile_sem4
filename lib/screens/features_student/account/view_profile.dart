import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/controllers/features_student/account/full_profile_controller.dart';
import 'package:stipres/styles/constant.dart';

class ViewProfilePage extends StatelessWidget {
  ViewProfilePage({Key? key}) : super(key: key);
  var height, width;

  final _controller = Get.put(FullProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Obx(
              () => _buildProfileForm(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: 170,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/bgheader.png'),
              fit: BoxFit.cover, // agar penuh
            ),
          ),
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 120),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent, // supaya ripple doang yang keliatan
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  borderRadius: BorderRadius.circular(100),
                  customBorder: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/icons/ic_back.png'),
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Lihat Profil",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -44,
          right: 0,
          child: Container(
            width: 40,
            height: 44,
            decoration: BoxDecoration(
              color: blueColor,
            ),
          ),
        ),
        Positioned(
          bottom: -45,
          right: 0,
          child: Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 254, 247, 255),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
              ),
            ),
          ),
        ),
        Positioned(
          top: 117,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 237, 235, 251),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/foto_izzul.jpg",
                        height: 110,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          _controller.addImage();
                        },
                        child: Ink(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D0063),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Image(
                              image:
                                  AssetImage("assets/icons/ic_addpicture.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
      child: Column(
        children: [
          _buildProfileItem("Full Name", _controller.storedFullName.value),
          _buildDivider(),
          _buildProfileItem("NIM", _controller.storedNim.value),
          _buildDivider(),
          _buildProfileItem("Email", _controller.storedEmail.value),
          _buildDivider(),
          _buildProfileItem(
              "Jenis Kelamin", _controller.storedJenisKelamin.value),
          _buildDivider(),
          _buildProfileItem("Agama", _controller.storedAgama.value),
          _buildDivider(),
          _buildProfileItem(
              "Tempat Tanggal Lahir", _controller.storedTempatTglLahir.value),
          _buildDivider(),
          _buildProfileItem("Alamat", _controller.storedAlamat.value),
          _buildDivider(),
          _buildProfileItem("Semester", _controller.storedSemester.value),
          _buildDivider(),
          _buildProfileItem("Program Studi", _controller.storedProdi.value),
          _buildDivider(),
          _buildProfileItem("No. Telp", _controller.storedNoTelp.value),
        ],
      ),
    );
  }

  // Widget untuk menampilkan label dan nilai.
  Widget _buildProfileItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Agar baris sejajar di bagian atas secara vertikal
          children: [
            SizedBox(
              width: 150,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow
                    .ellipsis, // Tetap ada untuk label jika terlalu panjang
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  color: Color.fromARGB(255, 30, 136, 228),
                  fontWeight: FontWeight.w400,
                ),
                // overflow: TextOverflow.ellipsis, // Dihapus agar teks bisa wrap
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget untuk garis pemisah
  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 0.5,
    );
  }
}
