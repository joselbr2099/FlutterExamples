import 'package:flutter/material.dart';
import '../services/options.dart';

class MainTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: Options().title,
        //labelText: Options().title,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
      maxLines: null,
      readOnly: true,
    );
  }
}

class MainTitleEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: Options().title),
      decoration: InputDecoration(
        hintText: "Titulo.",
        //helperText: Options().title,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
      maxLines: null,
      onChanged: (text) {
        Options().post.title = text;
      },
    );
  }
}
