import 'package:flutter/material.dart';
import '../widgets/body.dart';
import '../widgets/input.dart';
import '../widgets/buttons.dart';
import '../widgets/title.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1 createState() => _Tab1();
}

class _Tab1 extends State<Tab1> {
  //para poser cambiar el estado de la aplicacion desde un widgets
  // late BtnGet btnGet;

  /*late Widget btnGet;

  @override
  void initState() {
    super.initState();
    btnGet = BtnGet();
  }*/
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
                        BtnGet(update: _newState),
                        BtnCreate(),
                      ])),
              Divider(
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
