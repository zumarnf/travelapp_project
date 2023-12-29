import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travelapp/auth/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.only(top: 80.0, right: 35, bottom: 40.0, left: 35),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      width: 15,
                    ) // Ini hanya untuk memastikan tombol back tetap di sisi kiri
                  ],
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                SizedBox(height: 5),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true, // Mengisi latar belakang dengan warna
                    fillColor: Color.fromRGBO(
                        240, 240, 240, 1), // Warna latar belakang
                    prefixIcon:
                        Icon(Icons.email_outlined), // Ikon di sebelah kiri
                    labelText: 'Enter your email', // Label untuk TextField
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
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
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
                SizedBox(height: 5),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true, // Mengisi latar belakang dengan warna
                    fillColor: Color.fromRGBO(
                        240, 240, 240, 1), // Warna latar belakang
                    prefixIcon:
                        Icon(Icons.lock_outline), // Ikon di sebelah kiri
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
                  // ... (Konfigurasi lainnya tetap sama)
                  keyboardType: TextInputType
                      .visiblePassword, // Tipe keyboard untuk email
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true, // Mengisi latar belakang dengan warna
                    fillColor: Color.fromRGBO(
                        240, 240, 240, 1), // Warna latar belakang
                    prefixIcon:
                        Icon(Icons.person_2_outlined), // Ikon di sebelah kiri
                    labelText: 'Enter your name', // Label untuk TextField
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
                  // ... (Konfigurasi lainnya tetap sama)

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    filled: true, // Mengisi latar belakang dengan warna
                    fillColor: Color.fromRGBO(
                        240, 240, 240, 1), // Warna latar belakang
                    prefixIcon:
                        Icon(Icons.map_outlined), // Ikon di sebelah kiri
                    labelText: 'Enter your Address', // Label untuk TextField
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
                  // ... (Konfigurasi lainnya tetap sama)

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    filled: true, // Mengisi latar belakang dengan warna
                    fillColor: Color.fromRGBO(
                        240, 240, 240, 1), // Warna latar belakang
                    prefixIcon: Icon(
                        Icons.phone_iphone_outlined), // Ikon di sebelah kiri
                    labelText:
                        'Enter your phone number', // Label untuk TextField
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
                  keyboardType: TextInputType
                      .number, // Mengatur tipe keyboard untuk hanya angka
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () async {
                    // Pemeriksaan apakah semua bidang telah diisi
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        phoneNumberController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('All fields must be filled!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return; // Hentikan eksekusi lebih lanjut jika salah satu bidang kosong
                    }

                    // Coba mendaftarkan pengguna
                    final message = await AuthService().register(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      address: addressController.text,
                      phone: phoneNumberController.text,
                    );

                    if (message == 'Registration Success') {
                      // Jika pendaftaran berhasil, kembali ke halaman login
                      Navigator.of(context).pop();
                    } else {
                      // Jika pendaftaran gagal, tampilkan pesan kesalahan
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message ?? 'An error occurred'),
                        ),
                      );
                    }
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
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
