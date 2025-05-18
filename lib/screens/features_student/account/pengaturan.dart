import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/account/account_menu.dart';
import 'package:stipres/screens/features_student/account/bantuan.dart';
import 'package:stipres/screens/reusable/custom_header.dart';
import 'package:stipres/styles/constant.dart';

class Pengaturan extends StatefulWidget {
  Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  var height, width;
  bool _isNotifOn = true;

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
            CustomHeader(title: "Pengaturan"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 30, right: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan Aplikasi",
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
                            Get.to(Akun());
                          },
                          borderRadius: BorderRadius.circular(
                              10), // opsional, supaya ripple-nya lebih bagus
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal:
                                    4.0), // ⬅️ memperluas area klik secara vertikal
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/ic_key.png',
                                    height: 30, width: 30),
                                const SizedBox(width: 10),
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
                                        color:
                                            Color.fromARGB(255, 161, 161, 161),
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
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isNotifOn = !_isNotifOn;
                            });
                            print("Toggled: $_isNotifOn");
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 4.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/ic_notification.png',
                                    height: 30, width: 30),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
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
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left:
                                              100), // Ganti angkanya sesuai kebutuhan
                                      child: Transform.scale(
                                        scale: 0.75,
                                        child: Switch(
                                          value: _isNotifOn,
                                          onChanged: (bool newValue) {
                                            setState(() {
                                              _isNotifOn = newValue;
                                            });
                                          },
                                          activeColor:
                                              Color.fromARGB(255, 30, 136, 228),
                                          activeTrackColor: Color.fromARGB(
                                              255, 189, 222, 251),
                                          inactiveThumbColor: Colors.grey,
                                          inactiveTrackColor: Color.fromARGB(
                                              255, 224, 224, 224),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            String? selectedTheme =
                                "Default"; // bisa juga ambil dari state kalau mau

                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      title: Text(
                                        "Pilih Tema",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: blueColor,
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                              unselectedWidgetColor: blueColor,
                                              radioTheme: RadioThemeData(
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        blueColor),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                "Default",
                                                "Cerah",
                                                "Gelap"
                                              ].map((option) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      splashColor: blueColor
                                                          .withOpacity(0.2),
                                                      onTap: () {
                                                        setState(() {
                                                          selectedTheme =
                                                              option;
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8,
                                                                vertical: 6),
                                                        child: Row(
                                                          children: [
                                                            Radio<String>(
                                                              value: option,
                                                              groupValue:
                                                                  selectedTheme,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectedTheme =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Text(
                                                              option,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Batal",
                                            style: GoogleFonts.poppins(
                                                color: blueColor),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // TODO: Simpan tema
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                blueColor, // Warna latar biru
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 10),
                                          ),
                                          child: Text(
                                            "Simpan",
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.white, // Tulisan putih
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 4.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/ic_personalisasi.png',
                                    height: 30, width: 30),
                                const SizedBox(width: 10),
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
                                        color:
                                            Color.fromARGB(255, 161, 161, 161),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Get.to(Bantuan());
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 4.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/ic_help.png',
                                    height: 30, width: 30),
                                const SizedBox(width: 10),
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
                                        color:
                                            Color.fromARGB(255, 161, 161, 161),
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
}
