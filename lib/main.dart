import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/routes/app_screens.dart';
import 'package:stipres/screens/features_student/account/account_menu.dart';
import 'package:stipres/screens/features_student/account/ganti_email.dart';
import 'package:stipres/screens/features_teacher/account/view_profile.dart';
import 'package:stipres/screens/features_student/account/pengaturan.dart';
import 'package:stipres/screens/features_student/home/base_screen.dart';
import 'package:stipres/screens/features_student/account/alamat_email.dart';
import 'package:stipres/screens/features_teacher/home/base_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppScreens.screens,
      home: Pengaturan(),
    );
  }
}
