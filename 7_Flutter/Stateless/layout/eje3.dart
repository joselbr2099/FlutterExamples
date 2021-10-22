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
                Expanded(child:
                Container(
                    width: double.maxFinite,
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myBoxParam2(userColor: Colors.amber,),
                        myBoxParam2(userColor: Colors.white,),
                        myBoxParam2(userColor: Colors.black,),
                      ],
                    )//Center(child:Text('hola de color rojo')),
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

class myBoxParam2 extends StatelessWidget {
  myBoxParam2({this.userColor});
  final Color userColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      color: userColor,
    );
  }
}
