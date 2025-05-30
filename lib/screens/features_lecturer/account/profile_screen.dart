import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/controllers/features_lecturer/account/profile_controller.dart';
import 'package:stipres/constants/styles.dart';
import 'package:stipres/screens/auth/login_screen.dart';

class ProfileScreenLecturer extends StatelessWidget {
  ProfileScreenLecturer({Key? key}) : super(key: key);
  var height, width;

  final _controller = Get.find<ProfileController>();

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
                                final foto = _controller.storedProfile.value;
                                return (foto.isNotEmpty)
                                    ? FadeInImage.assetNetwork(
                                        placeholder:
                                            "assets/icons/ic_profile.jpeg",
                                        image: foto,
                                        height: 90,
                                        width: 90,
                                        fit: BoxFit.cover,
                                        imageErrorBuilder:
                                            (context, url, error) {
                                          return Image.asset(
                                            "assets/icons/ic_profile.jpeg",
                                            height: 90,
                                            width: 90,
                                            fit: BoxFit.cover,
                                          );
                                        },
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

              // KONTEN PUTIH DI BAWAH
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Obx(() {
                              return Text(
                                _controller.storedName.value,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 161, 161, 161),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            })),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text("NIP",
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Obx(() {
                              return Text(
                                _controller.storedNip.value,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 161, 161, 161),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            })),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Obx(() {
                              return Text(
                                _controller.storedEmail.value,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 161, 161, 161),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            })),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Get.toNamed("/lecturer/view-profile-screen");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(double.infinity, 50),
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
                    SizedBox(height: 20),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/ic_settings.png',
                                      height: 30, width: 30),
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
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Get.toNamed("/auth/forget-password/step3");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                              _showLogoutDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: redColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(double.infinity, 50),
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
        ],
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  bool saveLoginInfo = true;
  final _controller = Get.find<ProfileController>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'KONFIRMASI LOGOUT',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    'Apakah anda yakin ingin keluar?',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Simpan informasi login anda',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Checkbox(
                      value: saveLoginInfo,
                      activeColor: Colors.blue, // warna kotak ketika dicentang
                      checkColor: Colors.white, // warna centangnya
                      onChanged: (bool? value) {
                        setState(() {
                          saveLoginInfo = value ?? true;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle logout action
                          _controller.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
