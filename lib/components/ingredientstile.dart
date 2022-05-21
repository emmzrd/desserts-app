import 'package:flutter/material.dart';

class IngredientsTile extends StatelessWidget {
  final String post;

  IngredientsTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.check_box_rounded,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                post,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
