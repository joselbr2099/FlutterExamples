import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: BodyApp(),
    );
  }
}

class BodyApp extends StatefulWidget{
  @override
  _BodyApp createState() => _BodyApp();
}

class _BodyApp extends State<BodyApp>{

  String msg1;

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("eje1"),
        ),
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'
                ),
                onChanged: (text){
                  print("se escribio $text");
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username'
                ),
                onChanged: (text){
                  print("se escribio2 $text");
                  msg1=text;
                  print("--$msg1");
                },
              )
            ],
          ),
        )
    );
  }
}