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
  String get nombre => _nombre;
  //establece el nombre
  set nombre(String nombre) => _nombre = nombre;

  estInfo() {
    print(_nombre);
  }

 

  @override
  saludo() {
    print("hola soy $nombre y soy uin estudiante");
  }
}
