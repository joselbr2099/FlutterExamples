import 'dart:io';

void main(){
  print("dame un numero");
  int n=int.parse(stdin.readLineSync());
  int num=0;
  int a=0;
  /*for(var i=0;i<n;i++){
    if(i%2==0){
      print(i);
    }
  }*/
  
  while(a<n){
    ++num;
    if(num%2==1){
      print(num);
      ++a;
    }
  }
} 
