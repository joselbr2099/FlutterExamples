//paquetes para el manejo del sqlite
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import '../data/post.dart';
import 'dart:convert';

//clase singleton para guardar en sqlite
class Db {
  static final Db _savedb = Db._internal(); //singleton
  late Database _db; //para almacenar una instancia de una dataBase
  //constructor

  factory Db() {
    return _savedb;
  }

  //singleton
  Db._internal();

  //inicializamos y creamos la db
  Future<Database> get dataBase async {
    //si la base de datos ya esta inicializada solo la retornamos
    //if (_db != null) return _db;

    //inicializamos la db
    _db = await _initDb();
    return _db;
  }

  //creamos la db desde el directorio assets
  _initDb() async {
    //primero se crea el directorio y el nombre del archivo a copiar
    var path = join(await getDatabasesPath(), "test.db");
    print('path para depuracion de db     $path');
    //verificamos si existe una db del mismo nombre
    var exists = await databaseExists(path);

    //si no existe la copiamos desde la carpeta assets
    if (!exists) {
      // Debería mostrarse solo la primera vez que inicie la aplicaciónyour
      print("Creating new copy from asset");

      // Asegúrese de que exista el directorio principal
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from assets
      ByteData data = await rootBundle.load(join("assets/database", "test.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Escribe y vacía los bytes escritos
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      //print(" INFO: Opening existing database");
    }
    // open the database
    final Future<Database> database = openDatabase(path, readOnly: false);
    //final Future<Database> database = openDatabase(path, readOnly: false );
    return database;
  }

  //metodos del singleton------------------------------------------------

  //para insertar/crear datos------------------------
  Future<void> insertPost(Post post) async {
    // Get a reference to the database.
    final db = await _savedb.dataBase;
    await db.insert(
      'Posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //para obtener el total de post en la dataBase
  Future<int> getTotalPost() async {
    // Get a reference to the database.
    final db = await _savedb.dataBase;
    int? count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Posts'));
    return count ?? 0;
  }

  //par obtener unpost de la base de datos de datos
  Future<String> getOnePost(int numPost) async {
    // Get a reference to the database.
    final db = await _savedb.dataBase;
    List<Map<String, dynamic>> row = await db.query(
      'Posts',
      columns: ['userId', 'id', 'title', 'body'],
      where: "id =?",
      whereArgs: [numPost],
    );
    Map aux = {'userId': 0, 'id': 0, 'title': "NO DATA", 'body': "NO DATA"};
    //print("rowssa ${row[0]}");
    if (row.length == 0) {
      return jsonEncode(aux);
    }
    //se envia en formato json
    return jsonEncode(row[0]);
  }

  //para actualizar un post de la base de datos de datos
  Future<void> updatePost(Post post) async {
    final db = await _savedb.dataBase;
    await db.update(
      'Posts',
      post.toMap(),
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }

  //para borrar un post de la base de datos de datos
  Future<void> deletePost(Post post) async {
    final db = await _savedb.dataBase;
    await db.delete(
      'Posts',
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }

  /* //para insertar una fila en la tabla persona
  Future<int> insertPersona(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('persona', row);
  }

  //para insertar una fila en la tabla registrotopografico
  Future<void> insertTopo(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('registrotopografico', row);
  }

  //para insertar datos en la rabla parcela
  Future<int> insertParcela(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('parcela', row);
  }

  //para insertar datos en la tabla levantamiento topografico
  Future<void> insertLevanton(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('levantamientotopografico', row);
  }

  //para insertar datos en la tabla resumen
  Future<void> insertResumen(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('resumen', row);
  }

  //para insertar datos de usuario
  Future<void> insertUsuario(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('usuario', row);
  }

  //para insertar datos en la tabla zona
  Future<void> insertZona(Map<String, dynamic> row) async {
    final Database db = await _savedb.dataBase;
    return await db.insert('zona', row);
  }

  //para insertar el estado de envio de una medicion
  Future<void> insertStado(int masterId, bool autorizado) async {
    final Database db = await _savedb.dataBase;
    if (autorizado) {
      return await db.insert(
          'estado', {"pId": masterId, "estado": "local", "autorizado": 1});
    } else {
      return await db.insert(
          'estado', {"pId": masterId, "estado": "local", "autorizado": 0});
    }
  }

  //para obtener datos------------------------
  //para obtener el id del usuario
  Future<int> getUserId() async {
    final Database db = await _savedb.dataBase;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT max(brId) FROM usuario;'));
  }

  //para retornar la existencia de un usuario
  Future<bool> getUser() async {
    final Database db = await _savedb.dataBase;
    var id = Sqflite.firstIntValue(
        await db.rawQuery('SELECT max(brId) FROM usuario;'));
    if (id != null) {
      //print('return tru');
      return true;
    } else {
      return false;
    }
  }

  //para actualizar la lista de provincias en funcion del departamento
  Future<void> getProv(String departamento) async {
    final Database db = await _savedb.dataBase;

    //primero se obtiene el id de ese departamento
    List<Map> depId = await db.query('departamento',
        columns: ['dId'], where: 'dNombre = ?', whereArgs: [departamento]);

    //print(' INFO: valor de depId $depId , valor de dId $dId');

    //luego se obtiene todas las provincias de ese departamento
    List<Map> provincias = await db.query('provincia',
        columns: ['prNombre'],
        where: 'dId = ?',
        whereArgs: [depId[0]['dId'].toString()]);

    //print(" INFO: consulta de provincias $provincias");
    //borrando datos previos de la lista de provincias
    provList.clear();

    //insertando datos en la lista
    provList.add('Provincia');
    for (var provincia in provincias) {
      provList.add(provincia['prNombre']);
    }

    //print(" INFO: lista de provincias actualizada");
  }

  //para actualizar la lista de municipios en funcion a la provincia
  Future<void> getMun(String provincia) async {
    final Database db = await _savedb.dataBase;

    //primero se obtiene el id de esa provincia
    List<Map> provId = await db.query('provincia',
        columns: ['prId'], where: 'prNombre = ?', whereArgs: [provincia]);

    //print(' INFO: valor de depId $depId , valor de dId $dId');

    //luego se obtiene todos los municipios de esa provincia
    List<Map> municipios = await db.query('municipio',
        columns: ['mNombre'],
        where: 'prId = ?',
        whereArgs: [provId[0]['prId'].toString()]);

    //print(" INFO: consulta de municipios $municipios");
    //borrando datos previos de la lista de provincias
    munList.clear();

    //insertando datos en la lista
    munList.add('Municipio');
    for (var municipio in municipios) {
      munList.add(municipio['mNombre']);
    }

    //print(" INFO: lista de municipios actualizada");
  }

  //para obtener el id del municipio seleccionado
  Future<int> getMunId(String municipio) async {
    final Database db = await _savedb.dataBase;

    //primero se obtiene el id de ese municipio
    List<Map> munId = await db.query('municipio',
        columns: ['mId'], where: 'mNombre = ?', whereArgs: [municipio]);

    //print(" INFO: id de municipio ${munId[0]['mId']}]");
    return munId[0]['mId'];
  }

  //para obener una lista de federaciones validas(1) o no validas(0)
  Future<void> getFede(int autorizado) async {
    final Database db = await _savedb.dataBase;
    List<Map> listaFederaciones = await db.query('zona',
        columns: ['zNombre'],
        where: 'zAutorizada = ?',
        whereArgs: [autorizado]);
    // print(list);
    //borrando datos previos
    fedList.clear();
    //insertando datos en la lista
    fedList.add('Federación');
    for (var fed in listaFederaciones) {
      fedList.add(fed['zNombre']);
    }
    //print(" INFO: nuevo valor(from db): ${fedList[1]}");
  }

  //para obtener el id de una zona
  Future<int> getZonaId(String fed) async {
    final Database db = await _savedb.dataBase;
    int zId = Sqflite.firstIntValue(await db.query('zona',
        columns: ['zId'], where: 'zNombre = ?', whereArgs: [fed]));
    return zId;
  }

  //para obtner el nombre se una zona en base a su id
  Future<Map> getZonaName(int zId) async {
    final Database db = await _savedb.dataBase;
    List<Map> zNombre = await db.query('zona',
        columns: ['zNombre'], where: 'zId = ?', whereArgs: [zId]);
    return zNombre.first;
  }

  //para retornar un map con las mediciones y sus estados
  Future<Map> getEstado() async {
    Map estadosMap = <int, String>{};
    final Database db = await _savedb.dataBase;
    List<Map> estados = await db.query(
      'estado',
      columns: ['pId', 'estado'],
      where: 'estado != ? ',
      whereArgs: ['borrado'],
    );
    for (var estado in estados) {
      estadosMap[estado['pId']] = estado['estado'];
    }
    //print("recuperado estado de mediciones");
    // print('out> $estadosMap');
    return estadosMap;
  }

  //para retornar el estado de autorizado de la medicion
  //1 para autorizado 0 para no autorizado
  Future<int> getAutorizado(int masterId) async {
    int autorizado;
    final Database db = await _savedb.dataBase;
    List<Map> aux = await db.query(
      'estado',
      columns: ['autorizado'],
      where: 'pId = ?',
      whereArgs: [masterId],
    );
    autorizado = aux.first['autorizado'];

    return autorizado;
  }

  //para retornar una mapa de mediciones en funcion al id de estado
  Future<Map> getResumen() async {
    Map resumen = <int, Map>{};
    Map estados = <int, String>{};
    final Database db = await _savedb.dataBase;
    estados = await getEstado();
    var ids = estados.keys;
    //print("id de estados $ids");
    for (var id in ids) {
      List<Map> aux = await db.query(
        'resumen inner join registrotopografico on registrotopografico.id=resumen.id inner join estado on resumen.id=estado.pId',
        columns: [
          'resumen.id',
          'resumen.reCnerradicado',
          'resumen.reMqueda',
          'resumen.reAlmacigos',
          'resumen.reObservacion',
          'registrotopografico.rtpFecha',
          'estado.estado',
          'estado.autorizado'
        ],
        where: 'resumen.id = ?',
        whereArgs: [id],
      );
      // print('valor $id de aux ${aux}-------------');
      // print('longitud de aux ${aux.length}');
      resumen[id] = aux[0];
    }
    //print("mapa de resumen $resumen");
    return resumen;
  }

  //para obener cn/errad
  Future<String> getErrad() async {
    var aux;
    final Database db = await _savedb.dataBase;
    List<Map> estados = await db.query(
      'resumen',
      columns: ['reObservacion'],
      where: 'id = ?',
      whereArgs: [1],
    );
    for (var data in estados) {
      aux = data['reObservacion'];
    }
    //print('errad $aux');
    return aux;
  }

  //para obtener el token de usuario
  Future<String> getToken() async {
    String token;
    final Database db = await _savedb.dataBase;
    List<Map> aux = await db.query('usuario', columns: ['tokenJWT']);
    for (var item in aux) {
      token = item['tokenJWT'];
    }
    return token;
  }

  //para obtener el refreshtoken de usuario
  Future<String> getRefreshToken() async {
    String refreshToken;
    final Database db = await _savedb.dataBase;
    List<Map> aux = await db.query('usuario', columns: ['refreshToken']);
    for (var item in aux) {
      refreshToken = item['refreshToken'];
    }
    return refreshToken;
  }

  //para obtener el usuario y contraseña
  Future<Map> getCreds() async {
    Map creds = <String, String>{};
    final Database db = await _savedb.dataBase;
    List<Map> aux =
        await db.query('usuario', columns: ['nombreUsuario', 'password']);
    for (var item in aux) {
      creds[item['nombreUsuario']] = item['password'];
    }
    return creds;
  }

  //para obtener los datos de una medicion de la tabla persona
  Future<Map> getPersona(int id) async {
    Map persona = <String, dynamic>{};
    final Database db = await _savedb.dataBase;
    List<Map> aux = await db.query(
      'persona',
      columns: [
        "pNombre",
        "pPaterno",
        "pMaterno",
        "pCi",
        "pCiExp",
        "pNacimiento",
        "pNrolibreta",
        "pCargo",
        "pRol"
      ],
      where: 'id = ?',
      whereArgs: [id],
    );
    for (var item in aux) {
      persona.addAll(item);
    }
    return persona;
  }

  //para obtener los datos de una medicion de la tabla persona
  Future<Map> getRegTop(int id) async {
    Map regtop = <String, dynamic>{};
    final Database db = await _savedb.dataBase;
    List<Map> aux = await db.query(
      'registrotopografico',
      columns: [
        "rtpNrolote",
        "rtpSuplote",
        "rtpCodcato",
        "rtpFechaemicion",
        "rtpFecha",
        "rtpValido",
        "rtpCarnet",
        "rtpCentral",
        "rtpSindicato",
        //"pId",
        "brId",
        "zId",
        "mId"
      ],
      where: 'id = ?',
      whereArgs: [id],
    );
    for (var item in aux) {
      regtop.addAll(item);
    }
    //print("regtop a enviar $regtop ------------");
    return regtop;
  }

  //para obtener los datos de una medicion de la tabla parcela
  //retorna un map con el id de la fila mas los datos Map<id,dynamic>
  Future<Map> getParcela(int masterId) async {
    Map parcela = <int, dynamic>{};

    final Database db = await _savedb.dataBase;

    //primero se obtiene el id de todas las mediciones
    List<Map> ids = await db.query(
      'parcela',
      columns: ['id'],
      where: 'masterId=?',
      whereArgs: [masterId],
    );

    //print('ids recuperados $ids');
    // se itera entre los id
    for (var id in ids) {
      //obtenemos las filas en funcion de los ids obtenidos anterior mente
      List<Map> aux = await db.query(
        'parcela',
        columns: [
          "paTipo",
          "paCoorx",
          "paCoory",
          "paCoorz",
          "paArea",
          "paPerimetro",
          "paTiempo",
          //"rtpId",
          "paUtm"
        ],
        where: 'id = ?',
        whereArgs: [id['id']],
      );
      // print('lista obtenida $aux');
      //guardamos el resultado en el mapa principal
      parcela[id['id']] = aux.first;
    }
    //print("parcela a enviar $parcela ------------");
    return parcela;
  }

  //para retornar el tipo de medicion (perimetro,centroide o coordenada)
  //en base al id de la tabla parcela
  Future<String> getTipoMed(int masterId) async {
    final Database db = await _savedb.dataBase;
    List<Map> tipoMed = await db.query(
      'levantamientotopografico',
      columns: ['ltTipo'],
      where: 'masterId=?',
      whereArgs: [masterId],
    );
    return tipoMed.first['ltTipo'];
  }

  //retorna un map con las mediciones hechas hechas en la tabla levantamientotopografico Map<id,dynamic>
  Future<Map> getLevanton(int masterId) async {
    Map levanton = <int, dynamic>{};

    final Database db = await _savedb.dataBase;

    //primero se obtiene el id de todas las mediciones
    List<Map> ids = await db.query(
      'levantamientotopografico',
      columns: ['id'],
      where: 'masterId=?',
      whereArgs: [masterId],
    );

    //print('ids recuperados $ids');
    // se itera entre los id
    for (var id in ids) {
      //obtenemos las filas en funcion de los ids obtenidos anterior mente
      List<Map> aux = await db.query(
        'levantamientotopografico',
        columns: [
          "ltSegmento",
          "ltAnguloSec",
          "ltDistanciaMetros",
          "ltCoorestecalculada",
          "ltCoornortecalculada",
          "ltDistanciacalculada",
          "ltCoorsupxcalculado",
          "ltCoorsupycalculado",
          "ltSubiendo",
          "ltBajando",
          "ltTipo",
          //"paId"
        ],
        where: 'id = ?',
        whereArgs: [id['id']],
      );
      // print('lista obtenida $aux');
      //guardamos el resultado en el mapa principal
      levanton[id['id']] = aux.first;
    }
    return levanton;
  }

  //retorna el resumen de los las mediciones en la tabla resumen
  Future<Map> getTabResumen(int id) async {
    Map resumen = <String, dynamic>{};
    final Database db = await _savedb.dataBase;
    List<Map> aux = await db.query(
      'resumen',
      columns: [
        //"rtpId",
        "reCnerradicado",
        "reMqueda",
        "reAlmacigos",
        "reObservacion",
      ],
      where: 'id = ?',
      whereArgs: [id],
    );
    for (var item in aux) {
      resumen.addAll(item);
    }
    return resumen;
  }

  //para comprobar el estado de envio
  //si la columna id de cada tabla es null entonces los datos de esa tabla
  //no fueron enviados
  Future<bool> getEnvio(String tabla, int id) async {
    int aux;
    final Database db = await _savedb.dataBase;
    switch (tabla) {
      case 'persona':
        List<Map> ids = await db.query(
          'persona',
          columns: ['pId'],
          where: 'id=?',
          whereArgs: [id],
        );
        aux = ids[0]['pId'];
        break;
      case 'registrotopografico':
        List<Map> ids = await db.query(
          'registrotopografico',
          columns: ['rtpId'],
          where: 'id=?',
          whereArgs: [id],
        );
        aux = ids[0]['rtpId'];
        break;
      case 'parcela':
        List<Map> ids = await db.query(
          'parcela',
          columns: ['paId'],
          where: 'id=?',
          whereArgs: [id],
        );
        aux = ids[0]['paId'];
        break;
      case 'levantamientotopografico':
        List<Map> ids = await db.query(
          'levantamientotopografico',
          columns: ['ltId'],
          where: 'id=?',
          whereArgs: [id],
        );
        aux = ids[0]['ltId'];
        break;
      case 'resumen':
        List<Map> ids = await db.query(
          'resumen',
          columns: ['reId'],
          where: 'id=?',
          whereArgs: [id],
        );
        aux = ids[0]['reId'];
        break;
    }
    print(' INFO: valor de aux para $tabla: $aux');
    if (aux != null) {
      //si la tabla fue enviada su campo id estara con contenido
      //y retorna true
      return true;
    } else {
      //si la tabla no fue enviada retorna false
      return false;
    }
  }

  //metodos para retornar datos para le edicion
  //retorna la informacion de una persona registrada para la edicion
  Future<Map> getPerData(int masterId) async {
    final Database db = await _savedb.dataBase;
    List<Map> userData = await db.query(
      'persona',
      columns: [
        'pNombre',
        'pPaterno',
        'pMaterno',
        'pCi',
        'pNacimiento',
        'pCiExp'
      ],
      where: 'id = ?',
      whereArgs: [masterId],
    );
    return userData.first;
  }

  //para obtener el municipio provincia y departamento para la edicion
  Future<Map> getMunData(int munId) async {
    final Database db = await _savedb.dataBase;
    List<Map> munData = await db.query(
      'municipio INNER JOIN provincia on municipio.prId=provincia.prId INNER JOIN departamento on provincia.dId=departamento.dId',
      columns: [
        'municipio.mNombre',
        'provincia.prNombre',
        'departamento.dNombre'
      ],
      where: 'municipio.mId = ?',
      whereArgs: [munId],
    );
    return munData.first;
  }

  //para obtener datos del registrotopografico para la edicion
  Future<Map> getRegTopData(int masterId) async {
    final Database db = await _savedb.dataBase;
    List<Map> regTopData = await db.query(
      'registrotopografico',
      columns: [
        'rtpNrolote',
        'rtpSuplote',
        'rtpCodcato',
        'rtpCarnet',
        'rtpCentral',
        'rtpSindicato',
        'zId',
        'mId'
      ],
      where: 'id = ?',
      whereArgs: [masterId],
    );
    return regTopData.first;
  }

  //para recuperar datos de la tabla resumen para la edicion
  Future<Map> getResumenData(int masterId) async {
    final Database db = await _savedb.dataBase;
    List<Map> getResData = await db.query(
      'resumen',
      columns: ['reAlmacigos', 'reObservacion'],
      where: 'id = ?',
      whereArgs: [masterId],
    );
    return getResData.first;
  }

  //para retornar los datos

  //para borrar datos(truncate)------------------------

  //borra los datos de una tabla
  Future<void> delTable(String table) async {
    final Database db = await _savedb.dataBase;
    db.delete(table);
  }

  //borra los datos de todas las tablas
  Future<void> delAll() async {
    final Database db = await _savedb.dataBase;
    await db.delete('estado');
    await db.delete('levantamientotopografico');
    await db.delete('parcela');
    await db.delete('persona');
    await db.delete('registrotopografico');
    await db.delete('resumen');
    await db.delete('usuario');
  }

  //borra los datos de una medicion
  Future<void> delData(int id) async {
    final Database db = await _savedb.dataBase;

    //primero se eliminan los levantamientotopograficos
    List<Map> aux = await db.query('parcela',
        columns: ['id'], where: 'masterId = ?', whereArgs: [id]);
    for (var item in aux) {
      db.delete('levantamientotopografico',
          where: 'masterId = ?', whereArgs: [item['id']]);
      //print(' INFO: valor de aux on del ${item['id']}');
    }

    //se eliminan los demas datos
    db.delete('parcela', where: 'masterId = ?', whereArgs: [id]);
    db.delete('resumen', where: 'id = ?', whereArgs: [id]);
    db.delete('registrotopografico', where: 'id = ?', whereArgs: [id]);
    db.delete('persona', where: 'id = ?', whereArgs: [id]);
    db.delete('estado', where: 'id = ?', whereArgs: [id]);
    print(' INFO: borrado completo de medicion $id');
  }

  //para borrar solo los datos de parcela y levantamientotopografico(edicion)
  Future<void> delParcelaData(int masterId) async {
    final Database db = await _savedb.dataBase;

    //primero se eliminan los levantamientotopograficos
    List<Map> aux = await db.query('parcela',
        columns: ['id'], where: 'masterId = ?', whereArgs: [masterId]);
    for (var item in aux) {
      db.delete('levantamientotopografico',
          where: 'masterId = ?', whereArgs: [item['id']]);
      //print(' INFO: valor de aux on del ${item['id']}');
    }

    //se borra los datos de la tabla parcela
    db.delete('parcela', where: 'masterId = ?', whereArgs: [masterId]);
  }

  //para actualizar datos------------------------

  //actualiza el pId de la tabla person y en la tabla registrotopografico
  Future<void> upRegTop(int rtpId, masterId) async {
    final Database db = await _savedb.dataBase;

    //para la tabla persona
    await db.update('registrotopografico', {'rtpId': rtpId},
        where: "id =?", whereArgs: [masterId]);

    //para la tabla registrotopografico
    //await db.update('parcela', {'rtpId': rtpId},
    //    where: "masterId =?", whereArgs: [masterId]);

    //para actualizar la tabla resumen el valor rtpId
    //await db.update('resumen', {'rtpId': rtpId},
    //    where: "id =?", whereArgs: [masterId]);
  }

  //paractualizar la tabla estado para el envio
  Future<void> upEstado(int masterId, String std) async {
    final Database db = await _savedb.dataBase;

    //para ctualizar el estado de envio de una medicion
    await db.update('estado', {'estado': std},
        where: "id =?", whereArgs: [masterId]);
  }

  //paractualizar el token
  Future<void> upToken(String nombreUsuario, token, refreshtoken) async {
    final Database db = await _savedb.dataBase;

    //para actualizar el token
    await db.update(
        'usuario', {'tokenJWT': token, 'refreshtoken': refreshtoken},
        where: "nombreUsuario =?", whereArgs: [nombreUsuario]);
  }

  //para actualizar los datos durante la edicion
  Future<void> upPersonaData(
      String nombre, paterno, materno, exp, fechaNac, ci, masterId) async {
    final Database db = await _savedb.dataBase;

    //para la tabla persona
    await db.update(
        'persona',
        {
          'pNombre': nombre,
          'pPaterno': paterno,
          'pMaterno': materno,
          'pCi': ci,
          'pCiExp': exp,
          'pNacimiento': fechaNac,
        },
        where: "id =?",
        whereArgs: [masterId]);
  }

  //para actualizar los datos del registrotopografico durante la edicion
  Future<void> upRegTopData(codCato, carProd, central, sindicato, numLote,
      supLote, zId, mId, masterId) async {
    final Database db = await _savedb.dataBase;

    //para la tabla persona
    await db.update(
        'registrotopografico',
        {
          'rtpNrolote': numLote,
          'rtpSuplote': supLote,
          'rtpCodcato': codCato,
          //'rtpFecha': fechaNow,
          'rtpCarnet': carProd,
          'rtpCentral': central,
          'rtpSindicato': sindicato,
          'zId': zId,
          'mId': mId,
        },
        where: "id =?",
        whereArgs: [masterId]);
  }

  //para actualizar la tabla resumen(edicion)
  Future<void> upResumenData(
      double reAlmacigos, String reObservacion, int masterId) async {
    final Database db = await _savedb.dataBase;

    //paractualizar la tabla levantamientotopografico
    await db.update(
        'resumen',
        {
          'reAlmacigos': reAlmacigos,
          'reObservacion': reObservacion,
        },
        where: "id =?",
        whereArgs: [masterId]);
  }

  //para actualizar la tabla resumen(edicion)
  Future<void> upResumenData2(
      double reCnerradicado, reMqueda, int masterId) async {
    final Database db = await _savedb.dataBase;

    //paractualizar la tabla levantamientotopografico
    await db.update(
        'resumen',
        {
          'reCnerradicado': reCnerradicado,
          'reMqueda': reMqueda,
        },
        where: "id =?",
        whereArgs: [masterId]);
  }

  //actualiza el pId de la tabla persona y en la tabla registrotopografico
  Future<void> upPersonas(int pId, id) async {
    final Database db = await _savedb.dataBase;

    //para la tabla persona
    await db.update('persona', {'pId': pId}, where: "id =?", whereArgs: [id]);

    //para la tabla registrotopografico
    await db.update('registrotopografico', {'pId': pId},
        where: "id =?", whereArgs: [id]);
  }

  //para actualizar una fila de parcela
  Future<void> upParcela(int paId, id) async {
    final Database db = await _savedb.dataBase;

    //para la tabla parcela
    await db.update('parcela', {'paId': paId}, where: "id =?", whereArgs: [id]);

    //paractualizar la tabla levantamientotopografico
    await db.update('levantamientotopografico', {'paId': paId},
        where: "masterId =?", whereArgs: [id]);
  }

  //paractualizar la tabla levantamientotopografico
  Future<void> upLevanton(int ltId, id) async {
    final Database db = await _savedb.dataBase;

    //paractualizar la tabla levantamientotopografico
    await db.update('levantamientotopografico', {'ltId': ltId},
        where: "id =?", whereArgs: [id]);
  }

  //paractualizar la tabla resumen
  Future<void> upResumen(int reId, id) async {
    final Database db = await _savedb.dataBase;

    //paractualizar la tabla levantamientotopografico
    await db.update('resumen', {'reId': reId}, where: "id =?", whereArgs: [id]);
  }

  //para actualizar la autorizacion de una medicion durante una actualizacioin
  Future<void> upAutorizado(int masterId, bool autorizado) async {
    final Database db = await _savedb.dataBase;
    if (autorizado) {
      return await db.update('estado', {"autorizado": 1},
          where: "id =?", whereArgs: [masterId]);
    } else {
      return await db.update('estado', {"autorizado": 0},
          where: "id =?", whereArgs: [masterId]);
    }
  }*/
}
