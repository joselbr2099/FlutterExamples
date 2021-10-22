import 'dart:io';

void main(){
  print("dame un numero");
    int n=int.parse(stdin.readLineSync());
    int suma=0;
    for(var i=0;i<=n;i++){
      suma+=i;
    }
    print(suma);
}