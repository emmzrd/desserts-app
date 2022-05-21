import 'package:flutter/material.dart';
import 'package:day18_desserts/components/author_card.dart';
import 'package:day18_desserts/models/explore_recipe.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({
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
            image: AssetImage('images/mousse.jpg'),
            fit: BoxFit.cover,
          ),
          boxShadow: [BoxShadow(color: Colors.pink, spreadRadius: 3)],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            const AuthorCard(
              authorName: 'Emmeline Dobla',
              title: 'Desserts Master',
              imageProvider: AssetImage('images/emmz.jpg'),
            ),
            // TODO 4: add Positioned text
            // 1
            Expanded(
              // 2
              child: Stack(
                children: [
                  // 3
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Sweets',
                      style: TextStyle(fontSize: 28, backgroundColor: Colors.white54),
                    ),
                  ),
                  // 4
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Chocolates',
                        style: TextStyle(fontSize: 28, backgroundColor: Colors.white54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
