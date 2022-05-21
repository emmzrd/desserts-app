import 'package:flutter/material.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:day18_desserts/components/grocery_tile.dart';
import 'package:day18_desserts/screens/grocery_item_screen.dart';

class GroceryListsScreen extends StatelessWidget {


  GroceryListsScreen({Key? key, required this.manager}) : super(key: key);

  final GroceryManager manager;

  @override
  Widget build(BuildContext context) {

    final groceryItems = manager.groceryItems;

    return Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            return Dismissible(
              key: Key(item.id),
              onDismissed: (direction) {
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} removed'),
                    backgroundColor:Color(0XFFFE6862),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo', textColor: Colors.white,
                      onPressed: () {
                        manager.addItem(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                            content: Text('${item.name} added'),
                        backgroundColor:Colors.green,
                        duration: Duration(seconds: 5)));
                      },
                    ),
                  ),
                );
              },
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                color: Color(0XFFFE6862),
                child: Icon(
                  Icons.delete,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              child: InkWell(
                child: GroceryTile(
                  item: item,
                  key: Key(item.id),
                  onComplete: (change) {
                    if (change != null) {
                      manager.completeItem(index, change);

                    }
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryItemScreen(
                        originalItem: item,
                        onCreate: (item) {},
                        onUpdate: (item) {
                          manager.updateItem(item, index);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16,
            );
          },
          itemCount: groceryItems.length,
        ),
    );
  }
}
