import 'persona.dart';

class Estudiante implements Persona {

  //atributos
  String colegio;
  
  @override
  String nombre;

  //metodos
  //retorna colegio de estudiante
  String get getColegio => colegio;

  //estable colegio de estudiante
  set setColegio(String colegio) => this.colegio = colegio;

  //retorna el nombre
  String get getNombre => nombre;

  //establece el nombre
  set setNombre(String nombre) => this.nombre = nombre;

  estInfo() {
    print(this.nombre);
  }
	
  @override
  saludo() {
    print("hola soy $nombre y soy un estudiante");
  }
	
}
