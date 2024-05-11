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

  // Validar formato de fecha de nacimiento
  if (!validarFormatoFecha(fechaNac)) {
    print(
        'El formato de fecha de nacimiento es incorrecto. Debe ser AAAA-MM-DD. Intente de nuevo.');
    return;
  }

  stdout.write(
      'Ingrese la dirección del estudiante (Formato: Calle, Ciudad, País): ');
  String direccion = stdin.readLineSync()!;

  // Validar formato de dirección
  if (!validarFormatoDireccion(direccion)) {
    print(
        'El formato de dirección es incorrecto. Debe ser Calle, Ciudad, País. Intente de nuevo.');
    return;
  }

  stdout.write('Ingrese el teléfono del estudiante: ');
  String telefono = stdin.readLineSync()!;

  Estudiante nuevoEstudiante =
      Estudiante(cedula, nombre, apellido, fechaNac, direccion, telefono);

  // Ingresar notas
  for (int i = 0; i < 5; i++) {
    stdout.write('Ingrese la nota ${i + 1}: ');
    double nota = double.tryParse(stdin.readLineSync()) ?? -1;
    // Validar rango de notas
    if (nota < 0 || nota > 5) {
      print('La nota debe estar entre 0 y 5. Intente de nuevo.');
      return;
    }
    nuevoEstudiante.notas.add(nota);
  }

  // Calcular promedio
  double promedio = nuevoEstudiante.notas.reduce((a, b) => a + b) /
      nuevoEstudiante.notas.length;
  nuevoEstudiante.promedio = promedio;

  // Agregar estudiante a la lista
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

  print('\n¿Desea modificar alguna nota? (s/n)');
  String opcionModificarNota = stdin.readLineSync()!;
  if (opcionModificarNota.toLowerCase() == 's') {
    // Modificar nota
    for (int i = 0; i < estudianteEncontrado.notas.length; i++) {
      stdout.write('Ingrese la nueva nota ${i + 1}: ');
      double nuevaNota = double.tryParse(stdin.readLineSync()) ?? -1;
      // Validar rango de notas
      if (nuevaNota < 0 || nuevaNota > 5) {
        print('La nota debe estar entre 0 y 5. Intente de nuevo.');
        return;
      }
      estudianteEncontrado.notas[i] = nuevaNota;
    }
    // Recalcular promedio
    double nuevoPromedio = estudianteEncontrado.notas.reduce((a, b) => a + b) /
        estudianteEncontrado.notas.length;
    estudianteEncontrado.promedio = nuevoPromedio;
    print('Notas modificadas exitosamente. Promedio recalculado.');
  }

  // Aquí podrías añadir más opciones para modificar otros datos del estudiante, como la dirección.
}

bool validarCedula(String cedula) {
  return cedula.isNotEmpty && cedula.contains(RegExp(r'^[0-9]+$'));
}

bool validarFormatoFecha(String fecha) {
  return RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(fecha);
}

bool validarFormatoDireccion(String direccion) {
  return RegExp(r'^[a-zA-Z0-9\s\-,]+,[a-zA-Z\s\-,]+,[a-zA-Z\s\-,]+$')
      .hasMatch(direccion);
}
