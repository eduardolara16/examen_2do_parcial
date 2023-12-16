import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> obtenerLibros() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('No hay conexión a Internet.');
    }

    try {
      final response =
          await _dio.get('https://stephen-king-api.onrender.com/api/books');
      if (response.statusCode == 200) {
        if (response.data is List) {
          return List<Map<String, dynamic>>.from(response.data);
        } else {
          print(
              'Error: La respuesta no es una lista. Response data: ${response.data}');
          throw Exception('Error: La respuesta no es del tipo esperado.');
        }
      } else {
        print(
            'Error al obtener los libros: ${response.statusCode}. Response data: ${response.data}');
        throw Exception('Error al obtener los libros: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error al obtener los libros: $error');
      throw Exception('Error al obtener los libros: $error');
    }
  }
}
