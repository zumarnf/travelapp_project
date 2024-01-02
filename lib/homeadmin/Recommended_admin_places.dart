import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/detailscreen/detailpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RecommendedAdminPlaces extends StatelessWidget {
  const RecommendedAdminPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getRecommendedPlacesData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> recommendedPlaces =
              snapshot.data as List<Map<String, dynamic>>;

          return SizedBox(
            height: 275, // Increased height
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(recommendedPlaces[index]['documentId']),
                  onDismissed: (direction) {
                    _deletePlace(context, recommendedPlaces[index]);
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ),
                  child: SizedBox(
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
                                    ['documentId'],
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
                                    style: const TextStyle(
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
                                    recommendedPlaces[index]['rating']
                                        .toString(),
                                    style: const TextStyle(
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
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
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

  Future<void> _deletePlace(
      BuildContext context, Map<String, dynamic> place) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text(
              'Are you sure you want to delete ${place['destinationName']}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel delete
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm delete
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      // Delete from Firestore
      try {
        await FirebaseFirestore.instance
            .collection('admin')
            .doc(place['documentId'])
            .delete();

        // Remove the deleted item from the list
        // Note: You may need to call setState to update the UI
        // or use a StatefulWidget for this to work properly
        // setState(() {
        //   recommendedPlaces.remove(place);
        // });
      } catch (error) {
        print('Error deleting place: $error');
      }
    }
  }

  Future<List<Map<String, dynamic>>> _getRecommendedPlacesData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('admin').get();

      List<Map<String, dynamic>> recommendedPlaces = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        recommendedPlaces.add({
          'documentId': documentSnapshot.id,
          'image': data['pictureUrl'],
          'destinationName': data['destinationName'],
          'location': data['location'],
          'rating': data['rating'],
        });
      }

      return recommendedPlaces;
    } catch (error) {
      print('Error getting recommended places data: $error');
      return [];
    }
  }
}
