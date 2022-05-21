import 'package:flutter/material.dart';
import 'package:day18_desserts/screens/feeds_screen.dart';
import 'package:day18_desserts/screens/desserts_screen.dart';
import 'package:day18_desserts/screens/grocery_screen.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:provider/provider.dart';
import 'package:day18_desserts/screens/welcome_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List pages = [
    FeedsScreen(),
    DessertsScreen(),
    GroceryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Wraps all the widgets inside Consumer. When TabManager changes, the widgets below it will rebuild

    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('FoodApp'),
            centerTitle: true,
          ),
          // Todo: Replace body
          // Display the correct page widget, based on the current tab index
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            // Sets the current index of BottomNavigationBar
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              // Calls manager.goToTab() when the user taps a different tab,
              // to notify other widgets that the index changed.
              tabManager.goToTab(index);
            },
            items: const [

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.comment,
                  ),
                  label: 'Feeds'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.cake,
                  ),
                  label: 'Desserts'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: 'To Buy'),

            ],
          ),
        );
      },
    );
  }
}
