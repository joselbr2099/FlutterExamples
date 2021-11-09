import 'package:flutter/material.dart';
//import 'album.dart';
import 'post.dart';
//import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //se definen atributos
  String postNum = "0";
  late Post post; //tributo de tipo late
  String titulo = '';
  String body = '';
  //String titulo = "";

  void getPost() async {
    post = await fetchPost(postNum);
    titulo = post.title;
    body = post.body;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter post number'),
                  onChanged: (text) {
                    postNum = text;
                  },
                ),
                Container(
                  width: double.maxFinite,
                  height: 200,
                  color: Colors.amber,
                  child: Text(
                    "$titulo",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 10,
                  color: Colors.white,
                  child: Text(""),
                ),
                Container(
                  width: double.maxFinite,
                  height: 200,
                  color: Colors.amber,
                  child: Text(
                    "$body",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getPost,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
