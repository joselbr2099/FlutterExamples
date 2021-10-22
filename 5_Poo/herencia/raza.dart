//clase para la raza de un perro hereda de la clase perro
import 'perro.dart';

class Raza extends Perro{

  //atributos
  String tamano;
  String nombreRaza;
  String origen;
  String maxEdad;

  //metodos
  String get color=> color;

  //establecer tamano
  set setTam(String tam) => tamano=tam;

  //establecer origen
  set setOrg(String org)=> origen=org;

  //obtner informacion
  getInfo(){
    print(tamano);
    print(nombreRaza);
    print(origen);
    print(maxEdad);
  }
}
