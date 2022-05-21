import 'package:day18_desserts/screens/steps_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day18_desserts/components/ingredientstile.dart';


class DescriptionScreen extends StatelessWidget {
  String title;
  String dishImage;
  List information;
  String details;
  List ingredients;
  List steps;

  DescriptionScreen(
      {required this.title,
      required this.dishImage,
      required this.information,
      required this.details,
      required this.ingredients,
      required this.steps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('${title}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10,),
              height: 300,
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: ClipRRect(
                child: Image.asset(
                  dishImage,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                details,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: Text(
                'Ingredients:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final post = ingredients[index];
                return IngredientsTile(post: post);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemCount: ingredients.length,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StepsScreen(title: title, steps: steps)));
              },
              child: Text('Steps in Making $title'),
            )
          ],
        ),
      ),
    );
  }
}
