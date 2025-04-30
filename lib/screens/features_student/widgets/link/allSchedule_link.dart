import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/home/all_schedule_screen.dart'; // pastikan path-nya sesuai

class AllScheduleLink extends StatefulWidget {
  const AllScheduleLink({super.key});

  @override
  _AllScheduleLinkState createState() => _AllScheduleLinkState();
}

class _AllScheduleLinkState extends State<AllScheduleLink> {
  bool _isUnderlined = false;

  void _handleTap(BuildContext context) async {
    setState(() {
      _isUnderlined = true;
    });

    // Navigasi ke halaman KalenderScreen
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllScheduleScreen()),
    );

    // Setelah kembali, hilangkan underline
    if (mounted) {
      setState(() {
        _isUnderlined = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Row(
        children: [
          Text(
            "Semua Jadwal",
            style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF1E88E4),
              fontWeight: FontWeight.w600,
              fontSize: 15,
              decoration: _isUnderlined
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor:
                  const Color(0xFF1E88E4), // Ini warna underline-nya
              decorationThickness: 1.5, // Optional: buat lebih tegas
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF1E88E4),
          ),
        ],
      ),
    );
  }
}
