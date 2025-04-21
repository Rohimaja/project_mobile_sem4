
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/home/kehadiran_screen.dart';
import 'package:stipres/screens/features_student/home/materi_screen.dart';
import 'package:stipres/screens/features_student/models/jadwal_model.dart';
import 'package:stipres/screens/features_student/widgets/cards/jadwal_card.dart';
import 'package:stipres/styles/constant.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  var height, width;

  final List<JadwalModel> jadwalHariIni = [
    JadwalModel(
      waktu: '07.00 - 10.00 WIB',
      mataKuliah: 'Pemrograman Dasar',
      lokasi: 'Gedung JTI Ruang 3.3',
      durasi: '2 Jam',
      chips: ['Presensi', 'Zoom', 'Materi'],
    ),
    JadwalModel(
      waktu: '10.15 - 12.00 WIB',
      mataKuliah: 'Struktur Data',
      lokasi: 'Gedung JTI Ruang 2.2',
      durasi: '1.5 Jam',
      chips: ['Presensi', 'Materi'],
    ),
    JadwalModel(
      waktu: '13.00 - 15.00 WIB',
      mataKuliah: 'Basis Data',
      lokasi: 'Gedung JTI Ruang 1.1',
      durasi: '2 Jam',
      chips: ['Presensi', 'Zoom'],
    ),
    JadwalModel(
      waktu: '07.00 - 10.00 WIB',
      mataKuliah: 'Kewirausahaan',
      lokasi: 'Gedung JTI Ruang 3.3',
      durasi: '2 Jam',
      chips: ['Presensi', 'Zoom', 'Materi'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 237, 235, 251), // Set background putih ke seluruh layar
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
                            width: 5), // jarak kecil antara logo dan teks
                        Expanded(
                          child: Text(
                            "STIKES PANTI WALUYA MALANG",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
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
                          color: Color.fromARGB(255, 237, 235, 251),
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
                          decoration: const BoxDecoration(
                            color: Colors.white,
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
                              "Izzul Islam Ramadhan",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "E41231215",
                              style: GoogleFonts.poppins(
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
                padding: const EdgeInsets.only(top: 10, bottom: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 235, 251),
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
                                  style:
                                      blackTextStyle, // TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: "Utama",
                                  style:
                                      greyTextStyle, // TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                "lihat semua",
                                style: TextStyle(
                                  color: Color(0xFF1E88E4),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xFF1E88E4),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Horizontal Scroll Card
                    SizedBox(
                      height: 180,
                      width: width,
                      child: Container(
                        color: Colors.white, // Warna latar belakang
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(16),
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
                                                KehadiranPage()),
                                      );
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Kehadiran',
                                      items: 4,
                                      imagePath: 'icons/kehadiran.png',
                                      bgColor: const Color.fromARGB(
                                          255, 187, 251, 189),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KehadiranPage()),
                                      );
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Presensi',
                                      items: 4,
                                      imagePath: 'icons/rekap_kehadiran.png',
                                      bgColor: const Color.fromARGB(
                                          255, 251, 187, 189),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KehadiranPage()),
                                      );
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Kalender Akademik',
                                      items: 4,
                                      imagePath: 'icons/kalender_akademik.png',
                                      bgColor: const Color.fromARGB(
                                          255, 249, 251, 187),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KehadiranPage()),
                                      );
                                    },
                                    splashColor: Colors.blue.withOpacity(0.3),
                                    child: CategoryCard(
                                      title: 'Perkuliahan Online',
                                      items: 4,
                                      imagePath: 'icons/zoom.png',
                                      bgColor: const Color.fromARGB(
                                          255, 251, 232, 187),
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

                    // Title Jadwal Hari Ini
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 235, 251),
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
                                  style: blackTextStyle,
                                ),
                                TextSpan(
                                  text: "Hari Ini",
                                  style: greyTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                "lihat semua",
                                style: TextStyle(
                                  color: Color(0xFF1E88E4),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xFF1E88E4),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 5),

                    Container(
                      color: Colors.white, // Warna latar belakang putih
                      padding: EdgeInsets.all(20), // Pindahkan padding ke sini
                      child: ListView.builder(
                        itemCount: jadwalHariIni.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return JadwalCard(jadwal: jadwalHariIni[index]);
                        },
                      ),
                    )
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
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: whiteColor, // warna garis outline
          width: 1.5, // ketebalan garis
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
          const SizedBox(height: 8),
          AutoSizeText(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 1,
            minFontSize: 10,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "$items items",
            style: TextStyle(color: Colors.grey.shade600),
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
