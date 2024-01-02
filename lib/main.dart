import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/auth/auth_gate.dart';
import 'package:travelapp/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:travelapp/homeguest/homeguestpage.dart';
// import 'package:travelapp/locationscreen/locationpage.dart';

import 'package:travelapp/startscreen/startscreen.dart';
import 'package:travelapp/profile/profilepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const AuthGate(),
    );
  }
}
