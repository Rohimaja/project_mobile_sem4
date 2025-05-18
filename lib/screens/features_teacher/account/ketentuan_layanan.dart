import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/reusable/custom_header.dart';
import 'package:stipres/styles/constant.dart';

class KetentuanLayanan extends StatelessWidget {
  KetentuanLayanan({Key? key}) : super(key: key);
  var height, width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 235, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(title: "Ketentuan Layanan"),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 23, right: 18, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ketentuan Layanan",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
