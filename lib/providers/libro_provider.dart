import 'package:flutter/foundation.dart';
import 'package:libreria_examen/models/libro.dart';
import 'package:libreria_examen/services/api_service.dart';

class LibrosProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Libro> _libros = [];

  List<Libro> get libros => _libros;

  Future<void> cargarLibros() async {
    try {
      final List<Libro> librosCargados = await obtenerLibros();
      _libros = librosCargados;
      notifyListeners();
    } catch (error) {
      print('Error al cargar los libros: $error');
      // Maneja el error según sea necesario.
    }
  }

  Future<List<Libro>> obtenerLibros() async {
    final List<Map<String, dynamic>> librosData = await _apiService.obtenerLibros();
    return librosData
        .map((data) => Libro(
              titulo: data['titulo'],
              autor: data['autor'],
              genero: data['genero'],
              fechaPublicacion: data['fechaPublicacion'],
            ))
        .toList();
  }
}
