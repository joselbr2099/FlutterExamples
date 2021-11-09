void main() {
 Estudiante est=new Estudiante("Orlando",25,100);
 est.aprobar();
 est.reprobar();
 est.estudiar();
}

class Estudiante
{
String NombreCompleto="";
int Edad=0;
int Nota=0;

Estudiante(String Nombre,int edad,int nota)
{
this.NombreCompleto=Nombre;
this.Edad=edad;
this.Nota=nota;
}

aprobar()
{
  print("El estudiante ${this.NombreCompleto} Aprobo!" );
}

reprobar()
{
  print("El estudiante ${this.NombreCompleto} Reprobo!" );
}

estudiar()
{
  print("El estudiante se encuentra estudiando" );
}

}
