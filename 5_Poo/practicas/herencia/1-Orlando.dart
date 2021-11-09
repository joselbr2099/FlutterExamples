void main() {
  Marca marca=new Marca("Apple","XR", 2020, 1024);
  marca.SetBateria=90;
  marca.SetNumero="12345678";
  marca.LLamar();
  marca.ActualizarSO();
  marca.NivelBateria();
}

class Celular {
  int Bateria = 100;
  String Numero = "";

  int get GetBateria => Bateria;
  set SetBateria(int bateria) => this.Bateria = bateria;
  set SetNumero(String num) => this.Numero = num;
  LLamar() {
    print("Llamando al numero ${this.Numero}");
  }
  NivelBateria() {
    print("Nivel Bateria ${this.Bateria}%");
  }
}

class Marca extends Celular {
  String Empresa="";
  String Modelo = "";
  int Anio = 0;
  int EspacioMemoria = 0;
  Marca(empresa,modelo, anio, espacio) {
    this.Empresa = empresa;
    this.Modelo = modelo;
    this.Anio = anio;
    this.EspacioMemoria = espacio;
  }
  ActualizarSO()
  {
    print("Actualizando...");
  }

}
