import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_flutter/widgets/maindrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filter_screen';
  Map<String, bool> currentfilter;

  Function savedata;

  FiltersScreen(this.currentfilter, this.savedata);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.currentfilter['isGlutenFree'];
    isVegan = widget.currentfilter['isVegan'];
    isVegetarian = widget.currentfilter['isVegetarian'];
    isLactoseFree = widget.currentfilter['isLactoseFree'];
    super.initState();
  }

  Widget createSwitchListTile(
      String title, String subtitle, bool value, Function handler) {
    return Column(
      children: [
        SwitchListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            value: value,
            onChanged: handler),
        Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Text(
              'Apply the Filters',
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            createSwitchListTile(
              'Gluten Free',
              'Show Gluten Free meals',
              isGlutenFree,
              (newvalue) {
                setState(() {
                  isGlutenFree = newvalue;
                });
              },
            ),
            createSwitchListTile(
              'Vegan',
              'Show Vegan meals',
              isVegan,
              (newvalue) {
                setState(() {
                  isVegan = newvalue;
                });
              },
            ),
            createSwitchListTile(
              'Vegetarian',
              'Show Vegetarian meals',
              isVegetarian,
              (newvalue) {
                setState(() {
                  isVegetarian = newvalue;
                });
              },
            ),
            createSwitchListTile(
              'Lactose Free',
              'Show Lactose Free meals',
              isLactoseFree,
              (newvalue) {
                setState(() {
                  isLactoseFree = newvalue;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  onPressed: () {
                    final selectedFilters = {
                      'isGlutenFree': isGlutenFree,
                      'isVegan': isVegan,
                      'isVegetarian': isVegetarian,
                      'isLactoseFree': isLactoseFree,
                    };
                    widget.savedata(selectedFilters);
                  },
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink,
                ))
          ],
        ),
      ),
    );
  }
}
