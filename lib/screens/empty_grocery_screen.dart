import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day18_desserts/models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  'assets/food_app_assets/empty_cart.png',
                ),
              ),
            ),
            // Todo 5: Add empty screen title
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0,color: Colors.white),
            ),
            // Todo 6: Add empty screen subtitle
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            // Todo 7: Add browse recipes button
            MaterialButton(
                textColor: Colors.white,
                child: const Text(
                  'Browse Recipes',
                ),
                color: Colors.green,
                onPressed: () {
                  Provider.of<TabManager>(context, listen: false).goToRecipes();
                }),
          ],
        ),
      ),
    );
  }
}
