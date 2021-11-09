void main() {
  Empleado emp = new Empleado();
  emp.cambiar_estado("Trabajando");
  emp.cambiar_estado("Descansando");
  emp.recibir_salario();
  String mensaje = emp.aumentar_salario(5000);
  print(mensaje);
}

class Empleado {
  String Nombre = "Orlando";
  double Salario = 2000;
  String Estado = "Descansando";

  cambiar_estado(String estado) {
    this.Estado = estado;
    print("El empleado se encuentra ${this.Estado}");
  }

  recibir_salario() {
    print("El empleado recibio su sueldo: ${this.Salario}");
  }

  String aumentar_salario(double nuevosalario) {
    this.Salario = nuevosalario;
    return "El nuevo salario del empleado es de: ${this.Salario}";
  }
}
