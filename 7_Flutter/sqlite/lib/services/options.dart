import 'dart:convert';

import '../data/post.dart';

//singleton para manejar el acceso a las opciones de la aplicacion
class Options {
  //atributos
  static final Options _options = Options._internal(); //singleton
  int _numPost = 0;
  late Post
      _post; //= Post(userId: 0, id: 0, title: "NO DATA", body: "NO DATA");
  String _title = "NO DATA";
  String _desc = "NO DATA";

  //factory constructor
  factory Options() {
    return _options;
  }

  //singleton
  Options._internal();

  //setters
  set numPost(int num) => this._numPost = num;
  set setPost(Post post) => this._post = post;
  set desc(String desc) => this._desc = desc;
  set title(String title) => this._title = title;

  //getters
  int get numPost => this._numPost;
  Post get post => this._post;
  String get desc => this._desc;
  String get title => this._title;

  //metodos
  optSet() async {
    desc = _post.body;
    title = _post.title;
  }

  updatePost(String data) async {
    _post.update(jsonDecode(data));
    await optSet();
  }

  cleanPost() {
    desc = "NO DATA";
    title = "NO DATA";
  }
}
