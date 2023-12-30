// animated_bottom_bar.dart

import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

Widget buildAnimatedBottomBar(int currentIndex, Function(int) onTap) {
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.person_outline,
  ];

  return AnimatedBottomNavigationBar(
    icons: iconList,
    activeIndex: currentIndex,
    gapLocation: GapLocation.center,
    notchMargin: 8,
    notchSmoothness: NotchSmoothness.verySmoothEdge,
    onTap: onTap,
    backgroundColor: const Color.fromRGBO(255, 159, 95, 1),
  );
}
