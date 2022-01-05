import 'package:flutter/material.dart';
import 'package:travilling_app/widgets/app_drawer.dart';

class FiltersScreens extends StatefulWidget {
  const FiltersScreens({Key? key}) : super(key: key);
  static const filtersScreen = '/filtersScreens';

  @override
  State<FiltersScreens> createState() => _FiltersScreensState();
}

class _FiltersScreensState extends State<FiltersScreens> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;
  Widget buildSwitchedListTile(String title, String subtitle, var currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الفلترة'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                buildSwitchedListTile(
                  'رحلات الصيفية',
                  'اظهار رحلات الصيفية فقط.',
                  _isInSummer,
                  (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  },
                ),
                buildSwitchedListTile(
                  'رحلات الشتوية ',
                  'اظهار رحلات الشتوية فقط.',
                  _isInWinter,
                  (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  },
                ),
                buildSwitchedListTile(
                  'للعائلات',
                  'اظهار رحلات للعائلات فقط.',
                  _isForFamily,
                  (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
