import 'dart:io';

void main() {
  //print("ingrese cadena");
  dynamic texto = stdin.readLineSync();

  var n = texto.length;

  print(texto[n - 2]);
  print(texto[n - 1]);
}
