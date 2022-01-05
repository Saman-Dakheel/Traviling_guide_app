import 'package:flutter/material.dart';
import 'package:travilling_app/screens/category_screen.dart';
import 'package:travilling_app/screens/favorite_screen.dart';
import 'package:travilling_app/screens/filters_screen.dart';
import 'package:travilling_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  int selectPageIndex = 0;
  final List<Map<String, Object>> _screens = const [
    {
      'screen': CategoryScreen(),
      'title': 'تصنيف الرحلات ',
    },
    {
      'screen': FavoriteScreen(),
      'title': 'رحلات المفضلة',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _screens[selectPageIndex]['title'].toString(),
        ),
      ),
      body: _screens[selectPageIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "تصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة",
          ),
        ],
      ),
    );
  }
}
