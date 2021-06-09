import 'package:flutter/material.dart';
import 'package:food_app_flutter/screens/filttersscreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(BuildContext context, IconData iconData, String text,
      Function taphandler) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            iconData,
            size: 20,
            color: Colors.black,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          onTap: taphandler,
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Recipe Maker',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          buildListtile(context, Icons.restaurant, 'Meal',
              () => {Navigator.of(context).pushReplacementNamed('/')}),
          buildListtile(context, Icons.settings, 'Filters', () => {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName)
          }),
        ],
      ),
    );
  }
}
