void main() {
  int a = 4;
  suma(a);
  print("a despues de el procedimiento: $a"); //la variable a
  //print(res); //la variable res declarada en suma2
}

//la variable a en esta funcion es otra variable
suma(aux) {
  ++aux;
  print("a en el procedimiento $aux"); //se suma 1 a la variable
}

suma2(a) {
  ++a;
  int res = a; //se suma 1 a la variable
}

/*suma3() {
  ++b;
}*/
