import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        27), // Mengatur sudut menjadi bulat
                    child: Image.asset(
                      'assets/img/gambar1.jpg',
                      height: 413,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Discover the ideal destination for your next vacation.',
                      style: GoogleFonts.poppins(
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
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk tombol login
                  print('Tombol Login ditekan');
                },
                child: Text('Login', style: GoogleFonts.poppins(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  backgroundColor: Color(0xFFFF9F5A),
                  foregroundColor: Colors.white,
                  minimumSize: Size(320, 40),
                  shape: RoundedRectangleBorder(
                    // Mengatur bentuk menjadi bulat
                    borderRadius: BorderRadius.circular(
                        27), // Anda dapat menyesuaikan nilai untuk membuatnya lebih bulat atau kurang bulat
                  ),
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
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  backgroundColor: Color(0xFFFF9F5A),
                  foregroundColor: Colors.white,
                  minimumSize: Size(320, 50),
                  shape: RoundedRectangleBorder(
                    // Mengatur bentuk menjadi bulat
                    borderRadius: BorderRadius.circular(
                        27), // Anda dapat menyesuaikan nilai untuk membuatnya lebih bulat atau kurang bulat
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
