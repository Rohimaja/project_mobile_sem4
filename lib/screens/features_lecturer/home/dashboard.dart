import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:stipres/controllers/features_lecturer/home/dashboard_controller.dart';
import 'package:stipres/screens/features_lecturer/home/notification_screen.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/schedule_card.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/weeklyCalendar_card.dart';
import 'package:stipres/screens/features_lecturer/widgets/link/allSchedule_link.dart';
import 'package:stipres/screens/features_lecturer/widgets/link/calendar_link.dart';
import 'package:stipres/constants/styles.dart';

class DashboardScreenLecturer extends StatelessWidget {
  DashboardScreenLecturer({super.key});
  var height, width;

  final _controller = Get.find<DashboardController>();

  Logger log = Logger();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    _controller.fetchSchedule();

    return Scaffold(
      backgroundColor: mainColor, // Set background putih ke seluruh layar
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // HEADER
                  Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgheader.png'),
                        fit: BoxFit.cover, // agar penuh
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        top: 24, left: 16, right: 16, bottom: 70),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo_PantiWaluya.png',
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                            width: 3), // jarak kecil antara logo dan teks
                        Expanded(
                          child: Text(
                            "STIKES Panti Waluya Malang",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Material(
                          color:
                              Colors.transparent, // biar background transparan
                          shape: const CircleBorder(), // biar ripple bulat
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationScreen()),
                              );
                            },
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.only(
                                  top: 3, bottom: 6, left: 6, right: 6),
                              child: const Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: -44,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 44,
                      decoration: BoxDecoration(
                        color: blueColor, // warna ungu muda
                      ),
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
                          ) // warna ungu muda
                          ),
                    ),
                  ),

                  // PROFIL (MENJOROK KE PUTIH)
                  Positioned(
                    top: 110,
                    left: 30,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(child: Obx(() {
                            final imageUrl = _controller.storedProfile.value;
                            return (imageUrl.isNotEmpty)
                                ? FadeInImage.assetNetwork(
                                    placeholder: "assets/icons/ic_profile.jpeg",
                                    image: imageUrl,
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                    imageErrorBuilder: (context, url, error) =>
                                        Image.asset(
                                      "assets/icons/ic_profile.jpeg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Image.asset(
                                    "assets/icons/ic_profile.jpeg",
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  );
                          })),
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          return SizedBox(
                            width: width * 0.65,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controller.storedName.value,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _controller.storedNip.value,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    color: blueColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40), // Jarak agar profil tidak tertutup

              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                    color: Color(0XEDEBFB),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: "Menu ",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: blackColor)),
                                  TextSpan(
                                    text: "Utama",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Horizontal Scroll Card
                      SizedBox(
                        height: 180,
                        width: width,
                        child: Container(
                          color: mainColor, // Warna latar belakang
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                // === Card dengan Navigasi + Ripple ===
                                CategoryCard(
                                  title: 'Kehadiran',
                                  items: 4,
                                  imagePath: 'assets/icons/ic_kehadiran.png',
                                  bgColor:
                                      const Color.fromARGB(255, 187, 235, 251),
                                  onTap: () {
                                    Get.toNamed("/lecturer/attendance-screen");
                                  },
                                ),

                                const SizedBox(width: 12),

                                CategoryCard(
                                  title: 'Presensi',
                                  items: 4,
                                  imagePath: 'assets/icons/rekap_kehadiran.png',
                                  bgColor:
                                      const Color.fromARGB(255, 187, 251, 193),
                                  onTap: () {
                                    Get.toNamed("/lecturer/presence-screen");
                                  },
                                ),

                                SizedBox(width: 12),

                                CategoryCard(
                                  title: 'Jadwal Mengajar',
                                  items: 4,
                                  imagePath:
                                      'assets/icons/ic_jadwal_perkuliahan.png',
                                  bgColor:
                                      const Color.fromARGB(255, 251, 232, 187),
                                  onTap: () {
                                    Get.toNamed(
                                        "/lecturer/all-schedule-screen");
                                  },
                                ),

                                SizedBox(width: 12),

                                CategoryCard(
                                  title: 'Kalender Akademik',
                                  items: 4,
                                  imagePath:
                                      'assets/icons/kalender_akademik.png',
                                  bgColor:
                                      const Color.fromARGB(255, 251, 187, 187),
                                  onTap: () {
                                    Get.toNamed("/lecturer/calendar-screen");
                                  },
                                ),

                                const SizedBox(width: 12),

                                CategoryCard(
                                  title: 'Perkuliahan Online',
                                  items: 4,
                                  imagePath: 'assets/icons/zoom.png',
                                  bgColor:
                                      const Color.fromARGB(255, 187, 191, 251),
                                  onTap: () {
                                    Get.toNamed("/lecturer/lecture-screen");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: "Kalender",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: blackColor)),
                                ],
                              ),
                            ),
                            CalendarLink(),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      WeeklyCalendar(),

                      SizedBox(height: 16),

                      // Title Jadwal Hari Ini
                      Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: "Jadwal ",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: blackColor)),
                                  TextSpan(
                                    text: "Hari Ini",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            AllScheduleLink(),
                          ],
                        ),
                      ),

                      Obx(() {
                        return Container(
                          alignment: Alignment.center,
                          color: mainColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: _controller.jadwalList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20),
                                    Image.asset(
                                      'assets/icons/ic_noData.png',
                                      height: 120,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Tidak ada jadwal hari ini',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 15,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: _controller.jadwalList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(top: 0),
                                  itemBuilder: (context, index) {
                                    return ScheduleCardLecturer(
                                        jadwal: _controller.jadwalList[index]);
                                  },
                                ),
                        );
                      })
                    ],
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int items;
  final String imagePath;
  final Color bgColor;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.items,
    required this.imagePath,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: const Color.fromARGB(255, 120, 120, 120).withOpacity(0.2),
        highlightColor: Colors.blue.withOpacity(0.1),
        onTap: onTap, // Gunakan onTap dari parameter
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFC8C8C8),
              width: 0.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AutoSizeText(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                maxLines: 1,
                minFontSize: 10,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "$items items",
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromARGB(255, 98, 98, 98),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChipItem extends StatelessWidget {
  final String label;

  const ChipItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
