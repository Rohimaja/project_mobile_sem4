import 'package:flutter/material.dart';
import 'package:stipres/screens/features_student/models/notification_model.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    String iconPath;

    // Tentukan ikon dan warna berdasarkan tipe
    switch (notification.type) {
      case NotificationType.presensiGagal:
        backgroundColor = Colors.red;
        iconPath = 'icons/ic_warning.png';
        break;
      case NotificationType.presensiSukses:
        backgroundColor = Colors.green;
        iconPath = 'icons/ic_presence.png';
        break;
      case NotificationType.batasPresensi:
        backgroundColor = Colors.blue;
        iconPath = 'icons/ic_time.png';
        break;
      case NotificationType.pengumuman:
        backgroundColor = Colors.orange;
        iconPath = 'icons/ic_announcement.png';
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Penting agar icon bisa naik
        children: [
          // Ikon di dalam lingkaran, diletakkan di bagian atas
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(iconPath, color: Colors.white),
          ),
          const SizedBox(width: 15),
          // Isi teks notifikasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.message,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
