import 'package:flutter/material.dart';

class StepsTile extends StatelessWidget {
  final String post;

  StepsTile({Key? key, required this.post}) : super(key: key);

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
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
