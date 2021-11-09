import 'dart:ffi';

void main() {
  //es una cadena
  List wrds = [
    "end",
    'work',
    "play",
    "start",
    "walk",
    "look",
    "open",
    "rain",
    "learn",
    "clean"
  ];

  List nueva = [" "];

  for (var i = 0; i < wrds.length; i++) {
    nueva.add(wrds[i] + "ed");
  }
  for (var i = 0; i < nueva.length; i++) {
    print(nueva[i]);
  }
}
