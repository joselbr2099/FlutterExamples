void main() {
  //declaramos el mapa
  Map Junior = {
    'SI 206': 4,
    'SI 310': 4,
    'BL 300': 3,
    'TO 313': 3,
    'BCOM 350': 1,
    'MO 300': 3
  };

  dynamic sum = 0;
  for (var key in Junior.keys) {
    sum = sum + Junior[key];
  }

  print("El total es: $sum");
}
