import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget buildListTile(IconData icon, String title, Function onTap) {
    return InkWell(
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'ElMessiri',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.amber,
            padding: const EdgeInsets.only(
              top: 40.0,
            ),
            alignment: Alignment.center,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buildListTile(
            Icons.card_travel,
            'الرحلات',
            () {
              Navigator.of(context)
                  .pushReplacementNamed(CategoryScreen.categoryScreen);
            },
          ),
          buildListTile(Icons.filter_list, 'الفلترة ', () {
            Navigator.of(context)
                .pushReplacementNamed(FiltersScreens.filtersScreen);
          })
        ],
      ),
    );
  }
}
