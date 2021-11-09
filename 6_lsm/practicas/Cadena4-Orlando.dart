import 'dart:io';

void main() {
  String nombre = stdin.readLineSync().toString();
  String Texto = "";
  for (var i = nombre.length-2; i < nombre.length; i++) {
   Texto+=nombre[i];
  }
  dynamic Palabras= nombre.split(' ');
  if(Palabras.length>1)
  {
    Texto+=Palabras[1][0];
  }
   Texto+=Palabras[0];
   print(Texto);
}
