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
  int numa;
  int numb;
  int res;

  void sumar(){
    setState(() {
      res=numa+numb;
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term'
                    ),
                    onChanged: (text){
                      print("se escribio $text");
                      numa=int.parse(text);
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term'
                    ),
                    onChanged: (text){
                      print("se escribio $text");
                      numb=int.parse(text);
                    },
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
    );
  }
}