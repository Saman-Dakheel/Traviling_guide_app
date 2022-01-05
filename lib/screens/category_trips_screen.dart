import 'package:flutter/material.dart';
import '../app_data.dart';
import '../models/trips.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const categoryTrips = '/category-trips';
  const CategoryTripsScreen({Key? key}) : super(key: key);
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrip;
  @override
  void initState() {
    //.... We did not use it becouse of the context
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title']!;
    displayTrip = tripsData.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeItem(String tripId) {
    setState(() {
      displayTrip.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (txt, index) {
            return TripItem(
              id: displayTrip[index].id,
              title: displayTrip[index].title,
              imageUrl: displayTrip[index].imageUrl,
              duration: displayTrip[index].duration,
              tripType: displayTrip[index].tripType,
              season: displayTrip[index].season,
              removeItem: _removeItem,
            );
          },
          itemCount: displayTrip.length,
        ));
  }
}
