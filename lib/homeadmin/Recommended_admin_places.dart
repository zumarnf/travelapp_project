import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/detailscreen/detailpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendedAdminPlaces extends StatefulWidget {
  const RecommendedAdminPlaces({Key? key}) : super(key: key);

  @override
  _RecommendedAdminPlacesState createState() => _RecommendedAdminPlacesState();
}

class _RecommendedAdminPlacesState extends State<RecommendedAdminPlaces> {
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

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {}); // Reload the data
            },
            child: SizedBox(
              height: 275,
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
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  _showDeleteConfirmationDialog(
                                      context, recommendedPlaces[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const StadiumBorder(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  backgroundColor:
                                      Color.fromRGBO(240, 240, 240, 1),
                                  foregroundColor:
                                      const Color.fromRGBO(255, 159, 90, 1),
                                  minimumSize: Size(200, 40),
                                ),
                                child: const Text("Delete"),
                              ),
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
            ),
          );
        }
      },
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> place) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text(
              'Are you sure you want to delete ${place['destinationName']}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _deletePlace(context, place);
                Navigator.of(context).pop(); // Close the dialog
                setState(() {}); // Reload the data after deletion
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deletePlace(
      BuildContext context, Map<String, dynamic> place) async {
    // Delete from Firestore
    try {
      await FirebaseFirestore.instance
          .collection('admin')
          .doc(place['documentId'])
          .delete();
    } catch (error) {
      print('Error deleting place: $error');
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
