import 'dart:ffi';

void main() {
  //es una cadena
  String rainfall_mi =
      "1.65, 1.46, 2.05, 3.03, 3.35, 3.46, 2.83, 3.23, 3.5, 2.52, 2.8, 1.85";

  //convertir la cadena a una lista
  List nums = rainfall_mi.split(", ");

  //int total = 0;
  double menor = double.parse(nums[0]);

  for (var i = 1; i < nums.length; i++) {
    if (menor > double.parse(nums[i])) {
      menor = double.parse(nums[i]);
    }
  }
  print("el menor es $menor");
}
