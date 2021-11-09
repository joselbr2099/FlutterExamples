void main() {
 Empleado emp=new Empleado("Maria",1000,50);
 emp.SalarioAnual();
 }

class Empleado
{
String Nombre_completo="";
int Salario=0;
int Calificacion=0;

Empleado(String nombre,int salario,int calificacion)
{
this.Nombre_completo=nombre;
this.Salario=salario;
this.Calificacion=calificacion;
}

SalarioAnual()
{
  print("El empleado tiene un salario total de 12 meses");
}

}