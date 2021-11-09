import 'package:flutter/material.dart';
import 'package:sqlite/widgets/body.dart';
import '../widgets/input.dart';
import '../widgets/buttons.dart';
import '../widgets/title.dart';

class Tab4 extends StatefulWidget {
  @override
  _Tab4 createState() => _Tab4();
}

class _Tab4 extends State<Tab4> {
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
                        InputPost(),
                        BtnGetDb(update: _newState),
                        BtnDelete(update: _newState),
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
