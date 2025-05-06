import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/widgets/cards/schedule_card.dart';
import 'package:stipres/screens/features_student/widgets/cards/weeklyCalendar_card.dart';
import 'package:stipres/screens/features_student/widgets/link/allSchedule_link.dart';
import 'package:stipres/screens/features_student/widgets/link/calendar_link.dart';
import 'package:stipres/controllers/features_student/home/dashboard_controller.dart';
// import 'package:stipres/screens/features_student/widgets/cards/jadwal_card.dart';
import 'package:stipres/styles/constant.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  var height, width;

  final dashboardC = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor, // Set background putih ke seluruh layar
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // HEADER
                  Container(
                    width: width,
                    height: 120,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgheader.png'),
                        fit: BoxFit.cover, // agar penuh
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 70),
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
                              Get.toNamed("/student/notification-screen");
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
                    top: 80,
                    left: 30,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/foto_izzul.jpg",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataAkun.namaLengkap,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dataAkun.nim,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40), // Jarak agar profil tidak tertutup

              // KONTEN PUTIH DI BAWAH
              Container(
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
                              Material(
                                color: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AttendanceScreen()),
                                      );
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Kehadiran',
                                      items: 4,
                                      imagePath:
                                          'assets/icons/ic_kehadiran.png',
                                      bgColor: const Color.fromARGB(
                                          255, 187, 235, 251),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Material(
                                color: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed("/student/presence-screen");
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Presensi',
                                      items: 4,
                                      imagePath:
                                          'assets/icons/rekap_kehadiran.png',
                                      bgColor: const Color.fromARGB(
                                          255, 187, 251, 193),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12),

                              Material(
                                color: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed("/student/calendar-screen");
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Kalender Akademik',
                                      items: 4,
                                      imagePath:
                                          'assets/icons/kalender_akademik.png',
                                      bgColor: const Color.fromARGB(
                                          255, 251, 187, 187),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),

                              Material(
                                color: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed("/student/lecture-screen");
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Perkuliahan Online',
                                      items: 4,
                                      imagePath: 'assets/icons/zoom.png',
                                      bgColor: const Color.fromARGB(
                                          255, 187, 191, 251),
                                    ),
                                  ),
                                ),
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

                    Obx(() => Container(
                          alignment: Alignment.center,
                          color: mainColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: dashboardC.jadwalList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20),
                                    Image.asset(
                                      'icons/ic_noData.png',
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
                                  itemCount: dashboardC.jadwalList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return JadwalCard(
                                        jadwal: dashboardC.jadwalList[index]);
                                  },
                                ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int items;
  final String imagePath;
  final Color bgColor;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.items,
    required this.imagePath,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFC8C8C8),
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
            style: TextStyle(
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
                fontWeight: FontWeight.w500),
          ),
        ],
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
