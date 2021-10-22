import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "FLutter tutorial",
    home: TutorHome(),
  ));
}

class TutorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        title: Text('Example title'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
      ),
      body: Center(
        child: Text('Hola mundo'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
