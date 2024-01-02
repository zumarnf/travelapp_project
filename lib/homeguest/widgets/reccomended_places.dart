import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/detailscreen/detailpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          _getRecommendedPlacesData(), // Function to get data from Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> recommendedPlaces =
              snapshot.data as List<Map<String, dynamic>>;

          return SizedBox(
            height: 235,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 220,
                  child: Card(
                    elevation: 0.4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TouristDetailsPage(
                              image: recommendedPlaces[index]['image'],
                              documentId: recommendedPlaces[index]
                                  ['documentId'], // Use the document ID
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              // child: Text("Tes"),
                              child: Image.network(
                                recommendedPlaces[index]['image'],
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  recommendedPlaces[index]['destinationName'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                Text(
                                  recommendedPlaces[index]['rating'].toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Ionicons.location,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  recommendedPlaces[index]['location'],
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              itemCount: recommendedPlaces.length,
            ),
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> _getRecommendedPlacesData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('admin').get();

      List<Map<String, dynamic>> recommendedPlaces = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // You may need to add more fields based on your Firestore structure
        recommendedPlaces.add({
          'documentId': documentSnapshot.id, // Add document ID to the map
          'image': data['pictureUrl'],
          'destinationName': data['destinationName'],
          'location': data['location'],
          'rating': data['rating'],
          'description': data['description'],
        });
      }

      return recommendedPlaces;
    } catch (error) {
      print('Error getting recommended places data: $error');
      return [];
    }
  }
}
