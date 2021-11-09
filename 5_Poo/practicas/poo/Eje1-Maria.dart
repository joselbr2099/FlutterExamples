void main() {
 Estudiante estu1=new Estudiante("Maria",25,65);
 estu1.notas(); ///error aqui
}

class Estudiante
{
	String Nombre_completo="";
	int Edad=0;
	int Notas=0;

	Estudiante(String nombre,int edad,int nota)
	{
		this.Nombre_completo=nombre;
		this.Edad=edad;
		this.Notas=nota;
	}

	notas()
	{
		print("El estudiante tiene como notas");
	}

}