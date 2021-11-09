import 'auxiliar.dart';

void main() {
  //instancia de clasej persona
  Auxiliar aux = Auxiliar();
  aux.setMateria = 'calculo';
  aux.setInstNombre = 'UMSA';
	
  aux.setInstitucion = aux.getInstNombre;
  print(aux.getMateria);
  print(aux.getInstNombre);
  print(aux.getInstitucion);
}
