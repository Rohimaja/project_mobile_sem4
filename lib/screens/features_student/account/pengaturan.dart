import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/account/alamat_email.dart';
import 'package:stipres/screens/features_student/account/bantuan.dart';
import 'package:stipres/styles/constant.dart';

class Pengaturan extends StatelessWidget {
  Pengaturan({Key? key}) : super(key: key);
  var height, width;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context)
        .size
        .width; // Pastikan variabel width terdefinisi
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 235, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 23, right: 18, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan Aplikasi",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 30, 136, 228),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/student/change-email-screen");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/ic_key.png',
                                  height: 30, width: 30),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Akun",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "Ganti akun, ganti email",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 161, 161, 161),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 30, 136, 228),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/icons/ic_notification.png',
                                      height: 30,
                                      width: 30),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Notifikasi",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Pengingat notifikasi",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 161, 161, 161),
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Transform.scale(
                                scale: 0.65,
                                child: Switch(
                                  value: true,
                                  activeColor:
                                      Color.fromARGB(255, 30, 136, 228),
                                  activeTrackColor:
                                      Color.fromARGB(255, 189, 222, 251),
                                  inactiveThumbColor: Colors.grey,
                                  inactiveTrackColor:
                                      Color.fromARGB(255, 224, 224, 224),
                                  onChanged: (bool newValue) {
                                    print(newValue);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/ic_personalisasi.png',
                                height: 30, width: 30),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Personalisasi",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  "Atur tema",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 161, 161, 161),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/student/help-screen");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/ic_help.png',
                                  height: 30, width: 30),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bantuan",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "Ketentuan layanan, kebijakan privasi",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 161, 161, 161),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 30, 136, 228),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(1.0),
                                child: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: 70,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/bgheader.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(100),
                  customBorder: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/icons/ic_back.png'),
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Pengaturan",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      "> $title",
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildNumberedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            "${index + 1}. ${items[index]}",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        );
      }),
    );
  }
}
