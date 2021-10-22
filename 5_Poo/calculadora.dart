class Calculadora{

  //atributos
  int a=0;
  int b=0;

  //metodos
  int sumar(a,b){
    this.a=a;
    this.b=b;
    return this.a+this.b;
  }

  int sumar2(a,b){
    return a+b;
  }

  int restar(a,b){
    this.a=a;
    this.b=b;
    return this.a-this.b;
  }

  int multiplicar(a,b){
    this.a=a;
    this.b=b;
    return this.a*this.b;
  }

  double dividir(a,b){
    this.a=a;
    this.b=b;
    return this.a/this.b;
  }
}

void main(){
  Calculadora cal=new Calculadora();
  print(cal.sumar(1,4));
   print(cal.sumar2(1,4));
}