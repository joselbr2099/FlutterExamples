import 'dart:io';

void main() {
  int ok=0;
  String texto="";
  while(ok<1)
  {
    print("Escribe un texto");
    texto = stdin.readLineSync();
    if(texto=="STOP"){
      ok++;
      print("Detenido");
    }
    else{
      print(texto);
    }
  }
}