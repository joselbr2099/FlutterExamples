import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//ejemplo de uso de widget fila
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("row example"),
        ),
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star, color: Colors.red),
                Icon(Icons.star, color: Colors.black),
                Icon(Icons.star, color: Colors.yellow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
