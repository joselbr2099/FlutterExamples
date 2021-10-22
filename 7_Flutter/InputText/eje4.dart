import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: BodyApp2(),
    );
  }
}

class BodyApp2 extends StatefulWidget{
  @override
  _BodyApp createState() => _BodyApp();
}

class _BodyApp extends State<BodyApp2>{

  //se crea in text editing controller
  final ctrl1 = TextEditingController();
  final ctrl2 = TextEditingController();
  
  int res;

  //se inicializa en controller
  @override
  void initState() {
    super.initState();
    ctrl1.addListener(mensaje1);
    ctrl2.addListener(mensaje2);
  }

  //se limpia el controller al finalizar  la aplicación
  @override
  void dispose() {
    ctrl1.dispose();
    ctrl2.dispose();
    super.dispose();
  }
  
  void mensaje1(){
    //ctrl1.text="numero a";
  }
  void mensaje2(){
    //ctrl2.text="numero b";
  }
  
  void sumar(){
    setState(() {
      res=int.parse(ctrl1.text)+int.parse(ctrl2.text);
    });
    print("resultado $res");
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('App suma 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    controller: ctrl1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: 'Enter a search term'
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    controller: ctrl2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: 'Enter a search term'
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              width: 200,
              color: Colors.green,
              child: Center(
                  child:Text("resultado $res",
                    style: TextStyle(
                        color: Colors.white ,
                        fontSize: 30
                    ),
                  )),
            ),
            GestureDetector(
                onTap: (){
                  sumar();
                },
                child: Container(
                  height: 60,
                  width: 200,
                  color: Colors.green,
                  child: Center(
                      child:Text("sumar",
                        style: TextStyle(
                            color: Colors.white ,
                            fontSize: 30
                        ),
                      )),
                )
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          sumar();
          return showDialog(context: context, builder: (context){
            return AlertDialog(
              content: Text("$res"),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}