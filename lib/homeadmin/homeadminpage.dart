// import 'package:travelapp/homeguest/widgets/reccomended_places.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/auth/auth_gate.dart';
import 'package:travelapp/formadd/formaddpage.dart';
import 'package:travelapp/homeadmin/Recommended_admin_places.dart';
import 'package:travelapp/homeguest/widgets/cusom_icon_button.dart';
import 'package:travelapp/homeguest/widgets/nearby_places.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey Admin", style: GoogleFonts.poppins(fontSize: 19)),
          ],
        ),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.only(left: 8.0, right: 12),
        //     child: CustomIconButton(
        //       icon: Icon(Ionicons.search),
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(14),
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Places Near You!",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const RecommendedAdminPlaces(),
                const SizedBox(height: 10),
                // const RecommendedAdminPlaces(),
                // const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Visited Places Near You",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const NearbyPlaces(),
                const SizedBox(height: 10),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthGate()),
              );
            },
            child: Text(
              'Log Out',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              backgroundColor: Color.fromRGBO(240, 240, 240, 1),
              foregroundColor: const Color.fromRGBO(255, 159, 90, 1),
              minimumSize: Size(320, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
