import 'package:flutter/material.dart';
import '../services/options.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: Options().desc,
        //labelText: Options().desc,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
      maxLines: null,
      readOnly: true,
    );
  }
}

//para editar el campo

class MainBodyEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: Options().desc),
      decoration: InputDecoration(
        hintText: "Desc.",
        //labelText: Options().desc,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
      maxLines: null,
      onChanged: (text) {
        Options().post.body = text;
      },
    );
  }
}
