class Estudiante {
  String cedula;
  String nombre;
  String apellido;
  String fechaNac;
  List<double> notas = [];
  double promedio;
  String direccion;
  String telefono;

  Estudiante(this.cedula, this.nombre, this.apellido, this.fechaNac,
      this.direccion, this.telefono);

  void cambiarDireccion(String nuevaDireccion) {
    direccion = nuevaDireccion;
  }

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

bool validarCedula(String cedula) {
  return cedula.isNotEmpty && cedula.contains(RegExp(r'^[0-9]+$'));
}
