import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class TouristDetailsPage extends StatefulWidget {
  const TouristDetailsPage({
    Key? key,
    required this.image,
    required this.documentId, // Add the documentId parameter
  }) : super(key: key);

  final String image;
  final String documentId; // Add the documentId field

  @override
  _TouristDetailsPageState createState() => _TouristDetailsPageState();
}

class _TouristDetailsPageState extends State<TouristDetailsPage> {
  Map<String, dynamic>? destinationData; // Initialize with an empty map
  List<String> imageList = [
    'assets/img/place1.jpg',
    'assets/img/place2.jpg',
    'assets/img/place3.jpg',
    'assets/img/place4.jpg',
    'assets/img/place5.jpg',
    'assets/img/place6.jpg',
    'assets/img/place7.jpg',
    // Add more image paths as needed
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      if (widget.documentId.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection('admin')
                .doc(widget.documentId)
                .get();

        if (snapshot.exists) {
          print('Document ID: ${snapshot.id}'); // Print the document ID
          print(
              'Document data: ${snapshot.data()}'); // Print the entire document data

          setState(() {
            destinationData = snapshot.data();
          });
        } else {
          print('Document does not exist');
        }
      } else {
        print('Invalid document ID');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: size.height * .56,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      // Replace the AssetImage with NetworkImage
                      image: destinationData != null
                          ? DecorationImage(
                              image: NetworkImage(
                                  destinationData?['pictureUrl'] ?? ''),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) {
                                print('Error loading image: $exception');
                              },
                            )
                          : const DecorationImage(
                              image: AssetImage('assets/img/gambar1.jpg'),
                              fit: BoxFit.cover,
                            ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 20,
                            icon: const Icon(Ionicons.chevron_back),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(Ionicons.heart_outline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Place name
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                destinationData?['destinationName'] ??
                    'Loading...', // Handle null case
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 25),
            // Location, Rating, and Distance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDetailColumn(
                    destinationData?['location'] ?? '', Icons.location_on),
                _buildDetailColumn(
                    destinationData?['rating']?.toString() ?? '', Icons.star),
                // Add more details if needed
                _buildDetailColumn("40 Km", Icons.directions),
              ],
            ),

            const SizedBox(height: 15),
            // Small image previews in a horizontal ListView
            Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: 100,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(imageList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            // Short description
            Text(
              destinationData?['description'] ??
                  'Loading...', // Handle null case
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            // "Go" button
            ElevatedButton(
              onPressed: () {
                // Replace the coordinates with the desired latitude and longitude
                launchMap(37.7749, -122.4194);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                foregroundColor: const Color.fromRGBO(255, 159, 90, 1),
                minimumSize: Size(320, 50),
              ),
              child: const Text("Go"),
            ),
          ],
        ),
      ),
    );
  }

  void launchMap(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/place/Pantai+Malang/@-7.8612585,109.9303267,17z/data=!3m1!4b1!4m6!3m5!1s0x2e7add4079dbbe3d:0x2127e9cf9f3c323e!8m2!3d-7.8612585!4d109.932907!16s%2Fg%2F11j_7lwys1?entry=ttu';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where the user cannot launch the map.
      print('Could not launch $url');
    }
  }

// Helper method to build columns for location, rating, and distance details
  Widget _buildDetailColumn(String label, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
