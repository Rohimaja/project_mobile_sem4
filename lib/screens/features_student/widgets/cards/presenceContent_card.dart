import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/models/student/get_presence_model.dart';
class MatkulDetailCard extends StatelessWidget {
  final GetPresenceApi data;

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
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("ID Matkul", data.kodeMatkul!, bold: true),
          const SizedBox(height: 8),
          _buildDetailRow("Nama Matkul", data.namaMatkul!, bold: true),
          const SizedBox(height: 8),
          _buildDetailRow("Jam Matkul", data.durasiPresensi!, bold: true),
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
            style: GoogleFonts.plusJakartaSans(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class JamChip extends StatelessWidget {
  final String jam;

  const JamChip({super.key, required this.jam});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange.shade600,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        jam,
        style: GoogleFonts.plusJakartaSans(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
