import 'package:http/http.dart' as conection; //creamos un alias
import 'dart:convert';

//en esta clase recibimos el parammetro numPost
Future<String> fetchPost(Map sendPost) async {
  final conection.Response response = await conection.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(sendPost));

  if (response.statusCode == 201) {
    //se parsea el json a una lista de mapas
    return "Se enviaron las datos con éxito\n ${response.body}";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('\Fallo al enviar los datos ${response.statusCode}');
    return "fallo al enviar los datos ${response.statusCode}";
  }
}

/*
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
*/