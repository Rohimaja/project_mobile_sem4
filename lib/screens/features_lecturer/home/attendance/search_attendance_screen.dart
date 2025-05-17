import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/constants/styles.dart';

class CariDataScreen extends StatefulWidget {
  final void Function(String semester, String prodi) onSearch;

  const CariDataScreen({super.key, required this.onSearch});

  @override
  State<CariDataScreen> createState() => _CariDataScreenState();
}

class _CariDataScreenState extends State<CariDataScreen> {
  String? selectedSemester;
  String? selectedProdi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cari Data Kehadiran Mahasiswa',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/ic_document.png', height: 24),
                  const SizedBox(width: 10),
                  Text(
                    'Mohon isi data dibawah ini',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Semester',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedSemester,
              hint: const Text("Silahkan pilih semester"),
              items: ['1', '2', '3', '4', '5', '6', '7', '8']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (value) => setState(() => selectedSemester = value),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Program Studi',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedProdi,
              hint: const Text("Silahkan pilih program studi"),
              items: [
                'Teknik Informatika',
                'Sistem Informasi',
                'Teknik Komputer',
                'Teknik Elektro',
                'Teknik Mesin'
              ].map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (value) => setState(() => selectedProdi = value),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (selectedSemester != null && selectedProdi != null) {
                    widget.onSearch(selectedSemester!, selectedProdi!);
                    Navigator.pop(context);
                  }
                },
                child: Text('Cari',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
