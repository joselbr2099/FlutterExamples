import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../screens/tab1.dart';
import '../services/options.dart';
import '../services/database.dart';
import '../data/post.dart';
import 'alert.dart';

//boton para obtener datos desde el servidor
class BtnGet extends StatelessWidget {
  BtnGet({required this.update});

  final VoidCallback update;

  //metodo para obtener los datos del servidor
  void getData() async {
    Options().setPost = await fetchPost(Options().numPost.toString());
    await Options().optSet();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: double.maxFinite,
      //width: 70,
      color: Colors.blueAccent,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          getData();
          alertMsg(context, "Datos del servidor obtenidos");
        },
        child: Text('Get Data'),
      ),
    );
  }
}

//boton para obtener datos desde la base de datos
class BtnGetDb extends StatelessWidget {
  BtnGetDb({required this.update});

  final VoidCallback update;

  //metodo para obtener los datos de la base de datos
  void getData() async {
    String data = await Db().getOnePost(Options().numPost);
    Options().updatePost(data);
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: double.maxFinite,
      //width: 70,
      color: Colors.blueAccent,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          getData();
          alertMsg(context, "Datos de la base de datos obtenidos");
        },
        child: Text('Get Data'),
      ),
    );
  }
}

//boton para guardar los datos en la base de datos
class BtnCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: double.maxFinite,
      //width: 70,
      color: Colors.blueAccent,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () async {
          await Db().insertPost(Options().post);
          alertMsg(context, "Se guardaron los datos");
        },
        child: Text('Save'),
      ),
    );
  }
}

//boton para actualizar los datos en la base de datos
class BtnUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: double.maxFinite,
      //width: 70,
      color: Colors.blueAccent,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () async {
          await Db().updatePost(Options().post);
          alertMsg(context, "Se actualizaron los datos");
        },
        child: Text('Update'),
      ),
    );
  }
}

//boton que muestra el total de post en la db
class BtnTotal extends StatelessWidget {
  int total = 0;
  //retorna el total de post en la db
  void getTotal() async {
    total = await Db().getTotalPost();
    print("total $total");
  }

  @override
  Widget build(BuildContext context) {
    getTotal();
    return Container(
      margin: EdgeInsets.all(2.0),
      height: double.maxFinite,
      width: 70,
      color: Colors.blueAccent,
      child: Center(
          child: Text(total.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20))),
    );
  }
}

//boton para borrar de la base de datos
class BtnDelete extends StatelessWidget {
  BtnDelete({required this.update});

  final VoidCallback update;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: double.maxFinite,
      //width: 70,
      color: Colors.blueAccent,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () async {
          await Db().deletePost(Options().post);
          Options().cleanPost();
          alertMsg(context, "Se borraron los datos");
          update();
        },
        child: Text('Delete'),
      ),
    );
  }
}
