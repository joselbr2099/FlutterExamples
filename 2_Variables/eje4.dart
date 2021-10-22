import 'dart:math';

void main(){
//programa que calcula el volumen de un cilindro
/*
  formula:
  volumen=pi*radio**2*altura
*/
  const pi=3.14;
  int radio=4;
  int altura=8;
  dynamic volumen=pi*pow(radio,2)*altura;
  print(" el volumen es=${volumen}");
}