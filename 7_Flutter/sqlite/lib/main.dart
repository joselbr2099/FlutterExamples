import 'package:flutter/material.dart';

//para tabs
import 'screens/tab1.dart';
import 'screens/tab2.dart';
import 'screens/tab3.dart';
import 'screens/tab4.dart';

//para servicios
import 'services/options.dart';
import 'services/database.dart';

void main() {
  //se crea una instancia de la clase options
  Options();
  Db().dataBase;

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "C.R.U.D. Example",
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.create), child: Text('Create')),
                Tab(icon: Icon(Icons.read_more), child: Text('Read')),
                Tab(icon: Icon(Icons.update), child: Text('Update')),
                Tab(icon: Icon(Icons.delete), child: Text('Delete')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
              Tab3(),
              Tab4(),
              //Text('1'),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Options().cleanPost();
              setState(() {});
            },
            tooltip: 'Increment',
            child: Icon(Icons.clear),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
