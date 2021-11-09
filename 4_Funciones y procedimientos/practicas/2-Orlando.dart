import 'dart:io';

void main(){
	pedir_n_veces();
}
pedir_n_veces(){
  dynamic texto;
  while(true){
		texto=stdin.readLineSync();
		if (texto=='STOP'){
			break;
		}
		print(texto);
	}
}