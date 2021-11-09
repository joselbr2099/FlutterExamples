import 'package:flutter/material.dart';
import 'package:sqlite/services/options.dart';
import 'package:sqlite/widgets/body.dart';
import '../widgets/input.dart';
import '../widgets/buttons.dart';
import '../widgets/title.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2 createState() => _Tab2();
}

class _Tab2 extends State<Tab2> {
  void _newState() {
    setState(() {});
    print("from tab1");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 60,
                  width: double.maxFinite,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //BtnTotal(),
                        InputPost(),
                        BtnGetDb(update: _newState),
                        //btnCreate(),
                      ])),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
              MainTitle(),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
              MainBody()
            ],
          ),
        )
      ],
    );
  }
}
