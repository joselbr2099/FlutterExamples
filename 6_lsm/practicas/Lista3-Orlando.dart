void main() {
  List cawdra = ['candy', 'daisy', 'pear', 'peach', 'gem', 'crown'];
  int total=0;
  for (String item in cawdra) {
    total+=item.length;
  }
  print("Total de caracteres es: ${total}");
}
