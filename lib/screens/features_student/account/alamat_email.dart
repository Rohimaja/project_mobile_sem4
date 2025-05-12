import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';
import 'package:flutter/gestures.dart';


class AlamatEmail extends StatelessWidget {
  AlamatEmail({Key? key}) : super(key: key);
  var height, width;

  @override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width; // Pastikan variabel width terdefinisi
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 237, 235, 251),
    body: SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 23, right: 18, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alamat Email",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 30, 136, 228),
                  ),
                ),
                SizedBox(height: 7),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "johndoe@gmail.com",
                    prefixIcon: Icon(Icons.mail),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle:
                        greyTextStyle.copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: blueColor)),
                    icon: Icon(Icons.edit)
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // ini membuat vertikal rata tengah
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
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
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
                  "Alamat Email",
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
