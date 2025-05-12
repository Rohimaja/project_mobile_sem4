import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';

class OfflineScreen extends StatelessWidget {
  OfflineScreen({super.key});

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: 80,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/bgheader.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/icons/ic_back.png',
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Presensi Mata Kuliah",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(child: Text("OFFLINE"))
        ],
      ),
    );
  }
}
