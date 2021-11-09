import 'dart:io';

void main() {
  print("Escribe tu nombre?");
  // se leen los datos de entrada
  String name = stdin.readLineSync();
	//int res=3+int.parse(name);
  // se imprime el nombre
  print("hola ${name}");
}
