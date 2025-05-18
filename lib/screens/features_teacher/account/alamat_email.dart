import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_teacher/account/ganti_email.dart';
import 'package:stipres/screens/reusable/custom_header.dart';
import 'package:stipres/styles/constant.dart';
import 'package:flutter/gestures.dart';

class AlamatEmail extends StatelessWidget {
  AlamatEmail({Key? key}) : super(key: key);
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
            CustomHeader(title: "Alamat Email"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 30, right: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/ic_email.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Email membantu anda untuk mengelola akun, email tidak dapat \n dilihat oleh pengguna lain',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(221, 139, 139, 139),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors
                              .grey[300], // Atau sesuaikan dengan tema kamu
                          indent: 5, // Margin kiri
                          endIndent: 5, // Margin kanan
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Verifikasi Email",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 30, 136, 228),
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: "johndoe@gmail.com",
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: greyTextStyle.copyWith(fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: blueColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 8), // Jarak antara TextField dan icon
                      Material(
                        color: Colors
                            .transparent, // Supaya background tetap transparan
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                              100), // Opsional: untuk ripple bulat
                          onTap: () {
                            Get.to(GantiEmail());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(
                                8.0), // Memberi ruang agar ripple terlihat
                            child: Icon(Icons.edit, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // ini membuat vertikal rata tengah
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Image.asset(
                          'assets/icons/ic_warning.png', // ganti dengan path gambarmu
                          width: 14,
                          height: 14,
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Apakah ini masih email anda? ',
                            style: blackTextStyle.copyWith(
                              fontSize: 10,
                              color: Color.fromARGB(255, 161, 161, 161),
                              fontWeight: FontWeight.w800,
                            ),
                            children: [
                              TextSpan(
                                text: 'Konfirmasi',
                                style: blackTextStyle.copyWith(
                                  fontSize: 10,
                                  color: blueColor,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Konfirmasi diklik");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
