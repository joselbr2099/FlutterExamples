import 'dart:io';

void main(){
  print("dame un numero");
  int n=user();
  var res=suma(n);
  print("-->${res}");
}

int user(){
  int n=int.parse(stdin.readLineSync());
  return n;
}

int suma(int n){
  int num=0;
  int a=0;
  int aux=0;
  while(a<n){
    ++num;
    if(num%2==0){
      print(num);
      ++a;
      aux+=num;
    }
  }
  return aux;
}