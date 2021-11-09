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
      body: ListView(
        children: [
          newBody(),
        ],
      ),
    );
  }
}

class newBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 250,
          color: Colors.amber,
          child: Center(
            child: Image.asset(
              'images/logo.png',
              //width: 600,
              //height: 240,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 20,
          color: Colors.white,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          height: 40,
          width: 370,
          color: Colors.green,
          child: Center(
              child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('aqui va la descripcion de la imagen'),
                    Text('aqui va la descripcion de la imagen'),
                  ],
                ),
              ),
              Icon(Icons.star, color: Colors.red),
              Text('41'),
            ],
          )),
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
              Column(children: [
                Container(
                  height: 15,
                  width: 50,
                  color: Colors.redAccent,
                ),
                Icon(Icons.call, color: Colors.yellow),
                Text('calls'),
              ]),
              Column(children: [
                Container(
                  height: 15,
                  width: 50,
                  color: Colors.redAccent,
                ),
                Icon(Icons.message, color: Colors.yellow),
                Text('messages'),
              ]),
              Column(children: [
                Container(
                  height: 15,
                  width: 50,
                  color: Colors.white,
                ),
                Icon(Icons.share, color: Colors.yellow),
                Text('share'),
              ]),
              //Icon(Icons.router, color: Colors.white),
              //Icon(Icons.share, color: Colors.white)
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
            child: Text('aqui van la descripcion'),
          ),
        )
      ],
    );
  }
}
