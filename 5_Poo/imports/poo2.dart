import 'estudiante.dart';
import 'persona.dart';

void main() {
  //instancia de clasej persona
  Persona per = Persona();
  per.nombre = 'jose';
  print(per.nombre);
  per.sexo='masculino';
  print(per._nombre);
	print(per.sexo);

  //nueva instancia de clase estudiante
  Estudiante est = Estudiante();
  est.nombre = 'jose';
  est.edad = 34;
  est.setSexo = 'masculino';
  est.colegio = 'El pacifico';
  est.estInfo();
}
