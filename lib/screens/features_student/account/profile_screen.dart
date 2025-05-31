import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/controllers/features_student/account/profile_controller.dart';
import 'package:stipres/constants/styles.dart';
import 'package:stipres/screens/features_student/home/notifications/notification_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var height, width;

  final profileC = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 237, 235, 251), // Set background putih ke seluruh layar
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
                          color: Color.fromARGB(255, 237, 235, 251),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                          ) // warna ungu muda
                          ),
                    ),
                  ),

                  // PROFIL (TENGAH)
                  Positioned(
                    top: 105,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 237, 235, 251),
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(child: Obx(() {
                                final imageUrl = profileC.storedProfile.value;
                                return (imageUrl.isNotEmpty)
                                    ? FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/icons/ic_profile.jpeg",
                                        image: imageUrl,
                                        height: 90,
                                        width: 90,
                                        fit: BoxFit.cover,
                                        imageErrorBuilder:
                                            (context, url, error) =>
                                                Image.asset(
                                          "assets/icons/ic_profile.jpeg",
                                          height: 90,
                                          width: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Image.asset(
                                        "assets/icons/ic_profile.jpeg",
                                        height: 90,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      );
                              })),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60), // Jarak agar profil tidak tertutup

              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 235, 251),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 48, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama Lengkap",
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start),
                          const SizedBox(height: 7),
                          Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Obx(() => Text(
                                      profileC.storedName.value,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 161, 161, 161),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 9),
                          Text("NIM",
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start),
                          const SizedBox(height: 7),
                          Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Obx(() => Text(
                                      profileC.storedNim.value,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 161, 161, 161),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 9),
                          Text("Email",
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start),
                          const SizedBox(height: 7),
                          Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Obx(() => Text(
                                      profileC.storedEmail.value,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 161, 161, 161),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 9),
                          Text("Program Studi",
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start),
                          const SizedBox(height: 7),
                          Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Obx(
                                  () => Text(profileC.storedNamaProdi.value,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 161, 161, 161),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed("/student/view-profile-screen");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: blueColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/ic_view.png',
                                          height: 20, width: 20),
                                      SizedBox(width: 10),
                                      Text(
                                        "Lihat Profil",
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontWeight: bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                              width: width,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed("/student/settings-screen");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/ic_settings.png',
                                            height: 30,
                                            width: 30),
                                        SizedBox(width: 16),
                                        Text("Pengaturan",
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20), // Jarak antar item
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          "/auth/forget-password/step3");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/ic_gantipassword.png',
                                            height: 30,
                                            width: 30),
                                        SizedBox(width: 16),
                                        Text("Ganti Password",
                                            style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    profileC.logout();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: redColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/ic_logout.png',
                                          height: 20, width: 20),
                                      SizedBox(width: 10),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontWeight: bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
