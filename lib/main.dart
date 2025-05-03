import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/routes/app_screens.dart';
import 'package:stipres/screens/auth/login_screen.dart';
import 'package:stipres/screens/features_student/account/ketentuan_layanan.dart';
import 'package:stipres/screens/features_student/account/view_profile.dart';
import 'package:stipres/screens/features_student/home/base_screen.dart';
import 'package:stipres/screens/features_student/home/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // unknownRoute: GetPage(name: '/not-found', page: () => ),
      getPages: AppScreens.screens,
      home: BaseScreen(),

    );
  }
}
