import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:stipres/controllers/features_student/base_screen_controller.dart';
import 'package:stipres/screens/features_student/account/profile_screen.dart';
import 'package:stipres/screens/features_student/home/dashboard.dart';
import 'package:stipres/constants/styles.dart';
import 'package:stipres/styles/icons.dart';
import 'package:stipres/styles/size.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final BaseScreenController _controller = Get.find<BaseScreenController>();

  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreenStudent(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
            () => _widgetOptions.elementAt(_controller.selectedIndex.value)),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: blueColor,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icHomeClicked,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icHome,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icProfileClicked,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icProfile,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Akun",
            ),
          ],
          currentIndex: _controller.selectedIndex.value,
          onTap: (int index) {
            _controller.changeIndex(index);
          })),
    );
  }
}
