import 'dart:ffi';

void main() {
  //es una cadena
  List cawdra = ['candy', 'daisy', 'pear', 'peach', 'gem', 'crown'];

  dynamic total = 0;

  for (var i = 0; i < cawdra.length; i++) {
    total = total + cawdra[i].length;
  }

  print("el numero de caracteres es: $total");
}
