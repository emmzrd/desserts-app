import 'package:day18_desserts/screens/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RecipeThumbnail extends StatefulWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeThumbnail> createState() => _RecipeThumbnailState();
}

class _RecipeThumbnailState extends State<RecipeThumbnail> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionScreen(
              title: widget.recipe.title,
              dishImage: widget.recipe.dishImage,
              information: widget.recipe.information,
              details: widget.recipe.details,
              ingredients: widget.recipe.ingredients,
              steps: widget.recipe.steps,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.asset(
                  '${widget.recipe.dishImage}',
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.recipe.title,style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
            Text(
              widget.recipe.duration,style: TextStyle(color: Colors.blue,fontSize: 15)
            ),
          ],
        ),
      ),
    );
  }
}
