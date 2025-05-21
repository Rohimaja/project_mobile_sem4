import 'package:flutter/material.dart';
import 'package:stipres/screens/reusable/custom_header.dart';
import 'package:stipres/constants/styles.dart';

class OfflineScreen extends StatelessWidget {
  OfflineScreen({super.key});

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomHeader(title: "Presensi Mata Kuliah"),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // agar tidak memaksa full height
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/ic_offlinepresence.png',
                    height: 120,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Silahkan lakukan presensi secara offline',
                    style: TextStyle(
                      color: greyColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
