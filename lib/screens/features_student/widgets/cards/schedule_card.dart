import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stipres/controllers/features_student/home/dashboard_controller.dart';
import 'package:stipres/models/jadwal_model.dart';
import 'package:stipres/screens/features_student/widgets/cards/course_detail_card.dart';
import 'package:stipres/constants/styles.dart';

class JadwalCard extends StatelessWidget {
  final JadwalModelApi jadwal;

  JadwalCard({Key? key, required this.jadwal}) : super(key: key);

  final _controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/ic_clock.png',
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 6),
            Text(
              jadwal.waktu,
              style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/abstract_body.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Foreground Content
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Color(0xFFFFF2DC).withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.2,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: SizedBox(
                      width: 80,
                      height:
                          100, // Pastikan ada tinggi agar Stack tahu batasnya
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 25, // Geser icon ke bawah
                            child: Image.asset(
                              'assets/icons/ic_matakuliah.png',
                              height: 75,
                              width: 75,
                            ),
                          ),
                          Positioned(
                            top: -10,
                            left: 5,
                            child: _buildModeChip(jadwal.keterangan!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                jadwal.mataKuliah,
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Material(
                              color: Colors.transparent,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Color(0xFFA200C2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    showGeneralDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      barrierLabel: "Dismiss",
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      pageBuilder:
                                          (context, animation1, animation2) {
                                        return const SizedBox.shrink();
                                      },
                                      transitionBuilder: (context, animation1,
                                          animation2, child) {
                                        final curvedValue = Curves.easeInOut
                                                .transform(animation1.value) -
                                            1.0;
                                        return Transform.translate(
                                          offset:
                                              Offset(0.0, curvedValue * -300),
                                          child: Opacity(
                                            opacity: animation1.value,
                                            child: Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              insetPadding:
                                                  const EdgeInsets.all(20),
                                              child: CourseDetailCard(
                                                namaMatkul: "Pemrograman Dasar",
                                                idMatkul: "TIF3333",
                                                tanggal: "Rabu, 23 April 2025",
                                                jam: "07.00–09.00 WIB",
                                                dosen:
                                                    "Aldo Rayhan Radittyanuh S.Kom, M.Kom",
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: const Text(
                                      "Lihat Jadwal",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/ic_location.png',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              jadwal.lokasi!,
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/ic_duration.png',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              jadwal.durasiMatkul,
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildActionBox(
                              context: context,
                              label: 'Presensi',
                              color: Color(0xFFF4D8FB),
                              onTap: () {
                                _controller.buttonAction(jadwal);
                              },
                            ),
                            const SizedBox(width: 8),
                            _buildActionBox(
                              context: context,
                              label: 'Zoom',
                              color: Color(0xFFF4D8FB),
                              onTap: () {
                                (jadwal.lokasi == "-")
                                    ? Get.toNamed(
                                        "/student/lecture-content-screen",
                                        arguments: jadwal.presensisId)
                                    : Get.toNamed("/student/offline-screen");
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildActionBox({
  required BuildContext context,
  required String label,
  required VoidCallback onTap,
  required Color color,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Material(
    color: color,
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.purpleAccent.withOpacity(0.2),
      child: Container(
        width: screenWidth * 0.25,
        height: screenHeight * 0.04,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: blackColor,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

Widget _buildModeChip(String mode) {
  bool isDaring = mode.toLowerCase() == 'daring';
  return Container(
    width: 70,
    height: 25,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isDaring ? Colors.green : const Color.fromARGB(255, 124, 124, 124),
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
      isDaring ? 'Daring' : 'Luring',
      style: GoogleFonts.plusJakartaSans(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
