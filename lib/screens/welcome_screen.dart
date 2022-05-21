import 'package:day18_desserts/home.dart';
import 'package:flutter/material.dart';
import 'package:day18_desserts/loading_main.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF002037),
      appBar: AppBar(title: Text('Desserts App'),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/welcome1.gif')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue,),
                onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoadingMain()));
            }, child: Text('Continue')),
          ],
        ),
      ),
    );
  }
}
