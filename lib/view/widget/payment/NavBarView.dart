// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';
import '../../screen/home.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({
    super.key,
  });

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 1;
  List screens = [
    // const ProfileScreen(),
    // const HomePayment(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          unselectedItemColor: AppColor.blue2,
          selectedItemColor: AppColor.orange,
          items: const [
            BottomNavigationBarItem(
              tooltip: 'الإعدادات',
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: '_____',
            ),
            BottomNavigationBarItem(
              tooltip: 'الرئيسية',
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: '_____',
            ),
            BottomNavigationBarItem(
              tooltip: 'الرئيسية',
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: '_____',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
