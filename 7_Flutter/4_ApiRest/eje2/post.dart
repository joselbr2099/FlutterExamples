import 'package:http/http.dart' as conection; //creamos un alias
import 'dart:convert';

//en esta clase recibimos el parammetro numPost
Future<Post> fetchPost(String numPost) async {
  final response = await conection
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/' + numPost));

  if (response.statusCode == 200) {
    //se parsea el json a una lista de mapas
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('\Fallo al cargar el album');
  }
}

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
