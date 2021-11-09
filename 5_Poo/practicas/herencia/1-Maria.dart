void main() {
  //nueva instancia de clase estudiante

  Marca cel = Marca();
  //Celular cel = Celular();
  cel.setBateria = '12';
  cel.setCamara = "hd";
  cel.setColor = "plomo";
  cel.setMemoria = "32gb";
  cel.setNombre = "Motorola";

  cel.MostrarBateria();
  cel.MostrarColor();
  cel.MostrarCamara();
  cel.MostrarNombre();
  cel.MostrarMemoria();
}

class Celular {
  String bateria = ' ';
  String color = ' ';
  String camara = ' ';

  //metodos

  //retorna bateria
  String get getBateria => bateria;

  //establece bateria
  set setBateria(String bateria) => this.bateria = bateria;

  //retorna color
  String get getColor => color;

  //establece color
  set setColor(String color) => this.color = color;

//retorna camara
  String get getCamara => camara;

  //establece camara
  set setCamara(String camara) => this.camara = camara;

  MostrarBateria() {
    print("La bateria es: $bateria");
  }

  MostrarColor() {
    print("El color es: $color");
  }

  MostrarCamara() {
    print("La camara es: $camara");
  }
}

class Marca extends Celular {
  //atributos
  String nombre = ' ';
  String memoria = ' ';

  //retorna nombre
  String get getNombre => nombre;

  //establece nombre
  set setNombre(String nombre) => this.nombre = nombre;

  //retorna memoria
  String get getMemoria => memoria;

  //establece memoria
  set setMemoria(String memoria) => this.memoria = memoria;

  MostrarNombre() {
    print("El nombre es: $nombre");
  }

  MostrarMemoria() {
    print("La memoria es: $memoria");
  }
}
