void main() {
  //instancia de clasej persona
  Biblioteca est1 = Biblioteca();
  est1.setNomLibro = 'calculo';
  est1.setNombreAutor = 'UMSA';

  //aux.setInstitucion = aux.getInstNombre;
  //print(aux.getMateria);
  print(est1.getNomLibro);
  print(est1.getNombreAutor);
}

class Autor {
  //atrubutos
  String _nombreAutor = ' ';
  String _apellidoAutor = ' ';
  String _sexoAutor = ' ';

  //metodos
  String get getNombreAutor => _nombreAutor;

  set setNombreAutor(String nombreAutor) => this._nombreAutor = nombreAutor;

  String get getApellidoAutor => _apellidoAutor;
	
  set setApellidoAutor(String apellidoAutor) =>
      this._apellidoAutor = apellidoAutor;

  String get getSexoAutor => _sexoAutor;
  set setSexoAutor(String sexoAutor) => this._sexoAutor = sexoAutor;
}

class Libro {
  //atributos
  String _nomLibro = ' ';
  int _numPaginas = 0;
  int _edicion = 0;

  //metodos

  String get getNomLibro => _nomLibro;
  set setNomLibro(String au) => this._nomLibro = au;

  int get getNumPaginas => _numPaginas;
  set setNumPaginas(int numPaginas) => this._numPaginas = numPaginas;

  int get getEdicion => _edicion;
  set setEdicion(int edicion) => this._edicion = edicion;
}

class Biblioteca extends Libro with Autor {
  //atributos
  String _estante = ' ';
  String _numFila = ' ';
  String _posicion = ' ';

  //metodos
  String get getEstante => _estante;
  set setEstante(String es) => this._estante = es;

  String get getNumFila => _numFila;
  set setNumFila(String numFila) => this._numFila = numFila;

  String get getPosicion => _posicion;
  set setPosicion(String posicion) => this._posicion = posicion;
}
