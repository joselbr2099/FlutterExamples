void main() {
  int a = 55;
  int b = 23;
  int c = 4;

  mayor(a, b, c);
}
mayor(a, b, c) {
    if (a > b) {
      if (a > c) {
        print("a:${a} es el mayor");
      }
    } else {
      if (b > c) {
        print("b:${b} es el mayor");
      } else {
        print("c:${c} es el mayor");
      }
    }
  }
 
