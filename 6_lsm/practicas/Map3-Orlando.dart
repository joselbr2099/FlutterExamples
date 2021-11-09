void main() {
  String str1 = "peter piper picked a peck of pickled peppers";

  Set letras = {};
  for (int i = 0; i < str1.length; i++) {
    if (str1[i] != " ") {
      letras.add(str1[i]);
    }
  }
  
  Map<String, int> mapLetras = <String, int>{};
  for (String letra in letras) {
    mapLetras[letra] = ContadorCaracteres(letra, str1);
  }
  print(mapLetras);
}

int ContadorCaracteres(letra, String texto) {
  int total = 0;
  for (int i = 0; i < texto.length; i++) {
    if (texto[i] == letra) {
      total++;
    }
  }
  return total;
}
