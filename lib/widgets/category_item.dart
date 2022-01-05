import 'package:flutter/material.dart';
import 'package:travilling_app/screens/category_trips_screen.dart';

class CategroyItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  const CategroyItem(
      {Key? key, required this.id, required this.title, required this.imageurl})
      : super(key: key);
  void selectCategory(BuildContext c) {
    Navigator.of(c).pushNamed(
      CategoryTripsScreen.categoryTrips,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageurl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }
}
