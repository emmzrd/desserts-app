import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:day18_desserts/models/models.dart';



class GroceryTile extends StatelessWidget {

  final GroceryItem item;

  final Function(bool?)? onComplete;


  final TextDecoration textDecoration;

  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo: change this widget
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0, // soften the shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      height: 120,
      //Todo: Replace this color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Todo: Add Row to group(name, date, importance)
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.shopping_bag,
            color: item.color,
            size: 50,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                item.name,
                style: TextStyle(decoration: textDecoration,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              buildDate(),
              SizedBox(
                height: 4,
              ),
              buildImportance(),
              SizedBox(
                height: 4,
              ),
              Text('Qty.: ${item.quantity.toString()}',
                style: TextStyle(decoration: textDecoration),
              ),
              SizedBox(
                height: 4,
              ),
              Text('${item.payment}',style: TextStyle(decoration: textDecoration)),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          //todo: add row to group(quantity, checbox)
          Row(
            children: [
              buildCheckBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.LOW) {
      return Text(
        'Low',
        style: TextStyle(decoration: textDecoration),
      );
    } else if (item.importance == Importance.MEDIUM) {
      return Text(
        'Medium',
        style: TextStyle(decoration: textDecoration),
      );
    } else if (item.importance == Importance.HIGH) {
      return Text(
        'High',
        style: TextStyle(decoration: textDecoration),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }


  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd, yyyy h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }



  Widget buildCheckBox() {
    return Checkbox(
        value: item.isComplete,
        onChanged: onComplete);
  }
}
