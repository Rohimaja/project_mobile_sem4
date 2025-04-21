import 'package:flutter/material.dart';
import 'package:stipres/screens/features_student/models/kehadiran_model.dart';
import 'package:stipres/screens/features_student/widgets/chips/kehadiran_chip.dart';

class KehadiranCard extends StatelessWidget {
  final Kehadiran jadwal;

  const KehadiranCard({Key? key, required this.jadwal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // shadow hanya di sini
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Semester box
          Container(
            width: 70,
            height: 105, // fix height supaya sejajar
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
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jadwal.matkul,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Persentase Kehadiran (${jadwal.persentase.toStringAsFixed(0)}%)',
                  style: const TextStyle(fontSize: 13, color: Colors.blue),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: jadwal.kehadiran
                      .map((item) => KehadiranChip(
                            label: item.label,
                            jumlah: item.jumlah,
                            color: Color(item.colorHex),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
