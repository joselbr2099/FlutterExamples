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
  var sendPost = <String, String>{};
  late String msg = ''; //tributo de tipo late

  void getPost() async {
    msg = await fetchPost(sendPost);
    print(msg);
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
                      border: OutlineInputBorder(), hintText: 'Enter userId'),
                  onChanged: (text) {
                    sendPost['userId'] = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter title'),
                  onChanged: (text) {
                    sendPost['title'] = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter body'),
                  onChanged: (text) {
                    sendPost['body'] = text;
                  },
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  child: Text(
                    "$msg",
                  ),
                ),
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
