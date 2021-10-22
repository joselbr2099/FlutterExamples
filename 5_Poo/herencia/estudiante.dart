import 'persona.dart';

class Estudiante extends Persona {
  
  //atributos
  String colegio;

  //metodos
  //retorna colegio de estudiante
  String get getColegio => colegio;
  //estable colegio de estudiante
  set setColegio(String colegio) => this.colegio = colegio;

  estInfo() {
    print(nombre);
    print(edad);
    print(getSexo);
    print(colegio);
  }
}
