void main() {
  var map1 = {
    //clave //valor
    'a': 1,
    'b': true,
    'c': 'letra c',
    1: "lunes",
    true: 'martes',
  };
  Map map2 = {'a': 1, 'b': 3};
  var map3 = <String, int>{}; //longitud 0
  Map<int, bool> map4; //map null

  print(map1['a']);

  //los maps son mutables
  map1['a'] = 666;

  //recorrido
  map2.forEach(
		(key, value) {
    	print(key + '=' + value.toString());
  	}
	);

  //usando for
  for (var key in map2.keys) {
    print(map2[key]);
  }

  //operadores
  map1 == map2 ? print("maps iguales") : print('maps distintos');
}
