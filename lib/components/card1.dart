import 'package:flutter/material.dart';
import 'package:day18_desserts/models/explore_recipe.dart';
class Card1 extends StatelessWidget {
  const Card1({Key? key, required this.recipe}) : super(key: key);
  final String categories = 'Baker\'s choice!';
  final String title = 'The Art of Desserts';
  final String description = 'Learn to make the perfect cake';
  final String chef = 'Emmz';
  final ExploreRecipe recipe;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Positioned(child: Text(categories,style: TextStyle(backgroundColor: Colors.white54),),),
            Positioned(child: Text(title,style: TextStyle(backgroundColor: Colors.white54)), top: 20),
            Positioned(
              child: Text(description,style: TextStyle(backgroundColor: Colors.white54)),
              bottom: 20,
              right: 0,
            ),
            Positioned(child: Text(chef,style: TextStyle(backgroundColor: Colors.white54)), bottom: 0, right: 0),
          ],
        ),
        padding: const EdgeInsets.all(17),
        constraints: BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.5),
          image: DecorationImage(
            image: AssetImage('images/cake1.jpg',),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),

      ),
    );
  }
}
