int aux = 4;

void main() {
  int a = 4;
  suma();
  print("a despues de el procedimiento: $a"); //la variable a
  print(aux);
}

//la variable a en esta funcion es otra variable
suma() {
  print(aux);
}
