import 'package:flutter/material.dart';
import 'package:food_app_flutter/widgets/item_category.dart';
import '../model/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 5,
        padding: EdgeInsets.all(15),
        children: [
          ...DUMMY_CATEGORIES.map((e) {
            return ItemCategory(e.color, e.title, e.id);
          }).toList()
        ],
      ),
    );
  }
}
