import 'package:flutter/material.dart';
import 'package:food_app_flutter/model/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const rountName = '/meal_detail';
  final Function togglemeal;
  final Function isfavorite;

  MealDetails(this.togglemeal, this.isfavorite);

  Widget titlegenerator(String title) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget listgenerate(BuildContext context, List<String> list) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(bottom: 5, right: 15, left: 15),
      child: Container(
        width: double.infinity,
        height: 180,
        child: ListView.builder(
          itemBuilder: (ctx, index) => Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('#' + (index + 1).toString()),
                ),
                title: Text(
                  list[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
            ],
          ),
          itemCount: list.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final seletedMealId = args['id'];
    final selectedmeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == seletedMealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 250,
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      selectedmeal.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            titlegenerator('Ingredients'),
            listgenerate(context, selectedmeal.ingredients),
            titlegenerator('Steps'),
            listgenerate(context, selectedmeal.steps)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isfavorite(seletedMealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
        onPressed: () {
          togglemeal(seletedMealId);
        },
      ),
    );
  }
}
