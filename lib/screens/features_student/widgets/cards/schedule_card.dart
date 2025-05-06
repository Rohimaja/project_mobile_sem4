import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/controllers/features_student/home/dashboard_controller.dart';
import 'package:stipres/models/student/jadwal_model.dart';
import 'package:stipres/screens/features_student/widgets/cards/course_detail_card.dart';
import 'package:stipres/styles/constant.dart';

class JadwalCard extends StatelessWidget {
  final JadwalModelApi jadwal;

  final DashboardController _controller = DashboardController();

  JadwalCard({Key? key, required this.jadwal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'icons/ic_clock.png',
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 6),
            Text(
              jadwal.waktu,
              style: const TextStyle(fontWeight: FontWeight.bold),
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
                  'images/abstract_body.png',
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
                  Image.asset(
                    'icons/ic_matakuliah.png',
                    height: 90,
                    width: 90,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
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
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Image.asset(
                              'icons/ic_location.png',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(jadwal.lokasi!),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              'icons/ic_duration.png',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(jadwal.durasiMatkul),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _buildActionBox(
                              context: context,
                              label: 'Presensi',
                              color: Color(0xFFF4D8FB),
                              onTap: () {
                                (jadwal.lokasi == "Online")
                                    ? Get.toNamed(
                                        "/student/presence-content-screen")
                                    : Get.toNamed("/student/offline-screen");
                              },
                            ),
                            const SizedBox(width: 8),
                            _buildActionBox(
                              context: context,
                              label: 'Zoom',    
                              color: Color(0xFFF4D8FB),
                              onTap: () {
                                (jadwal.lokasi == "Online")
                                    ? Get.toNamed(
                                        "/student/lecture-content-screen")
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
  return Material(
    color: color,
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: const Color.fromARGB(255, 227, 67, 255),
      child: Container(
        width: 120,
        height: 30,
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

class ChipItem extends StatelessWidget {
  final String label;

  const ChipItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
