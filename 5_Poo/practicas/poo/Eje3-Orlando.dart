void main() {
 Computadora comp1=new Computadora("Asus", "4 ram", "Intel");
 Computadora comp2=new Computadora("HP", "8 ram", "AMD");

 comp1.Prender();
 comp2.Reiniciar();
 comp1.Apagar();
 comp2.Apagar();
 
}
class Computadora
{
String Marca="";
String Ram="";
String Procesador="";

Computadora(String marca,String ram,String procesador)
{
this.Marca=marca;
this.Ram=ram;
this.Procesador=procesador;
}

Prender()
{
  print("Iniciando la computadora ${this.Marca}" );
}

Apagar()
{
  print("La computadora ${this.Marca} se apagara" );
}

Reiniciar()
{
  print("${this.Marca} Reiniciando... " );
}

}
