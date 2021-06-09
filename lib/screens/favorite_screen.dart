import 'package:flutter/material.dart';
import 'package:food_app_flutter/model/meal.dart';
import 'package:food_app_flutter/widgets/meal_item.dart';
class FavoriteScreen extends StatelessWidget {

  List<Meal> favorite;

  FavoriteScreen(this.favorite);

  @override
  Widget build(BuildContext context) {
   if(favorite.isEmpty)
     return Container(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               'No Favorite Meal Try To add Some !',style: TextStyle(fontSize: 20),
             ),
             Image(
               width: 300,
               height: 300,
               image: AssetImage('assets/images/waiting.png'),
             )
           ],
         ),
       ),
     );
   else{
     return  ListView.builder(
       itemBuilder: (ctx, index) {
         return MealItem(
           id: favorite[index].id,
           title: favorite[index].title,
           imageUrl: favorite[index].imageUrl,
           duration: favorite[index].duration,
           complexity: favorite[index].complexity,
           affordability: favorite[index].affordability,
         );
       },
       itemCount: favorite.length,
     );
   }
  }
}
