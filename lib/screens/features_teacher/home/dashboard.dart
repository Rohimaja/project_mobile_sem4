import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  var height, width;

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
                              "assets/images/foto_aldo.jpg",
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
                              "Aldo Rayhan Radittyanuh",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "199205142023052008",
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

              const SizedBox(height: 60), // Jarak agar profil tidak tertutup

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
                        color: Colors.white,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: blackColor,
                            width: 1,
                          ),
                        ),
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
                                  color: Color.fromARGB(255, 0, 94, 171),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color.fromARGB(255, 0, 94, 171),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Horizontal Scroll Card
                    SizedBox(
                      height: 160,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            CategoryCard(
                              title: 'Kehadiran',
                              items: 7,
                              imagePath: 'assets/images/kehadiran.png',
                              bgColor: Colors.green.shade100,
                            ),
                            const SizedBox(width: 12),
                            CategoryCard(
                              title: 'Materi',
                              items: 7,
                              imagePath: 'assets/images/materi.png',
                              bgColor: Colors.blue.shade100,
                            ),
                            const SizedBox(width: 12),
                            CategoryCard(
                              title: 'Rekap Kehadiran',
                              items: 4,
                              imagePath: 'assets/images/rekap_kehadiran.png',
                              bgColor: Colors.pink.shade100,
                            ),
                            const SizedBox(width: 12),
                            CategoryCard(
                              title: 'Kalender Akademik',
                              items: 4,
                              imagePath: 'assets/images/kalender_akademik.png',
                              bgColor: Colors.yellow.shade100,
                            ),
                            const SizedBox(width: 12),
                            CategoryCard(
                              title: 'Perkuliahan Online',
                              items: 4,
                              imagePath: 'assets/images/zoom.png',
                              bgColor: Colors.orange.shade100,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Title Jadwal Hari Ini
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: blackColor,
                            width: 1,
                          ),
                        ),
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
                                  color: Color.fromARGB(255, 0, 94, 171),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color.fromARGB(255, 0, 94, 171),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    ListView.builder(
                      itemCount: 3, // jumlah data jadwal
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/ic_clock.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  "07.00 - 10.00 WIB",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF3E0),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // Gambar buku
                                  Image.asset(
                                    'assets/icons/ic_matakuliah.png', // ganti sesuai path file kamu
                                    height: 70,
                                    width: 70,
                                  ),
                                  const SizedBox(width: 15),
                                  // Konten teks di sebelah kanan gambar
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: Text(
                                                "Pemrograman Dasar",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.purple,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Text(
                                                "Lihat Jadwal",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/ic_location.png',
                                              height: 16,
                                              width: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            const Text("Gedung JTI Ruang 3.3"),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/ic_duration.png',
                                              height: 16,
                                              width: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            const Text("2 Jam"),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: const [
                                            ChipItem(label: "Presensi"),
                                            Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: ChipItem(label: "Zoom"),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: ChipItem(label: "Materi"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
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
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
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
