import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget buildAnimatedBottomBar() {
  // list of icons that required by animated navigation bar
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.person_2_outlined,
  ];

  // default index of the tabs
  int _bottomNavIndex = 0;

  return AnimatedBottomNavigationBar(
    // navigation bar
    icons: iconList,
    activeIndex: _bottomNavIndex,
    gapLocation: GapLocation.center,
    notchMargin: 8, // Default notch margin is 8
    notchSmoothness: NotchSmoothness.verySmoothEdge,
    onTap: (index) => _bottomNavIndex = index,
    backgroundColor: Color.fromRGBO(255, 159, 90, 1),
  );
}
