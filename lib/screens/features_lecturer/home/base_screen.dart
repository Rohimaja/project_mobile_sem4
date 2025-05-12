import 'package:flutter/material.dart';
import 'package:stipres/screens/features_lecturer/account/profile_screen.dart';
import 'package:stipres/screens/features_lecturer/home/dashboard.dart';
import 'package:stipres/styles/constant.dart';
import 'package:stipres/styles/icons.dart';
import 'package:stipres/styles/size.dart';

class BaseScreenLecturer extends StatefulWidget {
  const BaseScreenLecturer({Key? key}) : super(key: key);

  @override
  _BaseScreenLecturerState createState() => _BaseScreenLecturerState();
}

class _BaseScreenLecturerState extends State<BaseScreenLecturer> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreenLecturer(),
    ProfileScreenLecturer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
