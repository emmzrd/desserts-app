import 'package:flutter/material.dart';
import 'package:day18_desserts/components/steps_tile.dart';

class StepsScreen extends StatelessWidget {
  String title;
  List steps;

  StepsScreen({required this.title, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('DessertsApp'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  'Steps in Making ${title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.separated(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final post = steps[index];
                  return StepsTile(post: post);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: steps.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
