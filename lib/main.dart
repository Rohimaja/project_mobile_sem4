import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stipres/routes/app_screens.dart';
import 'package:stipres/screens/auth/login_screen.dart';
import 'package:stipres/screens/features_lecturer/home/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("id_ID", null);
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppScreens.screens,
      home: LoginScreen(),
    );
  }
}
