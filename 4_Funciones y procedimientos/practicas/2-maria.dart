import 'dart:io';
void main(){
	
	//declaramos la variable cadena

  imprimirnombre();
}

imprimirnombre(){
	String texto;
	//iniciamos in ciclo infinito
	while(true){

		//pedimos al usuario la cadena
		texto=stdin.readLineSync();

		if (texto=='STOP'){
			break;
		}
		
		print(texto);
	}
}
