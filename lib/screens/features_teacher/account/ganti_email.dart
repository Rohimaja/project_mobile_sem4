import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_teacher/account/kode_verifikasi.dart';
import 'package:stipres/screens/reusable/custom_header.dart';
import 'package:stipres/styles/constant.dart';

class GantiEmail extends StatelessWidget {
  GantiEmail({Key? key}) : super(key: key);
  var height, width;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 237, 235, 251),
    body: SingleChildScrollView(
      child: Column(
        children: [
          CustomHeader(title: "Ganti Email"),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verifikasi Email",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 30, 136, 228),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Email membantu anda untuk mengelola akun, email tidak dapat dilihat oleh pengguna lain',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(221, 139, 139, 139),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "johndoe@gmail.com",
                          prefixIcon: Icon(Icons.mail, color: Colors.grey,),
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
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: ElevatedButton(
        onPressed: () {
          Get.to(KodeVerifikasi()); // Ganti dengan navigasi yang sesuai
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          "Selanjutnya",
          style: TextStyle(
            color: whiteColor,
            fontWeight: bold,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}
}
