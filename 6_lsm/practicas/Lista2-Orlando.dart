void main() {
  List wrds = ["end",'work',"play","start","walk","look","open","rain","learn","clean"];
  var nuevalista = <String>[];
  for (var word in wrds) {
    nuevalista.add(word + "ed");
  }
  print(nuevalista);
}
