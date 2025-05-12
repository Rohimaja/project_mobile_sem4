import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PresenceInformationCard extends StatelessWidget {
  final String waktuPresensi;
  final String keterangan;
  final String alasan;

  const PresenceInformationCard({
    super.key,
    required this.waktuPresensi,
    required this.keterangan,
    required this.alasan,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background image
            Opacity(
              opacity: 0.15,
              child: Image.asset(
                'assets/images/bgBiodataMahasiswa.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            // Title
            const Positioned(
              top: 16,
              child: Text(
                "Detail Presensi Mahasiswa",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            // White content container
            // White content container
            Positioned(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20, // Tambahkan batas bawah agar konten tidak terpotong
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRowInfo('Waktu Presensi', waktuPresensi),
                      const SizedBox(height: 12),
                      _buildRowInfo('Keterangan', keterangan),
                      const SizedBox(height: 12),
                      _buildRowInfo('Alasan', alasan),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowInfo(String label, String value,
      {bool isScrollable = false}) {
    Widget valueWidget = Text(
      value,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF005095),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF005095),
            ),
          ),
        ),
        const Text(": "),
        Expanded(
          child: isScrollable
              ? SizedBox(
                  height: 100, // Atur tinggi maksimal
                  child: SingleChildScrollView(
                    child: valueWidget,
                  ),
                )
              : valueWidget,
        ),
      ],
    );
  }
}
