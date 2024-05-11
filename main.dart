import 'dart:io';
import 'estudiante.dart';

void main() {
  List<Estudiante> estudiantes = [];

  while (true) {
    print('\nMenú:');
    print('1. Registrar Estudiante');
    print('2. Ver/Modificar Información de Estudiante');
    print('3. Salir');
    stdout.write('Ingrese su opción: ');
    String opcion = stdin.readLineSync()!;

    switch (opcion) {
      case '1':
        registrarEstudiante(estudiantes);
        break;
      case '2':
        verModificarEstudiante(estudiantes);
        break;
      case '3':
        print('Saliendo del programa...');
        return;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }
}

void registrarEstudiante(List<Estudiante> estudiantes) {
  stdout.write('\nIngrese la cédula del estudiante: ');
  String cedula = stdin.readLineSync()!;

  // Validar cédula
  if (!validarCedula(cedula)) {
    print('La cédula debe contener solo números. Intente de nuevo.');
    return;
  }

  stdout.write('Ingrese el nombre del estudiante: ');
  String nombre = stdin.readLineSync()!;
  stdout.write('Ingrese el apellido del estudiante: ');
  String apellido = stdin.readLineSync()!;
  stdout.write('Ingrese la fecha de nacimiento (AAAA-MM-DD): ');
  String fechaNac = stdin.readLineSync()!;
  // ...

  Estudiante nuevoEstudiante = Estudiante(
      cedula, nombre, apellido, fechaNac, 'Sin dirección', 'Sin teléfono');
  estudiantes.add(nuevoEstudiante);

  print('Estudiante registrado exitosamente.');
}

void verModificarEstudiante(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados.');
    return;
  }

  stdout.write('\nIngrese la cédula del estudiante que desea buscar: ');
  String cedula = stdin.readLineSync()!;
  Estudiante? estudianteEncontrado;

  for (var estudiante in estudiantes) {
    if (estudiante.cedula == cedula) {
      estudianteEncontrado = estudiante;
      break;
    }
  }

  if (estudianteEncontrado == null) {
    print('Estudiante no encontrado.');
    return;
  }

  estudianteEncontrado.mostrarUsuario();

  print('\n¿Desea modificar la dirección del estudiante? (s/n)');
  String opcionDireccion = stdin.readLineSync()!;
  if (opcionDireccion.toLowerCase() == 's') {
    stdout.write('Ingrese la nueva dirección: ');
    String nuevaDireccion = stdin.readLineSync()!;
    estudianteEncontrado.cambiarDireccion(nuevaDireccion);
    print('Dirección modificada exitosamente.');
  }

  // Aquí podrías añadir más opciones para modificar otros datos del estudiante, como las notas.
}
