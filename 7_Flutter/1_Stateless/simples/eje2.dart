import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//codigo sin usar el estilo material
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text("hola mundo",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 32,
              color: Colors.red,
            )),
      ),
    );
  }
}
