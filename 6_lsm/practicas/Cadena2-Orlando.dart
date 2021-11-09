import 'dart:io';

void main(){
  String nombre=stdin.readLineSync().toString();
  String Texto="";
	
 for (var i = nombre.length-3; i < nombre.length; i++) {
   Texto+=nombre[i];
    
  }
  print(Texto);
}