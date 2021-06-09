import 'package:flutter/material.dart';
import 'package:food_app_flutter/screens/filttersscreen.dart';
import './screens/category_detial_screen.dart';
import './screens/catergory_screen.dart';
import 'model/dummy_data.dart';
import 'model/meal.dart';
import 'screens/meal_detial_screen.dart';
import 'widgets/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };
  List<Meal> availblemeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void togglefavorite(String id) {
    final index = favoriteMeal.indexWhere((element) => element.id == id);
    if (index >= 0) {
      setState(() {
        favoriteMeal.removeAt(index);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }
  bool isfavorite(String id)
  {
    return favoriteMeal.any((element) => element.id==id);
  }

  void setFilter(Map<String, bool> filterdata) {
    setState(() {
      filter = filterdata;
      availblemeal = DUMMY_MEALS.where((element) {
        if (!element.isGlutenFree && filter['isGlutenFree']) {
          return false;
        }
        if (!element.isVegan && filter['isVegan']) {
          return false;
        }
        if (!element.isVegetarian && filter['isVegetarian']) {
          return false;
        }
        if (!element.isLactoseFree && filter['isLactoseFree']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyBottomNavigation(favoriteMeal),
        CategoryDetials.routName: (_) => CategoryDetials(availblemeal),
        MealDetails.rountName: (_) => MealDetails(togglefavorite,isfavorite),
        FiltersScreen.routName: (_) => FiltersScreen(filter, setFilter),
      },
      onGenerateRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}
