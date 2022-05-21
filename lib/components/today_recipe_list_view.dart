import 'package:flutter/material.dart';
import 'package:day18_desserts/components/components.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:day18_desserts/models/explore_recipe.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class TodayRecipeListView extends StatefulWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  State<TodayRecipeListView> createState() => _TodayRecipeListViewState();
}

class _TodayRecipeListViewState extends State<TodayRecipeListView> {
  bool selected = false;
  bool animated = false;

  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  var colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selected=!selected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              width: 300.0,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Desserts of the Day!',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedContainer(
              width: selected ? 500.0 : 300.0,
              height: selected ? 480.0 : 350.0,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: selected ? Colors.lightBlueAccent : Colors.blue,),
              alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              // listview
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final recipe = widget.recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                itemCount: widget.recipes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // card
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist!');
    }
  }
}
