enum NotificationType {
  presensiSukses,
  presensiGagal,
  pengumuman,
  batasPresensi
}

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final String iconAssetPath; // tambahan properti

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    required this.iconAssetPath,
  });
}
