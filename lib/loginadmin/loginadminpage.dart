import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/homeadmin/homeadminpage.dart';

class loginadmin extends StatefulWidget {
  const loginadmin({super.key});

  @override
  State<loginadmin> createState() => _loginadminState();
}

class _loginadminState extends State<loginadmin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.only(top: 80.0, right: 35, bottom: 40.0, left: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Teks Bold di tengah
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back), // Ikon untuk tombol back
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Kembali ke halaman sebelumnya
                    },
                  ),
                  Spacer(), // Spacer ini akan menempatkan 'TRAVEL' di tengah
                  Text(
                    'TRAVEL',
                    style: GoogleFonts.wendyOne(
                      fontSize: 41.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 25,
                  ) // Ini hanya untuk memastikan tombol back tetap di sisi kiri
                ],
              ),
              SizedBox(height: 100), // Jarak antara teks bold dan teks biasa

              // Teks biasa di kiri/start
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login into your account',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(240, 240, 240, 1),
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 159, 90, 1),
                      width: 2.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true, // Mengisi latar belakang dengan warna
                  fillColor:
                      Color.fromRGBO(240, 240, 240, 1), // Warna latar belakang
                  prefixIcon: Icon(Icons.lock_outline), // Ikon di sebelah kiri
                  labelText: 'Enter your password', // Label untuk TextField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Menambahkan border radius
                    borderSide: BorderSide(
                      // Opsi untuk sisi border
                      color: Color.fromRGBO(240, 240, 240, 1), // Warna border
                      width: 1.0, // Lebar border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Opsi untuk border ketika aktif
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Opsi untuk border ketika fokus
                    borderRadius: BorderRadius.circular(27.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(
                          255, 159, 90, 1), // Warna border ketika fokus
                      width: 2.0, // Lebar border ketika fokus
                    ),
                  ),
                ),
                keyboardType:
                    TextInputType.visiblePassword, // Tipe keyboard untuk email
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  // Aksi yang ingin Anda lakukan saat teks ditekan
                  print('Forgot password tapped!');
                  // Anda dapat menambahkan logika untuk navigasi atau tindakan lainnya di sini.
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets
                      .zero, // Mengatur padding menjadi nol untuk memastikan tidak ada ruang tambahan
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot your password?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  print('Entered Email before trim: ${_emailController.text}');
                  print(
                      'Entered Password before trim: ${_passwordController.text}');
                  try {
                    UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                    print('Entered Email: ${_emailController.text.trim()}');

                    if (userCredential.user != null) {
                      // Periksa apakah email pengguna yang masuk cocok dengan email admin
                      if (userCredential.user!.email == 'admin@admin.com') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeAdmin()),
                        );
                      } else {
                        print('Akses ditolak. Pengguna bukan admin.');
                        // Tampilkan pesan kesalahan atau lakukan tindakan lain untuk pengguna bukan admin
                      }
                    }
                  } on FirebaseAuthException catch (e) {
                    print('Kesalahan Otentikasi Firebase: ${e.message}');
                    // Handle kesalahan otentikasi lainnya di sini
                    print('Entered Email: ${_emailController.text.trim()}');
                    print(
                        'Entered Password: ${_passwordController.text.trim()}');
                  }
                },
                child: Text(
                  'Login',
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
