import 'package:flutter/material.dart';
import 'package:stipres/screens/features_student/models/notification_model.dart';

class NotificationChip extends StatelessWidget {
  final NotificationType type;

  const NotificationChip({required this.type});

  @override
  Widget build(BuildContext context) {
    String label =
        type == NotificationType.presensiSukses ? 'Presensi' : 'Pengumuman';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: type == NotificationType.presensiSukses
            ? Colors.blue[50]
            : Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: type == NotificationType.presensiSukses
              ? Colors.blue
              : Colors.orange,
        ),
      ),
    );
  }
}
