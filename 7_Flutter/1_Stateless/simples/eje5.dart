import 'package:flutter/material.dart'; //se carga el diseño material

//funcion principal en notacion arrow
void main() => runApp(MyApp());

//clase MyApp hereda de StatelessWidget
class MyApp extends StatelessWidget {
  //se sobreescribe el metodo Widget de StatelessWidget
  //este metodo se encarga de construir todo el arbol de Widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //widget principal MaterialApp
      title: 'Welcome to Flutter',
      home: Scaffold(
        //Widget que ocupa toda la pantalla
        appBar: AppBar(
          //Widget app bar
          title: const Text('Welcome to Flutter'), //widget para texto
        ),
        body: Container(
          child: const Center(
            //Widget para centrar
            child: const Text('Hello World'),
          ),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
            Text('hola2'),
          ]),
        ),
      ),
    );
  }
}

/*
arbol de  Widgets

  MaterialApp
    Scaffold
      AppBar
        Text
      Center
        Text
*/
