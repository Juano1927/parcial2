import 'dart:io';

class Estudiante {
  String cedula;
  String nombre;
  String apellido;
  String fechaNac;
  List<double> notas = [];
  double promedio = 0.0;
  String direccion;
  String telefono;

  Estudiante(this.cedula, this.nombre, this.apellido, this.fechaNac,
      this.direccion, this.telefono);
  void cambiarDireccion(String nuevaDireccion) {
    direccion = nuevaDireccion;
  }

  void mostrarUsuario() {
    print('Cedula: $cedula');
    print('Nombre: $nombre');
    print('Apellido: $apellido');
    print('Fecha de Nacimiento: $fechaNac');
    print('Dirección: $direccion');
    print('Teléfono: $telefono');
    print('Notas: $notas');
    print('Promedio: $promedio');
  }

  void calcularPromedio() {
    if (notas.isNotEmpty) {
      promedio = notas.reduce((a, b) => a + b) / notas.length;
    }
  }
}
