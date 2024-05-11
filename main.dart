import 'dart:io';
import 'estudiante.dart';

void main() {
  List<Estudiante> estudiantes = [];

  while (true) {
    print('\nMenú:');
    print('1. Registrarse estudiante');
    print('2. Ver información de estudiante');
    print('3. Modificar dirección de estudiante');
    print('4. Salir');
    print('Seleccione una opción:');

    var opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarEstudiante(estudiantes);
        break;
      case 2:
        verInformacionEstudiante(estudiantes);
        break;
      case 3:
        modificarDireccion(estudiantes);
        break;
      case 4:
        print('Saliendo del programa...');
        return;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }
}

void registrarEstudiante(List<Estudiante> estudiantes) {
  print('\nIngrese la cedula del estudiante:');
  var cedula = stdin.readLineSync()!;

  print('Ingrese el nombre del estudiante:');
  var nombre = stdin.readLineSync()!;

  print('Ingrese el apellido del estudiante:');
  var apellido = stdin.readLineSync()!;

  print('Ingrese la fecha de nacimiento (AAAA-MM-DD):');
  var fechaNac = stdin.readLineSync()!;

  print('Ingrese la dirección del estudiante:');
  var direccion = stdin.readLineSync()!;

  print('Ingrese el teléfono del estudiante:');
  var telefono = stdin.readLineSync()!;

  var nuevoEstudiante =
      Estudiante(cedula, nombre, apellido, fechaNac, direccion, telefono);
  nuevoEstudiante.notas = pedirNotas();

  nuevoEstudiante.calcularPromedio();
  estudiantes.add(nuevoEstudiante);

  print('Estudiante registrado correctamente.');
}

List<double> pedirNotas() {
  List<double> notas = [];
  for (var i = 0; i < 5; i++) {
    print('Ingrese la nota ${i + 1}:');
    var nota = double.parse(stdin.readLineSync()!);
    if (nota < 0 || nota > 5) {
      print('La nota debe estar entre 0 y 5. Inténtelo de nuevo.');
      i--;
      continue;
    }
    notas.add(nota);
  }
  return notas;
}

void verInformacionEstudiante(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados.');
    return;
  }

  print('\nLista de estudiantes:');
  for (var i = 0; i < estudiantes.length; i++) {
    print('$i. ${estudiantes[i].nombre} ${estudiantes[i].apellido}');
  }

  print('Seleccione el número de estudiante para ver su información:');
  var index = int.parse(stdin.readLineSync()!);
  if (index < 0 || index >= estudiantes.length) {
    print('Número de estudiante no válido.');
    return;
  }

  estudiantes[index].mostrarUsuario();
}

void modificarDireccion(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados.');
    return;
  }

  print('\nLista de estudiantes:');
  for (var i = 0; i < estudiantes.length; i++) {
    print('$i. ${estudiantes[i].nombre} ${estudiantes[i].apellido}');
  }

  print('Seleccione el número de estudiante para modificar su dirección:');
  var index = int.parse(stdin.readLineSync()!);
  if (index < 0 || index >= estudiantes.length) {
    print('Número de estudiante no válido.');
    return;
  }

  print('Ingrese la nueva dirección:');
  var nuevaDireccion = stdin.readLineSync()!;
  estudiantes[index].cambiarDireccion(nuevaDireccion);
  print('Dirección modificada correctamente.');
}
