class Persona {

  //atributos en modo private
  String _nombre;
  int _edad;
  String sexo; //atributo en modo public

  //metodos
  //retorna el nombre
  String get nombre => _nombre;

  //establece el nombre
  set nombre(String nombre) => _nombre = nombre;

  //retorna la edad de la persona
  int get edad => _edad;
	
  //establece la edad de la persona
  set edad(int edad) => _edad = edad;

  //retorna sexo de persona
  String get getSexo => sexo;

  //establece el sexo del estudiante
  set setSexo(String sexo) => this.sexo = sexo;
	
}
