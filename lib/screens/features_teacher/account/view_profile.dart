import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/account/profile_screen.dart';
import 'package:stipres/styles/constant.dart';

class ViewProfilePage extends StatelessWidget {
  ViewProfilePage({Key? key}) : super(key: key);
  var height, width;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 237, 235, 251),
    body: Stack(
      children: [
        // Header di bawah
        Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20), // agar tidak tabrakan dengan profilePicture
            _buildProfileForm(),
          ],
        ),

        // Foto profil di atas, posisi dipotong setengah
        Positioned(
          top: 110, // atur posisi agar setengah berada di header
          left: 0,
          right: 0,
          child: _buildProfilePicture(),
        ),
      ],
    ),
  );
}


  Widget _buildHeader(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none, // agar Positioned bisa keluar dari boundary container
    children: [
      Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueColor,
          image: const DecorationImage(
            image: AssetImage('assets/images/bgheader.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 120),
          child: Row(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(100),
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
                ),
              ),
            ],
          ),
        ),
      ),

      // Aksen 1 (ungu muda)
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

      // Aksen 2 (melengkung ke background luar)
      Positioned(
        bottom: -45,
        right: 0,
        child: Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 237, 235, 251),
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
              "assets/images/foto_aldo.jpg",
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
              decoration: const BoxDecoration(
                color: Color(0xFF0D0063),
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
          _buildProfileItem("Nama", "Izzul Islam Ramadhan"),
          _buildDivider(),
          _buildProfileItem("NIP", "9842987439287"),
          _buildDivider(),
          _buildProfileItem("Email", "izzul1232gamil.com"),
          _buildDivider(),
          _buildProfileItem("Jenis Kelamin", "Lanang"),
          _buildDivider(),
          _buildProfileItem("Agama", "Islam"),
          _buildDivider(),
          _buildProfileItem("Tempat Tanggal Lahir", "Jember, 30 Februari 1997"),
          _buildDivider(),
          _buildProfileItem("Alamat", "Jember"),
          _buildDivider(),
          _buildProfileItem("Program Studi", "Sastra Mesin"),
          _buildDivider(),
          _buildProfileItem("No. Telp", "085737283847"),
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
