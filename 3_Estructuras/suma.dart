import 'dart:io';

void main() {
  print("numero a:");
  // se leen los datos de entrada
  int a = int.parse(stdin.readLineSync());

  print("numero b:");
  // se leen los datos de entrada
  double b = double.parse(stdin.readLineSync());

  dynamic res = a + b;
  // se imprime el nombre
  print(res);
}
