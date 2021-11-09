import 'package:http/http.dart' as http;
import 'dart:convert'; //para usar json

// se crea una clase del tipo Future ya que se va a obtener datos de una API
Future<Album> fetchAlbum() async {
  //
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/albums/1')); //se obtiene datos desde la url de la API

  if (response.statusCode == 200) {
    //se verifica que la respuesta sea correcta
    //se parsea el json a una lista de mapas
    return Album.fromJson(jsonDecode(response.body)); //se retorna el album
  } else {
    throw Exception('\Fallo al cargar el album');
  }
}

//se crea una clase Album
class Album {
  //atributos
  final int userId;
  final int id;
  final String title;

  //constructor
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  //se crea un constructor "factory" para convertir el json a un objeto sin instanciar un nuevo objeto Album
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
