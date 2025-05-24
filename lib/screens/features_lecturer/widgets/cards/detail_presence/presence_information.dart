import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/constants/styles.dart';
import 'package:stipres/controllers/features_lecturer/home/presences/presence_detail_controller.dart';

class PresenceInformationCard extends StatelessWidget {
  final String? waktuPresensi;
  final String? keterangan;
  final String? alasan;
  final String? buktiFilePath;

  PresenceInformationCard({
    super.key,
    required this.waktuPresensi,
    required this.keterangan,
    required this.alasan,
    this.buktiFilePath,
  });

  final _controller = Get.find<PresenceDetailController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Background image
              Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/bgBiodataMahasiswa.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),

              const Positioned(
                top: 16,
                child: Text(
                  "Detail Presensi Mahasiswa",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),

              Positioned(
                top: 60,
                left: 20,
                right: 20,
                bottom: 20, // Tambahkan batas bawah agar konten tidak terpotong
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRowInfo('Waktu Presensi', waktuPresensi ?? '-'),
                        const SizedBox(height: 12),
                        _buildRowInfo('Keterangan', keterangan ?? '-'),
                        const SizedBox(height: 12),
                        _buildRowInfo('Alasan', alasan ?? '-'),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                'Bukti',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF005095),
                                ),
                              ),
                            ),
                            Text(
                              ":",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF005095),
                              ),
                            ),
                            SizedBox(width: 8),

                            buktiFilePath != null && buktiFilePath!.isNotEmpty
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Obx(() {
                                          return InkWell(
                                            onTap: (!_controller
                                                    .isButtonEnabled.value)
                                                ? null
                                                : () {
                                                    _controller.openBukti(
                                                        buktiFilePath!);
                                                  },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                color: blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/ic_document.png',
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    "Lihat Bukti",
                                                    style: TextStyle(
                                                      color: whiteColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                                  )
                                : Text(
                                    "-",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xFF005095),
                                    ),
                                  ), // jika tidak ada file
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowInfo(String label, String value,
      {bool isScrollable = false}) {
    Widget valueWidget = Text(
      value,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF005095),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF005095),
            ),
          ),
        ),
        const Text(": "),
        Expanded(
          child: isScrollable
              ? SizedBox(
                  height: 100, // Atur tinggi maksimal
                  child: SingleChildScrollView(
                    child: valueWidget,
                  ),
                )
              : valueWidget,
        ),
      ],
    );
  }
}
