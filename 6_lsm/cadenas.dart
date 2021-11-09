void main() {
  String cadena1 = 'banana';
  String cadena2 = 'apple';
  print(cadena1[0]); //imprime b
  print(cadena1.length); //retorna la longitud
  print(cadena1[cadena1.length - 1]); //imprime el ultimo caracter de la cadena

  //las cadenas son inmutables
  //cadena1[1] = 'c'; //error

  //recorrido
  print('recorrido');

  //se puede convertir la cadena a lista para usar forEach
  cadena1.split('').forEach(print);
  
  print('recorrido2');
  for (var caracter in cadena1.split('')) {
    print(caracter);
  }

	print('recorrido3');
  
	for (var i = 0; i < cadena1.length; i++) {
    print(cadena1[i]);
  }

  //operadores
  print(cadena1 + cadena2);
  print(cadena1 * 2);
  cadena1 == cadena2 ? print('cadenas iguales') : print('cadenas diferentes');
}
