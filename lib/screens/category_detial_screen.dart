import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_flutter/model/meal.dart';
import 'package:food_app_flutter/widgets/meal_item.dart';
import '../model/dummy_data.dart';

class CategoryDetials extends StatefulWidget {
  static const routName = '/category_detail';
  final List<Meal> filteredlist;

  CategoryDetials(this.filteredlist);

  @override
  _CategoryDetialsState createState() => _CategoryDetialsState();
}

class _CategoryDetialsState extends State<CategoryDetials> {
  List<Meal> displayedlist;

  var title;
  var isloadedinit = false;

  void removeitem(String id) {
    setState(() {
    // displayedlist.removeWhere((element) => element.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    if (!isloadedinit) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = args['title'];
      final id = args['id'];
      displayedlist = widget.filteredlist.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isloadedinit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedlist[index].id,
              title: displayedlist[index].title,
              imageUrl: displayedlist[index].imageUrl,
              duration: displayedlist[index].duration,
              complexity: displayedlist[index].complexity,
              affordability: displayedlist[index].affordability,
              handler: removeitem,
            );
          },
          itemCount: displayedlist.length,
        ));
  }
}
