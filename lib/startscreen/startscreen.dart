import 'package:flutter/material.dart';

class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gambar di bagian atas
          Image.asset(
            'assets/img/gambar1.jpg', // Ganti dengan path gambar Anda
            height: 200, // Atur tinggi gambar sesuai kebutuhan
          ),
          SizedBox(height: 40), // Jarak antara gambar dan tombol

          // Tombol Login
          ElevatedButton(
            onPressed: () {
              // Aksi untuk tombol login
              print('Tombol Login ditekan');
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
          ),
          SizedBox(height: 20), // Jarak antara tombol Login dan Sign Up

          // Tombol Sign Up
          ElevatedButton(
            onPressed: () {
              // Aksi untuk tombol sign up
              print('Tombol Sign Up ditekan');
            },
            child: Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
          ),
        ],
      ),
    );
  }
}


