import 'package:flutter/material.dart';

// import 'package:travelapp/homeguest/homeguestpage.dart';
// import 'package:travelapp/locationscreen/locationpage.dart';

import 'package:travelapp/startscreen/startscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(255, 159, 95, 1)),
        useMaterial3: true,
      ),
      home: Startscreen(),
    );
  }
}
