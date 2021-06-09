import 'package:flutter/material.dart';
import 'package:food_app_flutter/model/meal.dart';
import 'package:food_app_flutter/screens/catergory_screen.dart';
import 'package:food_app_flutter/screens/favorite_screen.dart';
import 'package:food_app_flutter/screens/filttersscreen.dart';
import 'package:food_app_flutter/widgets/maindrawer.dart';

class MyBottomNavigation extends StatefulWidget {
  final List<Meal> favoriteMeal;

  MyBottomNavigation(this.favoriteMeal);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selected_index = 0;
  List<Map<String, Object>> _pages = [];

  void _selectpage(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Category'},
      {'page': FavoriteScreen(widget.favoriteMeal), 'title': 'Favorite'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        title: Text(_pages[_selected_index]['title']),
        actions: [
          IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routName))
        ],
      ),
      drawer: MainDrawer(),
      body: _pages[_selected_index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), title: Text('Favorite')),
        ],
        onTap: _selectpage,
        currentIndex: _selected_index,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}
