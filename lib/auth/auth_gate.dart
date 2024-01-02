import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/homeadmin/homeadminpage.dart';
import 'package:travelapp/homeguest/homeguestpage.dart';
import 'package:travelapp/startscreen/startscreen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.email == "admin@admin.com") {
              return const HomeAdmin();
            } else {
              return const HomePage();
            }
          } else {
            return const Startscreen();
          }
        },
      ),
    );
  }
}
