import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';

class KebijakanPrivasi extends StatelessWidget {
  KebijakanPrivasi({Key? key}) : super(key: key);
  var height, width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 235, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 23, right: 18, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kebijakan Privasi",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  // const SizedBox(height: 3),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 12),
                  _buildSectionTitle("Ketentuan Umum"),
                  _buildNumberedList([
                    "Pengguna wajib menggunakan aplikasi ini sesuai dengan tujuan akademik, yaitu untuk pencatatan kehadiran secara daring.",
                    "STIPRES hanya dapat digunakan oleh mahasiswa, dosen, dan staf yang memiliki akses resmi dari STIKes Panti Waluya Malang.",
                    "Penggunaan akun bersifat pribadi dan tidak boleh dipindahtangankan ke pihak lain.",
                  ]),
                  const SizedBox(height: 12),
                  _buildSectionTitle("Pembuatan & Pengelolaan Akun"),
                  _buildNumberedList([
                    "Pengguna wajib mendaftarkan akun dengan data yang valid sesuai identitas akademik.",
                    "STIPRES berhak menangguhkan atau menghapus akun yang terbukti melakukan penyalahgunaan, seperti penggunaan data palsu atau manipulasi kehadiran.",
                    "Pengguna bertanggung jawab menjaga keamanan akun dan kata sandinya.",
                  ]),
                  const SizedBox(height: 12),
                  _buildSectionTitle("Penggunaan Aplikasi"),
                  _buildNumberedList([
                    "Pengguna wajib melakukan presensi sesuai jadwal dan ketentuan yang berlaku.",
                    "Sistem akan mencatat lokasi dan waktu saat pengguna melakukan presensi untuk memastikan keabsahan data.",
                    "Manipulasi presensi, seperti menggunakan VPN atau aplikasi pihak ketiga, dilarang dan dapat berakibat pada sanksi akademik.",
                    "Dosen memiliki wewenang untuk mengevaluasi dan mengubah status kehadiran jika ditemukan kesalahan pencatatan.",
                  ]),
                ],
              ),
            ),
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
          height: 70,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/bgheader.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
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
                  "Kebijakan Privasi",
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
            color: blueColor,
          ),
        ),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      "> $title",
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildNumberedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            "${index + 1}. ${items[index]}",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        );
      }),
    );
  }
}
