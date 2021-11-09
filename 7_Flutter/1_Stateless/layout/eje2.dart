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
          title: Center(child:Text('prueba')),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child:Container(
                  width: double.maxFinite,
                  color: Colors.red,
                  child: Center(child:Text('hola')),
                )),
                Expanded(child:myBox()),
                Expanded(child:myBoxParam(userColor: Colors.blue)),
          ],
        )));
  }
}

class myBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70,
      width: double.maxFinite,
      color: Colors.limeAccent,
    );
  }
}

class myBoxParam extends StatelessWidget {
  myBoxParam({this.userColor});
  final Color userColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      width: double.maxFinite,
      color: userColor,
    );
  }
}
