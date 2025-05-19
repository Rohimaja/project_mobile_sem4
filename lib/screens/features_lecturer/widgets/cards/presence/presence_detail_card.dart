import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/models/lecturers/attendance_model.dart';
import 'package:stipres/screens/features_lecturer/home/attendance/attendance_content_screen.dart';
import 'package:stipres/screens/features_lecturer/models/presence/presence_detail_model.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/detail_presence/presence_information.dart';
import 'package:stipres/screens/features_lecturer/widgets/dialog/detail_presence/student_biodata_dialog.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/detail_presence/student_biodata_card.dart'; // pastikan path ini sesuai

class PresenceDetailCard extends StatelessWidget {
  final PresenceDetailModel mahasiswa;

  const PresenceDetailCard({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    String iconPath = mahasiswa.jeniskelamin.toLowerCase() == "perempuan"
        ? 'assets/icons/ic_mahasiswi2.png'
        : 'assets/icons/ic_mahasiswa2.png';

    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 8), // Tambah jarak bawah antar card
      child: Material(
        color: const Color(0xFFE6DFF5),
        elevation: 3,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          iconPath,
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(height: 8),
                        _buildModeChip(mahasiswa.keterangan),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mahasiswa.nim,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF555555),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              mahasiswa.nama,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1F1F1F),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Tombol Biodata
              Positioned(
                top: 8,
                right: 112,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6D0082),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: StudentBiodataCard(
                          nama: "Izzul Islam Ramadhan",
                          nim: "E41231215",
                          semester: "4",
                          prodi: "Teknik Informatika",
                          fotoAssetPath: "assets/images/foto_izzul.jpg",
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Biodata',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6D0082),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: PresenceInformationCard(
                          waktuPresensi: "09.45 WIB",
                          keterangan: "sakit",
                          alasan:
                              "Saya tidak dapat menghadiri perkuliahan pada hari dan tanggal tersebut dikarenakan kondisi kesehatan saya yang menurun secara signifikan. Sejak malam sebelumnya, saya mulai merasakan gejala seperti demam tinggi, sakit kepala hebat, badan pegal-pegal, serta mual yang berkelanjutan. Setelah berkonsultasi dengan orang tua, saya segera dibawa ke klinik terdekat untuk diperiksa oleh tenaga medis. Berdasarkan hasil pemeriksaan, saya didiagnosis mengalami infeksi saluran pernapasan akut (ISPA) dan disarankan untuk beristirahat total selama beberapa hari ke depan agar tidak terjadi komplikasi lebih lanjut serta demi mencegah penularan kepada teman-teman di lingkungan kampus. Saya memahami pentingnya kehadiran dalam kegiatan perkuliahan, namun dalam kondisi ini saya memprioritaskan pemulihan agar dapat kembali mengikuti kegiatan akademik dengan optimal. Selama masa istirahat, saya tetap berusaha mengikuti materi yang diberikan melalui LMS dan catatan teman-teman. Saya juga bersedia menerima tugas tambahan jika diperlukan sebagai bentuk tanggung jawab saya. Demikian alasan ini saya buat dengan sebenar-benarnya dan saya mohon pengertiannya.",
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Detail',
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildModeChip(String mode) {
  bool isHadir = mode.toLowerCase() == 'hadir';
  bool isIzin = mode.toLowerCase() == 'izin';
  bool isSakit = mode.toLowerCase() == 'sakit';
  return Container(
    width: 70,
    height: 25,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isHadir
          ? Color(0xFF00A126) // Green for "Hadir"
          : isIzin
              ? Color(0xFFEAA904) // Yellow for "Izin"
              : isSakit
                  ? Color(0xFF0496EA)
                  : Color(0xFFEA0408), // Default color for "Alpa"
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Text(
      isHadir
          ? 'Hadir'
          : isIzin
              ? 'Izin'
              : isSakit
                  ? 'Sakit'
                  : 'Alpa',
      style: GoogleFonts.plusJakartaSans(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
