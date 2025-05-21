import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';

class EditPresensiDialog extends StatefulWidget {
  const EditPresensiDialog({super.key});

  @override
  State<EditPresensiDialog> createState() => _EditPresensiDialogState();
}

class _EditPresensiDialogState extends State<EditPresensiDialog> {
  TimeOfDay? jamAwal;
  TimeOfDay? jamAkhir;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        "Edit Presensi",
        style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: SizedBox(
        width: 300, // Ganti ini sesuai kebutuhan kamu
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTimePickerField(
              label: "Jam Awal",
              selectedTime: jamAwal,
              onTimePicked: (picked) => setState(() => jamAwal = picked),
            ),
            const SizedBox(height: 16),
            _buildTimePickerField(
              label: "Jam Akhir",
              selectedTime: jamAkhir,
              onTimePicked: (picked) => setState(() => jamAkhir = picked),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("CANCEL", style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, {
              'jamAwal': jamAwal,
              'jamAkhir': jamAkhir,
            });
          },
          child: const Text("SUBMIT",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildTimePickerField({
    required String label,
    required TimeOfDay? selectedTime,
    required ValueChanged<TimeOfDay> onTimePicked,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.plusJakartaSans(color: blueColor)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
            );
            if (picked != null) {
              onTimePicked(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTime?.format(context) ?? '',
                  style: GoogleFonts.plusJakartaSans(),
                ),
                const Icon(Icons.access_time, color: Colors.blue),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
