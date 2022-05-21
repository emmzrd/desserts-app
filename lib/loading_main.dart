
import 'package:day18_desserts/screens/grocery_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:day18_desserts/home.dart';
import 'package:provider/provider.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:day18_desserts/screens/welcome_screen.dart';

class LoadingMain extends StatelessWidget {
  const LoadingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: 'DessertsApp',
      // We assign MultiProvider as a property of Home. This accepts a list of providers for Home's
      // descendant widgets to access
      home: MultiProvider(
        providers: [
          // ChangeNotifierProvider creates an instance of TabManager, which listens to tab index
          // changes and notifies its listeners.
          ChangeNotifierProvider(create: (context) => TabManager()),
          // Todo 10: Add GroceryManager Provider
          // All descendant widgets of FoodApp can now listen to or access GroceryManager
          ChangeNotifierProvider(create: (context) => GroceryManager()),



        ],
        child: const Home(),
      ),
    );
  }
}