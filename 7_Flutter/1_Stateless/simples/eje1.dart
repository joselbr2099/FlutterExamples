import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "My primera aplicacion",
      home: Scaffold(
        appBar: AppBar(
          title: Text('default bar'),
        ),
        body: Center(
          child: Text('Hola mundo'),
        ),
      ),
    );
  }
}
