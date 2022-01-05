import 'package:flutter/material.dart';
import 'package:travilling_app/app_data.dart';
import 'package:travilling_app/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const categoryScreen = '/';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: categroyData
          .map((categroydata) => CategroyItem(
              id: categroydata.id,
              title: categroydata.title,
              imageurl: categroydata.imageUrl))
          .toList(),
    );
  }
}
