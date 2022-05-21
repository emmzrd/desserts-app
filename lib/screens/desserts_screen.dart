import 'package:flutter/material.dart';

import 'package:day18_desserts/models/models.dart';
import 'package:day18_desserts/api/mock_food_app_service.dart';
import 'package:day18_desserts/components/components.dart';

class DessertsScreen extends StatelessWidget {
  final exploreService = MockFoodAppService();

  DessertsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //
            return RecipesGridView(recipes: snapshot.data ?? []);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
