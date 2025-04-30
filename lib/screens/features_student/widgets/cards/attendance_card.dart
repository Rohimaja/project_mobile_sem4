import 'package:flutter/material.dart';
import 'package:stipres/screens/features_student/models/attendance_model.dart';
import 'package:stipres/screens/features_student/widgets/chips/attendance_chip.dart';
import 'package:stipres/styles/constant.dart';

class KehadiranCard extends StatelessWidget {
  final Kehadiran jadwal;

  const KehadiranCard({Key? key, required this.jadwal}) : super(key: key);

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
                const Text(
                  'Semester',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  jadwal.semester.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
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
                  jadwal.matkul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Persentase Kehadiran (${jadwal.persentase.toStringAsFixed(0)}%)',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(255, 21, 92, 151)),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: [
                    KehadiranChip(
                      label: 'Hadir',
                      jumlah: _getJumlahKehadiran('Hadir'),
                      color: Colors.green,
                    ),
                    KehadiranChip(
                      label: 'Sakit',
                      jumlah: _getJumlahKehadiran('Sakit'),
                      color: Colors.yellow.shade700,
                    ),
                    KehadiranChip(
                      label: 'Izin',
                      jumlah: _getJumlahKehadiran('Izin'),
                      color: Colors.blue,
                    ),
                    KehadiranChip(
                      label: 'Alpa',
                      jumlah: _getJumlahKehadiran('Alpa'),
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

  int _getJumlahKehadiran(String label) {
    final item = jadwal.kehadiran.firstWhere(
      (e) => e.label.toLowerCase() == label.toLowerCase(),
      orElse: () => KehadiranItem(label: label, jumlah: 0),
    );
    return item.jumlah;
  }
}
