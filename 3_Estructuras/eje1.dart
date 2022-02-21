import 'dart:io';

//ejemplo de como leer datos por consola
void main(){
  print("numero a:");
  int a=int.parse(stdin.readLineSync());
  print("numero b");
  int b=int.parse(stdin.readLineSync());
  
  /*if(a>=b){
    print("a es mayor que b");
  }else{
    print("a es menor que b");
  }*/

  a>=b ? print("a es mayor que b") : print("a es menor que b");
}
