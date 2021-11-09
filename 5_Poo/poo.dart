//definimos una clase perro
class Perro {
  
  //atributos
  String raza = 'poodle';
  int edad = 2;
  String color = 'leonardo';
  String nombre = 'firulais';
  String tamano;

  //constructor
  Perro(String tam) {
    this.tamano = tam;
  }

  //metodos
  correr() {
    print("estoy corriendo");
  }

  ladrar() {
    print("guawf guawf");
  }

  jugar() {
    print("estoy jugando");
  }

  //geters an setter
  int get perroEdad {
    return edad;
  }

	int getperroEdad(){
		return edad;
	}

  void set perroEdad(int edad) {
    this.edad = edad;
  }

	setperroEdad(int edad){
		this.edad=edad;
	}
}

void main() {
  Perro perro = new Perro('mediano');

  print(perro.nombre);
  perro.nombre = 'firulaso';
  print(perro.nombre);
  print(perro.perroEdad); //de llama al get
  perro.perroEdad = 5;
  print(perro.perroEdad);

	Perro perro2= new Perro("grande");
	perro2.nombre='mario';
	print(perro2.nombre);
}
