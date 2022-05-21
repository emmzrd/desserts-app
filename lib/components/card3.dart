import 'package:flutter/material.dart';
import 'package:day18_desserts/models/explore_recipe.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/roasted-strawberry-crumble.jpeg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              // 3
              padding: const EdgeInsets.all(16),
              // 4
              child: Column(
                // 5
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // 6
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  // 7
                  SizedBox(height: 8),
                  // 8
                  Text('Recipe Trends',style: TextStyle(backgroundColor: Colors.white54),),
                  // 9
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
