import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/controllers/features_student/account/view_profile_controller.dart';
import 'package:stipres/constants/styles.dart';

class ViewProfilePage extends StatelessWidget {
  ViewProfilePage({Key? key}) : super(key: key);
  var height, width;

  final _controller = Get.find<StudentViewProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            _buildHeader(context),
            Obx(
              () => _buildProfileForm(),
            )
          ],
        ),
        Positioned(
          top: 110, // atur posisi agar setengah berada di header
          left: 0,
          right: 0,
          child: _buildProfilePicture(),
        ),
      ]),
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
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 80),
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
      ],
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
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
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                print("add image on tapped");
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: blueColor,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    image: AssetImage("assets/icons/ic_addpicture.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
              "Tempat, Tanggal Lahir", _controller.storedTempatTglLahir.value),
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
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ), // Tetap ada untuk label jika terlalu panjang
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  color: Color.fromARGB(255, 30, 136, 228),
                  fontWeight: FontWeight.w500,
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
