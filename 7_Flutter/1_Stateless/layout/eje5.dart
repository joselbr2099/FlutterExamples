import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "FLutter tutorial",
    home: SafeArea(
      child: TutorHome(),
    ),
  ));
}

class TutorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 200,
          color: Colors.red,
        ),
        Container(
          height: 20,
          color: Colors.white,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          //color: Colors.blue,
          child: Container(
            color: Colors.blue,
          ),
        ),
        Container(
          height: 10,
          color: Colors.white,
        ),
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            color: Colors.green,
          ),
        ),
        Container(
          height: 10,
          color: Colors.white,
        ),
        Container(
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ]),
    );
  }
}
