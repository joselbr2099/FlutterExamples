import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BodyApp(),
    );
  }
}

class BodyApp extends StatefulWidget {
  @override
  _BodyApp createState() => _BodyApp();
}

class _BodyApp extends State<BodyApp> {
  int a = 0;
  int b = 0;
  int result = 0;

  void sumar() {
    setState(() {
      result = a + b;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("eje1"),
        ),
        body: Center(
          child: ListView(
            //smainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
                padding: EdgeInsets.all(20),
                child: Text("la suma es $result"),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a search term'),
                onChanged: (text) {
                  a = int.parse(text);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username'),
                onChanged: (text) {
                  b = int.parse(text);
                },
              ),
              GestureDetector(
                onTap: sumar,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  padding: EdgeInsets.all(20),
                  child: Text("sumar"),
                ),
              )
            ],
          ),
        ));
  }
}
