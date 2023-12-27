import 'package:flutter/material.dart';
import 'package:travelapp/homeadmin/homeadminpage.dart';
import 'package:travelapp/homeguest/homeguestpage.dart';
import 'package:travelapp/locationscreen/locationpage.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: locationpg(),
    );
  }
}
