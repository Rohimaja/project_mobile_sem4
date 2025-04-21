import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/models/kehadiran_model.dart';
import 'package:stipres/screens/features_student/widgets/cards/kehadiran_card.dart';
import 'package:stipres/styles/constant.dart';

class KehadiranPage extends StatelessWidget {
  KehadiranPage({super.key});
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    // Dummy data Kehadiran
    final List<Kehadiran> dataKehadiran = [
      Kehadiran(
        semester: 3,
        matkul: 'Pemrograman Dasar',
        persentase: 100,
        kehadiran: [
          KehadiranItem(label: 'Hadir', jumlah: 1, colorHex: 0xFF4CAF50),
          KehadiranItem(label: 'Sakit', jumlah: 1, colorHex: 0xFFFFEB3B),
          KehadiranItem(label: 'Izin', jumlah: 1, colorHex: 0xFF2196F3),
          KehadiranItem(label: 'Alpa', jumlah: 1, colorHex: 0xFFF44336),
        ],
      ),
      Kehadiran(
        semester: 3,
        matkul: 'Pemrograman Dasar',
        persentase: 100,
        kehadiran: [
          KehadiranItem(label: 'Hadir', jumlah: 2, colorHex: 0xFF4CAF50),
          KehadiranItem(label: 'Sakit', jumlah: 3, colorHex: 0xFFFFEB3B),
          KehadiranItem(label: 'Izin', jumlah: 4, colorHex: 0xFF2196F3),
          KehadiranItem(label: 'Alpa', jumlah: 2, colorHex: 0xFFF44336),
        ],
      ),
      Kehadiran(
        semester: 3,
        matkul: 'Pemrograman Dasar',
        persentase: 100,
        kehadiran: [
          KehadiranItem(label: 'Hadir', jumlah: 2, colorHex: 0xFF4CAF50),
          KehadiranItem(label: 'Sakit', jumlah: 3, colorHex: 0xFFFFEB3B),
          KehadiranItem(label: 'Izin', jumlah: 4, colorHex: 0xFF2196F3),
          KehadiranItem(label: 'Alpa', jumlah: 2, colorHex: 0xFFF44336),
        ],
      ),
      Kehadiran(
        semester: 3,
        matkul: 'Pemrograman Dasar',
        persentase: 100,
        kehadiran: [
          KehadiranItem(label: 'Hadir', jumlah: 2, colorHex: 0xFF4CAF50),
          KehadiranItem(label: 'Sakit', jumlah: 3, colorHex: 0xFFFFEB3B),
          KehadiranItem(label: 'Izin', jumlah: 4, colorHex: 0xFF2196F3),
          KehadiranItem(label: 'Alpa', jumlah: 2, colorHex: 0xFFF44336),
        ],
      ),
      Kehadiran(
        semester: 3,
        matkul: 'Pemrograman Dasar',
        persentase: 100,
        kehadiran: [
          KehadiranItem(label: 'Hadir', jumlah: 2, colorHex: 0xFF4CAF50),
          KehadiranItem(label: 'Sakit', jumlah: 3, colorHex: 0xFFFFEB3B),
          KehadiranItem(label: 'Izin', jumlah: 4, colorHex: 0xFF2196F3),
          KehadiranItem(label: 'Alpa', jumlah: 2, colorHex: 0xFFF44336),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 235, 251),
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
                    height: 80,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('images/bgheader.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors
                              .transparent, // supaya ripple doang yang keliatan
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            borderRadius:
                                BorderRadius.circular(100), // ripple bulat
                            customBorder:
                                const CircleBorder(), // bikin ripple nya bulat
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // kasih ruang buat ripple keliatan
                              child: Image.asset(
                                'icons/ic_back.png',
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Rekap Kehadiran Mata Kuliah",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            'icons/ic_search.png',
                            height: 18,
                            width: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Corner Bottom-Right U Shape
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
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 235, 251),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Rekap Kehadiran Mata Kuliah',
                        style: TextStyle(
                          fontSize: 16,
                          color: blueColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    ListView.builder(
                      itemCount: dataKehadiran.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return KehadiranCard(jadwal: dataKehadiran[index]);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
