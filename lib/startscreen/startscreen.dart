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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Gambar di bagian atas
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/gambar1.jpg', // Ganti dengan path gambar Anda
                height: 270, // Atur tinggi gambar sesuai kebutuhan
                width: MediaQuery.of(context)
                    .size
                    .width, // Lebar gambar sesuai lebar layar
                fit: BoxFit
                    .cover, // Ini akan membuat gambar menutupi ruang yang tersedia
              ),
              SizedBox(height: 15),
              Text(
                'Teks Anda di sini',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Membuat teks menjadi tebal
                  fontSize: 18, // Ukuran teks yang diinginkan
                ),
              ),
              Text(
                'Teks Anda di sini',
                style: TextStyle(
                  fontWeight: FontWeight.w200, // Membuat teks menjadi tebal
                  fontSize: 15, // Ukuran teks yang diinginkan
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
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              backgroundColor: Color(0xFFFF9F5A), // Warna latar belakang FF9F5A
              foregroundColor: Colors.white, // Warna teks putih (FFFFFF)
              minimumSize: Size(150, 50), // Ukuran minimum untuk tombol
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
              backgroundColor: Color(0xFFFF9F5A), // Warna latar belakang FF9F5A
              foregroundColor: Colors.white, // Warna teks putih (FFFFFF)
              minimumSize: Size(150, 50), // Ukuran minimum untuk tombol
            ),
          ),
        ],
      ),
    );
  }
}
