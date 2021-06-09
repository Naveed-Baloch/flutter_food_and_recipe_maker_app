import 'package:flutter/material.dart';
import 'package:food_app_flutter/main.dart';
import 'package:food_app_flutter/screens/category_detial_screen.dart';
class ItemCategory extends StatelessWidget {
  final Color color;
  final String text;
  final String id;

  ItemCategory(this.color, this.text, this.id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      splashColor: color,
      child: Card(
        elevation: 5,
        child: Container(
          width: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: color,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 0),
                      width: 70,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.all(13),
                        child: Icon(
                          Icons.no_food,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Card(
                    margin: EdgeInsets.only(top: 10.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryDetials.routName,arguments: {'id':id,'title':text});
  }
}
