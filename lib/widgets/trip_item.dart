import 'package:flutter/material.dart';
import 'package:travilling_app/models/trips.dart';
import 'package:travilling_app/screens/trip_deteal_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final Function removeItem;
  const TripItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.removeItem,
  }) : super(key: key);

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return "شتاء";
      case Season.Spring:
        return "ربيع";
      case Season.Summer:
        return "صيف";
      case Season.Autumn:
        return "خريف";
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return "استكشاف";
      case TripType.Recovery:
        return "نقاهة";
      case TripType.Activities:
        return "انشطة";
      case TripType.Therapy:
        return "معاجة";
    }
  }

  void selectTrip(BuildContext c) {
    Navigator.of(c)
        .pushNamed(
      TripDetailScreen.tripDetail,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectTrip(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 7.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 250,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text("$duration أيام")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        seasonText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        tripTypeText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
