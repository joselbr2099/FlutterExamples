//clase para un auxiliar
import 'estudiante.dart';
import 'instituto.dart';

//ejemplo de comousar mixins para emular la herencia multiple
class Auxiliar extends Estudiante with Instituto {
  //atributos
  String _materia;

  //metodos
  String get getMateria => _materia;

  set setMateria(String materia) => this._materia = materia;
}
