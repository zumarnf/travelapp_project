import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final double? latitude;
  final double? longitude;

  const LocationCard({Key? key, this.latitude, this.longitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/map.png',
              width: 100,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Location",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                const SizedBox(height: 5),
                Builder(
                  builder: (BuildContext context) {
                    if (latitude != null && longitude != null) {
                      return Text(
                        "$latitude, $longitude",
                        style: Theme.of(context).textTheme.subtitle1,
                      );
                    } else {
                      return Text(
                        "Location not available",
                        style: Theme.of(context).textTheme.subtitle1,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
