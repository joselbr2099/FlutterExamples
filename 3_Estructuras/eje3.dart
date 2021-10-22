import 'dart:io';

void main(){
  print("ingresa tu nombre");
  String nombre=stdin.readLineSync();
  print("ingresa un numero");
  int n=int.parse(stdin.readLineSync());

  /*while(n>0){
    print(nombre);
    --n;
    //n=n-1;
  }*/

  for(var i=0;i<n;i++){
    print(nombre);
  }
}