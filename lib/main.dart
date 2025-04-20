import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/routes/app_screens.dart';
import 'package:stipres/screens/auth/login_screen.dart';

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
      home: LoginScreen(),
    );
  }
}
