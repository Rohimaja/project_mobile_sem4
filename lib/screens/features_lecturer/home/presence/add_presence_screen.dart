import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/reusable/custom_header.dart';
import 'package:stipres/constants/styles.dart';

class AddPresenceScreen extends StatefulWidget {
  const AddPresenceScreen({super.key});

  @override
  State<AddPresenceScreen> createState() => _AddPresenceScreenState();
}

class _AddPresenceScreenState extends State<AddPresenceScreen> {
  String? selectedProdi;
  String? selectedSemester;
  String? selectedMatkul;
  String? idMatkul;
  DateTime? selectedDate;
  TimeOfDay? jamAwal;
  TimeOfDay? jamAkhir;
  final TextEditingController linkZoomController = TextEditingController();

  void _submitPresence() {
    // Validasi sederhana
    if (selectedProdi == null ||
        selectedSemester == null ||
        selectedMatkul == null ||
        idMatkul == null ||
        selectedDate == null ||
        jamAwal == null ||
        jamAkhir == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mohon lengkapi semua data wajib.")),
      );
      return;
    }

    // Kirim data...
    debugPrint("Data dikirim:");
    debugPrint("Prodi: $selectedProdi");
    debugPrint("Semester: $selectedSemester");
    debugPrint("Matkul: $selectedMatkul - $idMatkul");
    debugPrint("Tanggal: $selectedDate");
    debugPrint(
        "Jam: ${jamAwal?.format(context)} - ${jamAkhir?.format(context)}");
    debugPrint("Link Zoom: ${linkZoomController.text}");
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(hint),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 79, 176, 255)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // tambahkan ini
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 0, 80, 145), width: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 79, 176, 255)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // tambahkan ini
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 0, 80, 145), width: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField2({
    required String label,
    required String hint,
    required ValueChanged<String> onChanged,
    bool enabled = true, // Defaultkan ke true
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          onChanged: enabled
              ? onChanged
              : null, // Hanya mengaktifkan onChanged jika enabled
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 79, 176, 255)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), // tambahkan ini
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 0, 80, 145), width: 1),
            ),
          ),
          readOnly: !enabled, // Menetapkan readOnly saat non-enabled
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tanggal Presensi',
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (picked != null) setState(() => selectedDate = picked);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : 'Pilih tanggal',
                  style: GoogleFonts.plusJakartaSans(fontSize: 16),
                ),
                const Icon(Icons.calendar_today, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePickers(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildTimePicker(
            label: 'Jam Awal',
            time: jamAwal,
            onTap: () async {
              final picked = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              if (picked != null) setState(() => jamAwal = picked);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 20),
          child: Icon(Icons.swap_horiz, size: 20, color: Colors.blue),
        ),
        Expanded(
          child: _buildTimePicker(
            label: 'Jam Akhir',
            time: jamAkhir,
            onTap: () async {
              final picked = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              if (picked != null) setState(() => jamAkhir = picked);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker({
    required String label,
    required TimeOfDay? time,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time != null ? time.format(context) : 'Pilih waktu',
                  style: GoogleFonts.plusJakartaSans(fontSize: 16),
                ),
                const Icon(Icons.access_time, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(title: 'Presensi Mata Kuliah'),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Presensi",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: blueColor),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Mohon isi data dibawah ini",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Divider(
                      color: Color(0xFFDADADA),
                      thickness: 1,
                      height: 20,
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dropdown Program Studi
                            _buildDropdownField(
                              label: "Program Studi",
                              value: selectedProdi,
                              hint: "Silahkan pilih program studi",
                              items: [
                                'Teknik Informatika',
                                'Sistem Informasi',
                                'Teknik Komputer'
                              ],
                              onChanged: (val) =>
                                  setState(() => selectedProdi = val),
                            ),
                            const SizedBox(height: 12),

                            // Dropdown Semester
                            _buildDropdownField(
                              label: "Semester",
                              value: selectedSemester,
                              hint: "Silahkan pilih semester",
                              items: ['1', '2', '3', '4', '5', '6'],
                              onChanged: (val) =>
                                  setState(() => selectedSemester = val),
                            ),
                            const SizedBox(height: 12),

                            // Nama Matkul dan ID Matkul
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _buildDropdownField(
                                    label: "Nama Matkul",
                                    value: selectedMatkul,
                                    hint: "Pilih matkul",
                                    items: [
                                      'Matematika',
                                      'Pemrograman',
                                      'Jaringan'
                                    ],
                                    onChanged: (val) =>
                                        setState(() => selectedMatkul = val),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 20),
                                  child: Icon(Icons.arrow_forward_ios,
                                      size: 20, color: Colors.blue),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: _buildTextField2(
                                    label: "ID Matkul",
                                    hint: "ID Matkul",
                                    onChanged: (val) =>
                                        setState(() => idMatkul = val),
                                    enabled: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Tanggal Presensi
                            _buildDatePicker(context),
                            const SizedBox(height: 12),

                            // Jam Awal & Akhir
                            _buildTimePickers(context),
                            const SizedBox(height: 12),

                            // Link Zoom
                            _buildTextField(
                              label: "Link Zoom",
                              hint: "Masukkan link zoom (Opsional)",
                              controller: linkZoomController,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _submitPresence,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                ),
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
