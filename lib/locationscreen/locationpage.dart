import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


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
      appBar: AppBar(
        title: Text('Geolocator Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: getLocation,
                child: Text('Get Location'),
              ),
            Text("Latitude : $latitude, Longtitude : $longitude"),
          ],
        ),
      ),
    );
  }
}
