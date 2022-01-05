import 'package:flutter/material.dart';

import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({Key? key}) : super(key: key);
  static const tripDetail = '/tripdetail';
  Widget buildSectionTitle(BuildContext c, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      alignment: Alignment.topRight,
      child: Text(
        title,
        style: Theme.of(c).textTheme.headline5,
      ),
    );
  }

  Widget buildListView(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(10.0),
      height: 200,
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = tripsData.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${selectedTrip.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300.0,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "الانشطة"),
            buildListView(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (BuildContext c, int index) {
                  return Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        selectedTrip.activities[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "برنامج اليومي"),
            buildListView(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (c, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(" يوم ${index + 1}"),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        title: Text(selectedTrip.program[index]),
                      ),
                      const Divider(
                        height: 10.0,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 200.0,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(tripId);
        },
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
    );
  }
}
