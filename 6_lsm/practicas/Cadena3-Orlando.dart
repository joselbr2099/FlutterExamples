import 'dart:io';

void main() {
  String nombre = stdin.readLineSync().toString();
  String Texto = "";
  for (var i = 0; i < nombre.length; i++) {
    if (i % 2 == 0) {
      Texto += nombre[i];
    }
  }
  print(Texto);
}
