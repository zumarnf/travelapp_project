import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/homeguest/homeguestpage.dart';

class LoginGuest extends StatefulWidget {
  const LoginGuest({Key? key}) : super(key: key);

  @override
  _LoginGuestState createState() => _LoginGuestState();
}

class _LoginGuestState extends State<LoginGuest> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 80.0, right: 35, bottom: 40.0, left: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
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
                  )
                ],
              ),
              SizedBox(height: 100),
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(240, 240, 240, 1),
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'Enter your password',
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
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  // Implement your logic for password recovery here
                  print('Forgot password tapped!');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
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
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    // If login is successful, navigate to the home page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } catch (e) {
                    // Handle login errors, you can show a Snackbar or Dialog with the error message
                    print('Login failed: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed: $e'),
                        backgroundColor: Colors.red,
                      ),
                    );
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
                    borderRadius: BorderRadius.circular(27),
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
