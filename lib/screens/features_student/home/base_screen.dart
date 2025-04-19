import 'package:flutter/material.dart';
import 'package:stipres/screens/features_student/account/profile_screen.dart';
import 'package:stipres/screens/features_student/home/dashboard.dart';
import 'package:stipres/style/constant.dart';
import 'package:stipres/style/icons.dart';
import 'package:stipres/style/size.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    ProfilePage(),
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
