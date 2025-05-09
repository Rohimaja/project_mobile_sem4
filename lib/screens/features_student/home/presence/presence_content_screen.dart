import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/models/presenceContent_model.dart';
import 'package:stipres/screens/features_student/widgets/cards/presenceContent_card.dart';
import 'package:stipres/styles/constant.dart';

enum StatusPresensi { hadir, ijin, sakit }

class PresenceContentScreen extends StatefulWidget {
  const PresenceContentScreen({super.key});

  @override
  State<PresenceContentScreen> createState() => _PresenceContentScreenState();
}

class _PresenceContentScreenState extends State<PresenceContentScreen> {
  var height, width;
  StatusPresensi? _status;
  TextEditingController _alasanController = TextEditingController();
  int _jumlahKarakter = 0;
  final int _maksKarakter = 200;

  List<MatkulDetailModel> presenceList = [
    MatkulDetailModel(
      idMatkul: '123456',
      namaMatkul: 'Pemrograman Mobile',
      jamMatkul: '08:00 - 10:00',
    ),
  ]; // kosongkan untuk tes "no data"

  @override
  void initState() {
    super.initState();
    _alasanController.addListener(_hitungKarakter);
  }

  void _hitungKarakter() {
    final text = _alasanController.text;
    setState(() {
      _jumlahKarakter = text.length;
    });

    if (_jumlahKarakter > _maksKarakter) {
      _alasanController.text = text.substring(0, _maksKarakter);
      _alasanController.selection = TextSelection.fromPosition(
        TextPosition(offset: _maksKarakter),
      );
    }
  }

  @override
  void dispose() {
    _alasanController.removeListener(_hitungKarakter);
    _alasanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Stack(
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
                        image: AssetImage('images/bgheader.png'),
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
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: presenceList.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            Image.asset(
                              'icons/ic_noData.png',
                              width: 160,
                              height: 160,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Belum ada presensi",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Presensi Mata Kuliah',
                            style: TextStyle(
                              fontSize: 16,
                              color: blueColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          MatkulDetailCard(data: presenceList[0]),
                          const SizedBox(height: 15),

                          // Status Presensi
                          RadioListTile<StatusPresensi>(
                            title: const Text("Hadir"),
                            value: StatusPresensi.hadir,
                            groupValue: _status,
                            onChanged: (value) {
                              setState(() {
                                _status = value;
                              });
                            },
                            activeColor: blueColor,
                          ),
                          RadioListTile<StatusPresensi>(
                            title: const Text("Ijin"),
                            value: StatusPresensi.ijin,
                            groupValue: _status,
                            onChanged: (value) {
                              setState(() {
                                _status = value;
                              });
                            },
                            activeColor: blueColor,
                          ),
                          RadioListTile<StatusPresensi>(
                            title: const Text("Sakit"),
                            value: StatusPresensi.sakit,
                            groupValue: _status,
                            onChanged: (value) {
                              setState(() {
                                _status = value;
                              });
                            },
                            activeColor: blueColor,
                          ),

                          const SizedBox(height: 15),

                          // Alasan Field
                          RichText(
                            text: const TextSpan(
                              text: "Alasan ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              children: [
                                TextSpan(
                                  text: "(Jika Tidak Hadir)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                TextSpan(text: " :"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _alasanController,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                hintText: "*Alasan ketidakhadiran",
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.all(16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Maks. $_jumlahKarakter/$_maksKarakter huruf",
                            style: TextStyle(
                              fontSize: 12,
                              color: _jumlahKarakter > _maksKarakter
                                  ? Colors.red
                                  : Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: submit logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blueColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 6,
                                shadowColor: blueColor.withOpacity(0.4),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
