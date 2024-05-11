class Estudiante {
  String cedula;
  String nombre;
  String apellido;
  String fechaNac;
  List<double> notas = [];
  double promedio;
  String direccion;
  String telefono;

  // Constructor
  Estudiante(this.cedula, this.nombre, this.apellido, this.fechaNac,
      this.direccion, this.telefono);

  // Método para cambiar la dirección
  void cambiarDireccion(String nuevaDireccion) {
    direccion = nuevaDireccion;
  }

  // Método para mostrar la información del estudiante
  void mostrarUsuario() {
    print('Cédula: $cedula');
    print('Nombre: $nombre $apellido');
    print('Fecha de Nacimiento: $fechaNac');
    print('Dirección: $direccion');
    print('Teléfono: $telefono');
    print('Notas: $notas');
    print('Promedio: $promedio');
  }
}
