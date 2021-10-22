import 'dart:io';

void main() {
  print("Escribe tu nombre?");
  // se leen los datos de entrada
  String name = stdin.readLineSync();

  // se imprime el nombre
  print("hola ${name}");
}
