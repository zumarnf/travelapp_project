import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/homeguest/widgets/cusom_icon_button.dart';
import 'package:travelapp/homeguest/widgets/location_card.dart';
import 'package:travelapp/homeguest/widgets/nearby_places.dart';
import 'package:travelapp/homeguest/widgets/reccomended_places.dart';
import 'package:travelapp/homeguest/widgets/tourist_places.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
import 'package:travelapp/locationscreen/locationpage.dart';
import 'package:travelapp/navbar/custnavbar.dart';
import 'package:travelapp/profile/profilepage.dart';
// import 'animated_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  String nama = '';
  String alamat = '';
  String nomor = '';
  String aidi = '';
  @override
  void initState() {
    super.initState();
    getUserUID();
    getUserName();
  }

  void getUserUID() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    setState(() {
      aidi = uid;
    });
    print(aidi);
  }

  void getUserName() {
    final docRef = FirebaseFirestore.instance.collection('users').doc(aidi);

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          nama = data['name'];
          alamat = data['address'];
          nomor = data['phoneNumber'];
        });
        // print(data['name']);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on_outlined),
        onPressed: () {
          // Assuming locationpg is defined somewhere
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => locationpg()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildAnimatedBottomBar(_bottomNavIndex, (index) {
        setState(() {
          _bottomNavIndex = index;
        });

        // Handle navigation based on the selected index
        switch (index) {
          case 0:
            // Navigate to the home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1:
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
            break;
          // Add more cases for additional tabs if needed
        }
      }),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $nama",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              alamat,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: Icon(Ionicons.search),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          // LOCATION CARD
           LocationCard(),
          const SizedBox(
            height: 15,
          ),
          const TouristPlaces(),
          // CATEGORIES
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Places Near You!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(height: 10),

          const RecommendedPlaces(),
          const SizedBox(height: 15),
          const RecommendedPlaces(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Visited Places Near You",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(height: 10),
          const NearbyPlaces(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
