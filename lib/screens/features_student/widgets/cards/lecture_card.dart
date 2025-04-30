import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stipres/screens/features_student/models/lecture_model.dart';
import 'package:stipres/screens/features_student/widgets/chips/lecture_chip.dart';

class PerkuliahanCard extends StatelessWidget {
  final PerkuliahanModel data;

  const PerkuliahanCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFC0EFC9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFC8C8C8),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            // SEMESTER COLUMN
            Container(
              width: 80,
              height: 170, // fix height supaya sejajar
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 59, 136, 62),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Semester',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    data.semester.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // MAIN CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mata Kuliah
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      // Background merah (menyesuaikan tinggi ikon)
                      Container(
                        margin: const EdgeInsets.only(
                            left: 28), // supaya gak nabrak ikon
                        height: 36, // sama dengan tinggi ikon
                        padding: const EdgeInsets.only(left: 16, right: 12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          data.matkul,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Ikon di atas background
                      Positioned(
                        // sedikit ke atas biar seimbang
                        child: Image.asset(
                          "icons/ic_book2.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  PerkuliahanChip(
                    iconPath: "icons/ic_calendar2.png",
                    text: data.tanggal,
                  ),
                  const SizedBox(height: 8),
                  PerkuliahanChip(
                    iconPath: "icons/ic_lecturer.png",
                    text: data.dosen,
                  ),
                  const SizedBox(height: 8),
                  PerkuliahanChip(
                    iconPath: "icons/ic_clock.png",
                    text: data.jam,
                  ),
                  const SizedBox(height: 8),

                  // Zoom Link
                  if (data.linkZoom != null && data.linkZoom!.isNotEmpty)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("icons/ic_link.png", width: 20),
                        const SizedBox(width: 6),
                        Expanded(
                          child: TextField(
                            controller:
                                TextEditingController(text: data.linkZoom),
                            readOnly: true,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        // Ripple animation button
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(text: data.linkZoom ?? ''),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link Zoom berhasil disalin!"),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              child: Row(
                                children: [
                                  Image.asset("icons/ic_copy.png", width: 20),
                                  const SizedBox(width: 4),
                                  const Text("Salin",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
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
