import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/styles/constant.dart';

void showEditLinkDialog(
    BuildContext context, String currentLink, Function(String) onSubmit) {
  final TextEditingController linkController =
      TextEditingController(text: currentLink);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        "Edit Link Perkuliahan",
        style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Link', style: GoogleFonts.plusJakartaSans(color: blueColor)),
            const SizedBox(height: 8), // Jarak antara label dan TextField
            TextField(
              controller: linkController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blueColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blueColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('CANCEL', style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            onSubmit(linkController.text);
            Navigator.of(context).pop();
          },
          child: Text('SUBMIT',
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
