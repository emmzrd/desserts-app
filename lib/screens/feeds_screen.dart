import 'package:flutter/material.dart';
import 'package:day18_desserts/api/mock_food_app_service.dart';
import 'package:day18_desserts/components/components.dart';
import 'package:day18_desserts/models/models.dart';

class FeedsScreen extends StatelessWidget {
  final mockService = MockFoodAppService();
  FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          final friendPosts = snapshot.data?.friendPosts ?? [];
          return ListView(
            children: [
              TodayRecipeListView(recipes: recipes),
              SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: friendPosts),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
