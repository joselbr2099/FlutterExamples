void main() {
  
  Map Junior = {'SI 206':4, 'SI 310':4, 'BL 300':3, 'TO 313':3, 'BCOM 350':1, 'MO 300':3};
  int total=0;
  for (int values in Junior.values) {
    total+=values;
  }
  print("Total ${total}");
}
