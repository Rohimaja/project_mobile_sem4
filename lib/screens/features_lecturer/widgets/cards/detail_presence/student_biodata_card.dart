import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentBiodataCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String semester;
  final String prodi;
  final String fotoAssetPath;

  const StudentBiodataCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.semester,
    required this.prodi,
    required this.fotoAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
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

            // Kontainer putih
            Positioned(
              top: 110,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 60, left: 16, right: 16, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // <--- ini penting
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRowInfo('Nama', nama),
                    const SizedBox(height: 8),
                    _buildRowInfo('NIM', nim),
                    const SizedBox(height: 8),
                    _buildRowInfo('Semester', semester),
                    const SizedBox(height: 8),
                    _buildRowInfo('Program Studi', prodi),
                  ],
                ),
              ),
            ),

            // Foto profil (di atas container putih)
            Positioned(
              top: 60,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 46,
                  backgroundImage: AssetImage(fotoAssetPath),
                ),
              ),
            ),

            // Judul
            const Positioned(
              top: 16,
              child: Text(
                "Biodata Mahasiswa",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowInfo(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.normal,
                color: Color(0xFF005095),
                fontSize: 15),
          ),
        ),
        const Text(": "),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                color: Color(0xFF005095),
                fontSize: 15),
          ),
        ),
      ],
    );
  }
}
