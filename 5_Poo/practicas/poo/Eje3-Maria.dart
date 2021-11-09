void main() {
 Computadora pc1=new Computadora("",0,0);
 pc1.Caracteristicas();
 }

class Computadora
{
String Modelo="";
int Memoria=0;
int Disco;


Computadora(String modelo,int memoria,int disco)
{
this.Modelo=modelo; //error
this.Memoria=memoria;
this.Disco=disco;
}

Caracteristicas()//error
{
  print("El empleado tiene un salario total de 12 meses");
}

}