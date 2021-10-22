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

  //se crea in text editing controller
  final myController = TextEditingController();

  //se inicializa en controller
  @override
  void initState() {
    super.initState();
		
    myController.addListener(_printLatestValue);
  }

  //se limpia el controller al finalizar  la aplicación
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  //se crea una funcion para ver el contenido
  void _printLatestValue() {
    print('Second text field: $myController.text ');
  }

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
              controller: myController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username'
              ),
              onChanged: (text){
                print("se escribio2 $text");
                myController.text=text;
              },
            )
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        return showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text(myController.text),
          );
        });
      },
      child: Icon(Icons.add),
    ),

    );
  }
}