import 'package:flutter/material.dart';
import 'package:day18_desserts/screens/empty_grocery_screen.dart';
import 'package:day18_desserts/screens/grocery_item_screen.dart';
import 'package:provider/provider.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:day18_desserts/screens/grocery_list_screen.dart';
class GroceryScreen extends StatelessWidget {
  GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFF0A0E21),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {

          final manager = Provider.of<GroceryManager>(context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },

                onUpdate: (item) {},
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: buildGroceryScreen(),
    );
  }

  // Todo: Add buildGroceryScreen
  Widget buildGroceryScreen() {

    return Consumer<GroceryManager>(

      builder: (context, manager, child) {

        if (manager.groceryItems.isNotEmpty) {

          return GroceryListsScreen(manager: manager);
          return Container();
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
