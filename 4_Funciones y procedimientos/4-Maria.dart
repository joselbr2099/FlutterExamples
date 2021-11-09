import 'dart:io';
void main(){
  imprimirRango();
}

imprimirRango(){


//pedimos al usuario la cadena
/*
 int a= texto=stdin.readLineSync(); //la variable texto
 int b= texto=stdin.readLineSync();
*/
int a=int.parse(stdin.readLineSync());
int b=int.parse(stdin.readLineSync());
	//iniciamos in ciclo infinito
	while(a<=b){
  	   print(a);
            a=a+1;
	}
}
