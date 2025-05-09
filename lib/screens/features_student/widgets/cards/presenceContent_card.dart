import 'package:flutter/material.dart';
import 'package:stipres/screens/features_student/models/presenceContent_model.dart';

class MatkulDetailCard extends StatelessWidget {
  final MatkulDetailModel data;

  const MatkulDetailCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("ID Matkul", data.idMatkul, bold: true),
          const SizedBox(height: 8),
          _buildDetailRow("Nama Matkul", data.namaMatkul, bold: true),
          const SizedBox(height: 8),
          _buildDetailRow("Jam Matkul", data.jamMatkul, bold: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {bool bold = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(title)),
        const Text(" : "),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
