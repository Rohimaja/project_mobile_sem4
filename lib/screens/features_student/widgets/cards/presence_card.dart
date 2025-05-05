import 'package:flutter/material.dart';
import 'package:stipres/models/student/presensi_model.dart';
import 'package:stipres/screens/features_student/home/presence/presence_content_screen.dart';
import 'package:stipres/screens/features_student/widgets/chips/presence_chip.dart';

class PresensiCard extends StatelessWidget {
  final PresensiModelApi data;

  const PresensiCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFE6DFF5),
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
          Container(
            width: 70,
            height: 105,
            decoration: BoxDecoration(
              color: const Color(0xFF6A1B9A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Semester", style: TextStyle(color: Colors.white)),
                Text(
                  data.semester.toString(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PresensiChip(jam: data.durasiPresensi),
                const SizedBox(height: 6),
                Text(
                  data.namaMatkul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                IconTextInfo(
                    iconPath: 'icons/ic_location.png', text: data.namaRuangan!),
                const SizedBox(height: 4),
                IconTextInfo(
                    iconPath: 'icons/ic_duration.png', text: data.durasiMatkul),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PresenceContentScreen()),
                );
              },
              borderRadius: BorderRadius.circular(24),
              splashColor: Colors.purple.withOpacity(0.2),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextInfo extends StatelessWidget {
  final String iconPath;
  final String text;

  const IconTextInfo({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          height: 16,
          width: 16,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
