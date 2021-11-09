void main(List<String> arguments) {
  print('Operadores de asignacion');

  //actualizar el valor de una variable
  int a = 1;
  int b = 5;
  dynamic c = 6;

  //incremento
  b += a; //igual b=b+a
  print("b+=a ${b}");

  //decremento
  c -= a; //igual a c=c-a
  print("c-=a ${c}");

  //multiplicacion
  c *= a; //igual a c=c*a
  print("c*=a ${c}");

  //division
  c /= a; //igual a c=c/a
  print("c /=a :${c}");

  //incremento en una unidad despues de la impresion
  print("a++ ${a++}"); //despues de la impresion a=2

  //incremento en una unidad antes de la impresion
  print("++a ${++a}"); //antes de la impresion a=3

  //decremento en una unidad despues de la impresion
  print("a-- ${a--}"); //despues de la impresion a=2

  //decremento en una unidad antes de la impresion
  print("--a ${--a}"); //antes de la impresion a=1

	//expresiones de comparación
	/*
	
	a==b a es igual que b
	a>b a es mayor que b
	a<b a es menor que b
	a!=b a es distinto de b
	a>=b a es mayor igual que b
	a<=b a es menor igual que b
	'hola'=='jose'  la cadena 'hola' es igual a la cadena 'jose'

	ciclo infinito
	
	while(true){
		print("al infinito");
	}

	do{
		print("al infinito");
	}while(true)

	*/

  //estructura if
  if (a > 0) {
    print("a es mayor que cero");
  } else {
    print("a no es mayor que cero");
  }

	if (a > 0) {
    print("a es mayor que cero");
  } 

  //estructura if en una sola linea
  a > 0 ? print("a es mayor que cero") : print("a no es mayor que cero");
  var temp = 3 > 6 ? 'es mayor' : 'es menor';
  print(temp);

  //estructura else if
  if (a > 0) {
    print("a es mayor que cero");
  } else if (a == 0) {
    print("a no es igual a cero");
  } else if (a>6){
    print("a es distinto de cero");
  }

  //estructura while
  int n = 5;
  while (n > 0) {
    print(n);
    --n;
    print("Despegue");
  }

  //se rompe break en while
  n = 5;
  while (n > 0) {
    print(n);
    --n;
    //n>4 ? break; : continue:
    if (n == 2) {
      print("break");
      break;
    }
    print("Despegue");
  }

  //uso de continue
  n = 5;
  while (n > 0) {
    print(n);
    --n;
    if (n == 2) {
      print("continue");
      continue;
    }
    print("Despegue");
  }

  //estructura do-while
  int m = 5;
  do {
    print(m);
    --m;
    print("Despegue");
  } while (m > 0);

  //estructura for
  for (var i = 0; i < 5; i++) {
    print("-->${i}");
  }

  //iterar sobre una cadena
  var name='hola mundo';
  for (int i = 0; i < name.length; i++) {
    print('${name[i]}');
  }

  //estructura switch case
  switch (a) {
    case 2:
      print("a es 2");
      break;
    case 5:
      print(" a es 5");
      break;
    default:
      print("a es ${a}");
      break;
  }
}
