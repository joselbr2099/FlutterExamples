import 'dart:io';
void main() {  
  
	int valorInicial= int.parse(stdin.readLineSync().toString());
  int valorFinal= int.parse(stdin.readLineSync().toString());
  rango(valorInicial,valorFinal);
}
rango(ini, fin) {
  print ("Rango de Numeros ${ini}-${fin}");
    for (int i = ini; i <= fin; i++) {
    print('${i}');
  }
  }
 
