import 'package:flutter/material.dart';
import '../services/options.dart';

class InputPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      //decoration: BoxDecoration(
      //border: Border.all(color: Colors.blueAccent)),
      child: TextField(
          keyboardType: TextInputType.number,
          // Only numbers can be entered
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            hintText: 'Enter post number',
            prefixIcon: Icon(Icons.confirmation_num),
            suffixText: "#",
            suffixStyle: TextStyle(color: Colors.blue),
            //errorText: _validate ? 'Value Can\'t Be Empty' : null,
          ),
          onChanged: (text) {
            print("guardando numero de post $text");
            if(text.length>=1){
              Options().numPost = int.parse(text);
            }
          }),
    );
  }
}
