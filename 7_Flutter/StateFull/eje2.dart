import 'package:flutter/material.dart';

void main() {
  runApp(startApp());
}

class startApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int x = 0;

  void cambio() {
    setState(() {
      x++;
    });
  }

  void resta() {
    setState(() {
      x--;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eje1"),
        actions: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    cambio();
                    print('boton presionado');
                  },
                  child: Container(
                      color: Colors.green,
                      height:30,
                      width: 100,
                      child: Center(
                          child: Text("+1",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ))
                  )
              ),
            ],
          )
        ],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.amber,
                child: Text("numero $x",
                  style: TextStyle(color: Colors.green,fontSize: 50),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        cambio();
                        print('boton presionado');
                      },
                      child: Container(
                          color: Colors.green,
                          height: 100,
                          width: 100,
                          child: Center(
                              child: Text("+1",
                                style: TextStyle(color: Colors.white,fontSize: 50),
                              ))
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        resta();
                        print('boton presionado resta');
                      },
                      child: Container(
                          color: Colors.red,
                          height: 100,
                          width: 100,
                          child: Center(
                              child: Text("-1",
                                style: TextStyle(color: Colors.white,fontSize: 50),
                              ))
                      )
                  )
                ],
              )
            ],
          ))
    );
  }
}
