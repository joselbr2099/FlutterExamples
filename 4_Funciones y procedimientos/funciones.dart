void main() {
  int a = 3;
  int b = 6;

  //ejemplo de funcion
  int res = suma(a, b);
  print(res);

  //ejemplo de procedimiento
  resta(a, b);

  //otras formas de procedimientos o funciones
  res = suma2(a, b);
  print("funcion suma2: $res");

  res = suma3(a, b);
  print("funcion suma3: $res");

  res = suma4(a, b);
  print("funcion suma4: $res");

  res = suma5(a, b);
  print("funcion suma5: $res");

  res = suma6(numa: a, numb: b);
  print("funcion suma6: $res");

  res = suma7(numa: a);
  print("funcion suma7: $res");

  res = suma8(a);
  print("funcion suma8: $res");

  //se puede asignar una funcion a una variable
  var varFunc = (a, b) => a + b;
  res = varFunc(a, b);
  print('funcion varFunc $res');

  //tambien puede usarse para varias expresiones(funcion anonima)
  varFunc = ((a, b) {
    a += b;
    a *= b;
    return a;
  });
  res = varFunc(a, b);
  print('funcion varFunc $res');
}

//funcion que suma dos numeros
int suma(a, b) {
  return a + b;
}

//procedimiento que suma dos numeros
resta(a, b) {
  print(a - b);
}

//otras formas de funciones o procedimientos
//si se conoce el dato de retorno no es necesario especificar este tipo
suma2(a, b) {
  return a + b;
}

//para FUNCIONES que contengan una unica expresion se puede usar la siguiente manera
suma3(a, b) => a + b; //esta forma se llama sintaxis arrow
//tambien
int suma4(a, b) => a + b;

//se puede especificar los tipos de datos en la funcion/procedimiento
int suma5(int a, int b) {
  return (a + b);
}

//se puede nombrar los parametros
//se puede especificar los tipos de datos en la funcion/procedimiento
int suma6({int numa, int numb}) {
  //tambien: int suma6(x,int c,{int numa, int numb}) {...}
  return (numa + numb);
}

//se puede especificar un valor por defecto
int suma7({int numa, int numb = 4}) {
  return (numa + numb);
}

//se pueden especificar parametros opcionales con[]
int suma8(int numa, [int numb]) {
  if (numb != null) {
    return numa + numb;
  }
  return (numa);
}