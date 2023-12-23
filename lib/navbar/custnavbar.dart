import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

// main app that calls the runApp.
void main() {
runApp(AnimatedBottomBar());
}

class AnimatedBottomBar extends StatefulWidget {
AnimatedBottomBar({Key? key}) : super(key: key);

@override
State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
// list of icons that required
// by animated navigation bar
List<IconData> iconList = [ 
	Icons.abc_sharp,
	Icons.access_time,
	Icons.holiday_village,
	Icons.account_tree_rounded
];

// default index of the tabs 
int _bottomNavIndex = 0; 
@override
Widget build(BuildContext context) {
	// material app with
	// debugshowcheckedmodebanner false
	return MaterialApp( 
	debugShowCheckedModeBanner: false,
	home: Scaffold( 
		body: Container(), 
		floatingActionButton: FloatingActionButton(
		
			child: Icon(Icons.home_max_outlined),
			onPressed: () {}),
		floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
		bottomNavigationBar: AnimatedBottomNavigationBar( // navigation bar
		icons: iconList,
		activeIndex: _bottomNavIndex,
		gapLocation: GapLocation.center,
		notchMargin: 8, // Default notch margin is 8
		notchSmoothness: NotchSmoothness.verySmoothEdge,
		onTap: (index) => setState(() => _bottomNavIndex = index),
		backgroundColor: Colors.blue,
		),
	),
	);
}
}
