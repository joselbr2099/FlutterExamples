void main(List<String> arguments) {
  var lista = [1, 2, 3, 5];
  List lista2 = ['hola', 'aqui'];
  var lista3 = <String>[]; //longitud 0
  List<String> lista4; //lista null
  var lista5 = List<int>.filled(5, 0); //lista de tamaño fijo llenado con 0
  var lista6 = [3, 'r', 6, bool];

  //set
  var set1 = {'a', 3, 5, '4'};

  var lista1 = [1, 2, 3, 4];
  print(lista1[1]);
  print(lista1[2]);
  print(lista1[3]);

  //las listas son mutables
  lista1[0] = 99;

  //iteración de lista/set
  set1.forEach(print);

  //forma1
  lista1.forEach(print);

  //forma2 usando funcion anonima
  lista1.forEach(
  (element) {
    print(element);
  }
  );

  //forma 3
  for (var element in lista1) {
    print(element);
  }

  //forma4
  for (var i = 0; i < lista1.length; i++) {
    print(lista1[i]);
  }

  //operaciones sobre listas
  //concatenacion deben ser del mismo tipo
  var listaTotal = lista1 + lista1;
  print(listaTotal);

  //resta
  lista1 == lista2 ? print('listas iguales') : print('listas diferentes');
  print(lista1.length);
  print(lista2.length);
  print(lista3.length);
  print(  lista4 ?? 'es null'    );
  print(lista5);
}
