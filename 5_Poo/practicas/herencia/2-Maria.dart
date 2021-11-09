void main() {
  //nueva instancia de clase estudiante

  Pato pato1 = Pato();

  //Condor condor1=Condor();
  pato1.setNombre = 'Patito';
  pato1.setTipo = 'no aviar';
  pato1.setClase = 'no rapiña';
  pato1.setColor = 'Blanco';
  pato1.Volar();
  pato1.Nadar();
  pato1.MostrarColor();
}

class Ave {
  //atributos en modo private
  String nombre = ' ';
  //metodos

  String get getNombre => nombre;
	
  set setNombre(String nombre) => this.nombre = nombre;

  Volar() {
    print("Esta ave de nombre: $nombre puede volar");
  }

  Nadar() {
    print("Esta ave: $nombre puede nadar");
  }
}

class Pato implements Ave {
  String color = ' ';
  String tipo = ' ';
  String clase = ' ';

  @override
  String nombre = ' ';

  String get getTipo => tipo;
  set setTipo(String tipo) => this.tipo = tipo;

  String get getColor => color;
  set setColor(String color) => this.color = color;

  @override
  String get getNombre => nombre;

  @override
  set setNombre(String nombre) => this.nombre = nombre;

  String get getClase => clase;
  set setClase(String clase) => this.clase = clase;

  MostrarColor() {
    print("Su color es: $color");
  }

  @override
  Volar() {
    print("Esta ave de nombre: $nombre puede volar");
  }

  @override
  Nadar() {
    print("Esta ave: $nombre puede nadar");
  }
}
