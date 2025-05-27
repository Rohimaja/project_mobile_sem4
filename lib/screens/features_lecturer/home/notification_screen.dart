import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_lecturer/models/notification_model.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/notification_card.dart';
import 'package:stipres/constants/styles.dart';
import 'package:stipres/screens/reusable/custom_header.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String selectedCategory = 'Semua';

  final List<NotificationModel> allNotifications = [
    NotificationModel(
      title: 'Presensi Gagal!',
      message:
          'Presensi anda pada jam 11.45 WIB pada mata kuliah Pemrograman Dasar gagal dilakukan.',
      time: '2 jam yang lalu',
      type: NotificationType.presensiGagal,
      iconAssetPath: 'assets/icons/ic_warning.png',
    ),
    NotificationModel(
      title: 'Pengumuman Perubahan Jadwal!',
      message:
          'Terdapat perubahan jadwal perkuliahan minggu depan, silahkan periksa pada fitur jadwal.',
      time: '6 jam yang lalu',
      type: NotificationType.pengumuman,
      iconAssetPath: 'assets/icons/ic_announcement.png',
    ),
    NotificationModel(
      title: 'Presensi Berhasil!',
      message:
          'Anda telah melakukan presensi pada 09.00 WIB di mata kuliah Pemrograman Dasar.',
      time: 'Kemarin',
      type: NotificationType.presensiSukses,
      iconAssetPath: 'assets/icons/ic_presence.png',
    ),
    NotificationModel(
      title: 'Batas Presensi Hampir Tercapai!',
      message:
          'Anda belum melakukan presensi mata kuliah Kewirausahaan hari ini.',
      time: '16 Maret',
      type: NotificationType.batasPresensi,
      iconAssetPath: 'assets/icons/ic_time.png',
    ),
  ];

  List<NotificationModel> get filteredNotifications {
    if (selectedCategory == 'Semua') return allNotifications;
    return allNotifications.where((notif) {
      if (selectedCategory == 'Presensi') {
        return notif.type == NotificationType.batasPresensi ||
            notif.type == NotificationType.presensiSukses ||
            notif.type == NotificationType.presensiGagal;
      } else if (selectedCategory == 'Pengumuman') {
        return notif.type == NotificationType.pengumuman;
      }
      return true; // For 'Semua' or other categories, include all notifications
    }).toList();
  }

  Widget buildCategoryButton(String label) {
    final isSelected = selectedCategory == label;
    final color = isSelected ? Colors.purple : blueColor;

    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 3,
              color: isSelected ? Colors.purple : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomHeader(title: "Notifikasi"),
                  Positioned(
                    bottom: -44,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 44,
                      color: blueColor,
                    ),
                  ),
                  Positioned(
                    bottom: -45,
                    right: 0,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Filter Buttons
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align ke kiri
                  children: [
                    buildCategoryButton("Semua"),
                    const SizedBox(width: 20), // Spasi antar tombol
                    buildCategoryButton("Presensi"),
                    const SizedBox(width: 20),
                    buildCategoryButton("Pengumuman"),
                  ],
                ),
              ),

              // Animated List or Empty Placeholder
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                            begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(animation);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                  child: filteredNotifications.isEmpty
                      ? Center(
                          key: const ValueKey('empty'),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/empty_state.png',
                                  height: 150),
                              const SizedBox(height: 20),
                              Text(
                                "Tidak ada notifikasi",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          key: ValueKey<String>(selectedCategory),
                          padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                          physics: const BouncingScrollPhysics(),
                          itemCount: filteredNotifications.length,
                          itemBuilder: (context, index) {
                            final notif = filteredNotifications[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: NotificationCard(notification: notif),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
