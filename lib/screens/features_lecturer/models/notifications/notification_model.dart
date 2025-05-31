import 'package:stipres/screens/features_lecturer/models/notifications/detail_notification_model.dart';

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final String iconAssetPath;

  // Properti tambahan
  final String? namaUser;
  final String? tanggal;
  final String? jam;
  final String? mataKuliah;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    required this.iconAssetPath,
    this.namaUser,
    this.tanggal,
    this.jam,
    this.mataKuliah,
  });
}
