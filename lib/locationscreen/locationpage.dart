import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class locationpg extends StatefulWidget {
  @override
  _locationpgState createState() => _locationpgState();
}

class _locationpgState extends State<locationpg> {
  bool isLoading = false;
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  Future<void> getLocation() async {
    setState(() {
      isLoading = true;
    });

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        isLoading = false;
      });

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
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
              Icons
                  .location_on_outlined, // Anda dapat mengganti ikon dengan yang lain jika diinginkan
              size: 75, // Ukuran ikon
              color: const Color.fromARGB(255, 0, 0, 0), // Warna ikon
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 25),
              child: Text("PLEASE ALLOW LOCATION TO GET LOCATION",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 12)),
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
                    // Mengatur bentuk menjadi bulat
                    borderRadius: BorderRadius.circular(
                        27), // Anda dapat menyesuaikan nilai untuk membuatnya lebih bulat atau kurang bulat
                  ),
                ),
              ),
            SizedBox(height: 15),
            Column(
              children: [
                Text(
                  "YOUR LOCATION",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text("$latitude, $longitude",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
