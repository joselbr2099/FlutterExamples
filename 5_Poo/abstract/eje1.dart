import 'estudiante.dart';
import 'persona.dart';

void main() {
  //nueva instancia de clase estudiante
  Estudiante est = Estudiante();
  est.nombre = 'jose';
  est.edad = 34;
  est.setSexo = 'masculino';
  est.colegio = 'El pacifico';
  est.estInfo();
  est.saludo();
}