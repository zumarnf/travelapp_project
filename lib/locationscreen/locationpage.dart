import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/homeguest/widgets/location_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication

class locationpg extends StatefulWidget {
  @override
  _locationpgState createState() => _locationpgState();
}

class _locationpgState extends State<locationpg> {
  bool isLoading = false;
  double? latitude;
  double? longitude;
  String aidi = '';

  @override
  void initState() {
    super.initState();
    getUserUID();
    _determinePermission();
  }

  void getUserUID() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      setState(() {
        aidi = user.uid;
      });
      print(
          "UID pengguna: $aidi"); // Cetak UID untuk memastikan Anda mendapatkannya
    } else {
      print("User belum masuk"); // Cetak jika user belum masuk
    }
  }

  Future<Position> _determinePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.requestPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     // Permissions are denied, next time you could try
    //     // requesting permissions again (this is also where
    //     // Android's shouldShowRequestPermissionRationale
    //     // returned true. According to Android guidelines
    //     // your App should show an explanatory UI now.
    //     return Future.error('Location permissions are denied');
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> saveLocationToFirestore(
      double latitude, double longitude) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference users = firestore.collection('users');

      // Menambahkan field 'uid' ke dokumen yang ada atau membuat dokumen baru jika belum ada
      await users.doc(aidi).set(
          {
            'latitude': latitude,
            'longitude': longitude,
          },
          SetOptions(
              merge:
                  true)); // Gunakan SetOptions untuk menggabungkan data dengan dokumen yang sudah ada

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Lokasi berhasil disimpan!"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Terjadi kesalahan saat menyimpan lokasi: $e"),
        ),
      );
    }
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    setState(() {
      isLoading = true;
    });

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
          print("Requesting permission");
      permission = await Geolocator.requestPermission();
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        setState(() {
          isLoading = false;
          latitude = position.latitude;
          longitude = position.longitude;
        });

        print(
            "Menyimpan lokasi dengan UID: $aidi"); // Cetak UID sebelum menyimpan lokasi
        await saveLocationToFirestore(position.latitude, position.longitude);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Location: $latitude, $longitude"),
          ),
        );

        Navigator.pop(context);
      } catch (e) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 75,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 25),
              child: Text(
                "PLEASE ALLOW LOCATION TO GET LOCATION",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
            if (isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: getLocation,
                child: Text('Get Location'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  backgroundColor: Color(0xFFFF9F5A),
                  foregroundColor: Colors.white,
                  minimumSize: Size(261, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
              ),
            SizedBox(height: 15),
            LocationCard(
              latitude: latitude,
              longitude: longitude,
            ),
          ],
        ),
      ),
    );
  }
}
