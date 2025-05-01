import 'package:get/get.dart';
import 'package:stipres/screens/auth/activation_account_screen_1.dart';
import 'package:stipres/screens/auth/activation_account_screen_2.dart';
import 'package:stipres/screens/auth/activation_account_screen_3.dart';
import 'package:stipres/screens/auth/forget_password_screen_1.dart';
import 'package:stipres/screens/auth/forget_password_screen_2.dart';
import 'package:stipres/screens/auth/forget_password_screen_3.dart';
import 'package:stipres/screens/auth/login_screen.dart';
import 'package:stipres/screens/features_student/home/base_screen.dart'
    as student;
import 'package:stipres/screens/features_lecturer/home/base_screen.dart'
    as lecturer;
import 'package:stipres/screens/features_student/home/calendar_screen.dart';
import 'package:stipres/screens/features_student/home/kehadiran_screen.dart';
import 'package:stipres/screens/features_student/home/lecture/lecture_content_screen.dart';
import 'package:stipres/screens/features_student/home/lecture/lecture_screen.dart';
import 'package:stipres/screens/features_student/home/notification_screen.dart';
import 'package:stipres/screens/features_student/home/offline_screen.dart';
import 'package:stipres/screens/features_student/home/presence/presence_content_screen.dart';
import 'package:stipres/screens/features_student/home/presence/presence_screen.dart';

class AppScreens {
  static final screens = [
    GetPage(name: "/", page: () => LoginScreen()),
    GetPage(name: "/auth/forget-password/step1", page: () => ForgetPassword1()),
    GetPage(name: "/auth/forget-password/step2", page: () => ForgetPassword2()),
    GetPage(name: "/auth/forget-password/step3", page: () => ForgetPassword3()),
    GetPage(name: "/auth/activation/step1", page: () => ActivationAccount1()),
    GetPage(name: "/auth/activation/step2", page: () => ActivationAccount2()),
    GetPage(name: "/auth/activation/step3", page: () => ActivationAccount3()),
    GetPage(name: "/lecturer/base-screen", page: () => lecturer.BaseScreen()),
    GetPage(name: "/student/base-screen", page: () => student.BaseScreen()),
    GetPage(name: "/student/kehadiran-screen", page: () => KehadiranPage()),
    GetPage(name: "/student/presence-screen", page: () => PresenceScreen()),
    GetPage(name: "/student/offline-screen", page: () => OfflineScreen()),
    GetPage(name: "/student/calendar-screen", page: () => CalendarScreen()),
    GetPage(name: "/student/lecture-screen", page: () => LectureScreen()),
    GetPage(
        name: "/student/notification-screen", page: () => NotificationScreen()),
    GetPage(
        name: "/student/presence-content-screen",
        page: () => PresenceContentScreen()),
    GetPage(
        name: "/student/lecture-content-screen",
        page: () => LectureContentScreen())
  ];
}
