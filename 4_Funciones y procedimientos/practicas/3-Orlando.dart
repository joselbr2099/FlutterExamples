import 'dart:math';
const PI=3.14;

void main(){
  int radio=5;
	dynamic area=area_circulo_funcion(radio);
  print("El area del circulo es ${area}");
  area_circulo_procedimiento(radio);
}

dynamic area_circulo_funcion(radio){
 return PI*pow(radio,2);
}

area_circulo_procedimiento(radio){
 dynamic area= PI*pow(radio,2);
 print("El area del circulo es ${area}");
}