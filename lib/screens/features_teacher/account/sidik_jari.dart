import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';

class SidikJari extends StatefulWidget {
  SidikJari({Key? key}) : super(key: key);

  @override
  State<SidikJari> createState() => _SidikJariState();
}

class _SidikJariState extends State<SidikJari> {
  var height, width;
  bool _isNotifOn = true;


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
            padding: const EdgeInsets.only(top: 15, left: 30 , right: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/ic_fingerprint3.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Akses STIPRES dengan cara yang aman dan mudah \n menggunakan sidik jari',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(221, 139, 139, 139),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                      thickness: 1,
                      color: Colors.grey[300], // Atau sesuaikan dengan tema kamu
                      indent: 5,  // Margin kiri
                      endIndent: 5, // Margin kanan
                    ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Sidik Jari",
                  style: TextStyle(
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
                          setState(() {
                            _isNotifOn = !_isNotifOn;
                          });
                          print("Toggled: $_isNotifOn");
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/ic_fingerprint2.png', height: 30, width: 30),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color.fromARGB(255, 161, 161, 161),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Transform.scale(
                                    scale: 0.75,
                                    child: Switch(
                                      value: _isNotifOn,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          _isNotifOn = newValue;
                                        });
                                      },
                                      activeColor: Color.fromARGB(255, 30, 136, 228),
                                      activeTrackColor: Color.fromARGB(255, 189, 222, 251),
                                      inactiveThumbColor: Colors.grey,
                                      inactiveTrackColor: Color.fromARGB(255, 224, 224, 224),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
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
                  "Login dengan Sidik Jari",
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
}
