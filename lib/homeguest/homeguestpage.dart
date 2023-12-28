import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/homeguest/widgets/cusom_icon_button.dart';
import 'package:travelapp/homeguest/widgets/location_card.dart';
import 'package:travelapp/homeguest/widgets/nearby_places.dart';
import 'package:travelapp/homeguest/widgets/reccomended_places.dart';
import 'package:travelapp/homeguest/widgets/tourist_places.dart';
import 'package:travelapp/locationscreen/locationpage.dart';
import 'package:travelapp/navbar/custnavbar.dart';
// import 'package:travelapp/locationscreen/locationpage.dart';
// import 'package:travelapp/navbar/custnavbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_on_outlined),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => locationpg()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildAnimatedBottomBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hey User"),
            Text(
              "Wonokromo, Surabaya",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: const [
          // CustomIconButton(
          //   icon: Icon(Ionicons.search_outline),
          // ),
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
          const LocationCard(),
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
      // bottomNavigationBar: AnimatedBottomBar(),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Ionicons.home_outline),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Ionicons.bookmark_outline),
      //       label: "Bookmark",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Ionicons.ticket_outline),
      //       label: "Ticket",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Ionicons.person_outline),
      //       label: "Profile",
      //     )
      //   ],
      // ),
    );
  }
}
