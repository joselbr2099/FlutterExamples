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
        title: Text('eje4'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 250,
            color: Colors.amber,
            child: Center(
              child: Text("aqui va la imagen"),
            ),
          ),
          Container(
            height: 20,
            color: Colors.white,
          ),
          Container(
            height: 40,
            width: 370,
            color: Colors.green,
            child: Center(
              child: Row(
                children: [
                  Expanded(child: Text('aqui va la descripcion de la imagen')),
                  Icon(Icons.star, color: Colors.red),
                  Text('41'),
                ],
              )
            ),
          ),
          Container(
            height: 10,
            color: Colors.white,
          ),
          Container(
            height: 70,
            width: 310,
            color: Colors.redAccent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Icon(Icons.phone, color: Colors.white),
                  Icon(Icons.router, color: Colors.white),
                  Icon(Icons.share, color: Colors.white)
                ],
              ) //Text('aqui van botones'),
            ),
          ),
          Container(
            height: 10,
            color: Colors.white,
          ),
          Container(
            height: 150,
            width: 340,
            color: Colors.green,
            child: Center(
              child: Text('aqui va la descripcion'),
            ),
          )

        ],
      ),
    );
  }
}