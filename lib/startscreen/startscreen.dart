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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10, right: 7, left: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Gambar di bagian atas
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/img/gambar1.jpg',
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Discover the ideal destination for your next vacation.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '“Welcome to the journey  of a lifetime! Let’s get started on your adventure. Set your preferences, discover new places, and create memories that last a lifetime. Ready to explore?”',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk tombol login
                  print('Tombol Login ditekan');
                },
                child: Text('Login', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  backgroundColor: Color(0xFFFF9F5A),
                  foregroundColor: Colors.white,
                  minimumSize: Size(300, 40),
                ),
              ),
              SizedBox(height: 20),

              // Tombol Sign Up
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk tombol sign up
                  print('Tombol Sign Up ditekan');
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  backgroundColor: Color(0xFFFF9F5A),
                  foregroundColor: Colors.white,
                  minimumSize: Size(300, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
