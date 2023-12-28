import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/homeguest/widgets/location_card.dart';

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
        latitude = position.latitude;
        longitude = position.longitude;
      });

      // Show location in the LocationCard
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Location: $latitude, $longitude"),
        ),
      );

      // Navigate back to the home page
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
