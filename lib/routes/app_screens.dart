import 'package:get/get.dart';
import 'package:stipres/screens/auth/activation_account_screen_1.dart';
import 'package:stipres/screens/auth/activation_account_screen_2.dart';
import 'package:stipres/screens/auth/activation_account_screen_3.dart';
import 'package:stipres/screens/auth/forget_password_screen_1.dart';
import 'package:stipres/screens/auth/forget_password_screen_2.dart';
import 'package:stipres/screens/auth/forget_password_screen_3.dart';
import 'package:stipres/screens/auth/login_screen.dart';
import 'package:stipres/screens/features_student/home/base_screen.dart' as student;
import 'package:stipres/screens/features_lecturer/home/base_screen.dart' as lecturer;

class AppScreens {
  static final screens = [
    GetPage(name: "/", page: () => LoginScreen()),
    GetPage(name: "/student/base-screen", page: () => student.BaseScreen()),
    GetPage(name: "/lecturer/base-screen", page: () => lecturer.BaseScreen()),
    GetPage(name: "/auth/forget-password/step1", page: () => ForgetPassword1()),
    GetPage(name: "/auth/forget-password/step2", page: () => ForgetPassword2()),
    GetPage(name: "/auth/forget-password/step3", page: () => ForgetPassword3()),
    GetPage(name: "/auth/activation/step1", page: () => ActivationAccount1()),
    GetPage(name: "/auth/activation/step2", page: () => ActivationAccount2()),
    GetPage(name: "/auth/activation/step3", page: () => ActivationAccount3()),
  ];
}
