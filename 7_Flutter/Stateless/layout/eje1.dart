import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bodyApp(),
    );
  }
}

class bodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('prueba'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.red,
              child: Text('hola'),
            ),
            Expanded(
						child: myBox()
						),
            myBoxParam(userColor: Colors.blue),
          ],
        ));
  }
}

class myBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.red,
    );
  }
}

class myBoxParam extends StatelessWidget {
  myBoxParam({this.userColor});

  final Color userColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: userColor,
    );
  }
}
