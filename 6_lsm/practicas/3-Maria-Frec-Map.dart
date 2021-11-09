void main() {
  String str1 = "peter piper picked a peck of pickled peppers";
  List str2 = str1.split(" ");
  String aux = ' ';
  int tam = 0;
  //declaramos el mapa
  Map frec1 = {};

  for (var i = 0; i < str2.length; i++) {
    aux = str2[i];
    tam = aux.length;
    frec1[str2[i]] = tam;
  }

  print(frec1);
}
