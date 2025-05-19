import 'package:flutter/material.dart';
import 'package:stipres/models/students/rekap_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/attendance/attendance_content_card.dart';

class KehadiranCard extends StatelessWidget {
  final RekapModelApi rekap;

  KehadiranCard({Key? key, required this.rekap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFCFE9FF), // background terang
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFC8C8C8),
          width: 0.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Box Semester
          Container(
            width: 70,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Semester',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.white, fontSize: 12),
                ),
                Text(
                  rekap.semester.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Konten Mata Kuliah & Persentase
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rekap.namaMatkul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Persentase Kehadiran (${rekap.persentase}%)',
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 13, color: Color.fromARGB(255, 21, 92, 151)),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: [
                    KehadiranChip(
                      label: 'Hadir',
                      jumlah: rekap.hadir,
                      color: Colors.green,
                    ),
                    KehadiranChip(
                      label: 'Sakit',
                      jumlah: rekap.sakit,
                      color: Colors.yellow.shade700,
                    ),
                    KehadiranChip(
                      label: 'Izin',
                      jumlah: rekap.izin,
                      color: Colors.blue,
                    ),
                    KehadiranChip(
                      label: 'Alpa',
                      jumlah: rekap.alpa,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // int _getJumlahKehadiran(String label) {
  //   final item = rekap..firstWhere(
  //     (e) => e.label.toLowerCase() == label.toLowerCase(),
  //     orElse: () => KehadiranItem(label: label, jumlah: 0),
  //   );
  //   return item.jumlah;
  // }
}
