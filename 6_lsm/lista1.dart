void main(){

  List nums = [4, 5, 2, 93, 3, 5];

  var sum=0;

  for(var elemento in nums){
    sum+=elemento;
  }

  print("la suma es $sum");
}