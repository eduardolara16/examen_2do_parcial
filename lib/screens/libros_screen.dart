import 'package:flutter/material.dart';
import 'package:libreria_examen/services/api_service.dart';

class ListaLibrosScreen extends StatefulWidget {
  @override
  _ListaLibrosScreenState createState() => _ListaLibrosScreenState();
}

class _ListaLibrosScreenState extends State<ListaLibrosScreen> {
  ApiService apiService = ApiService();
  List<Map<String, dynamic>> libros = [];

  @override
  void initState() {
    super.initState();
    cargarLibros();
  }

  Future<void> cargarLibros() async {
    try {
      List<Map<String, dynamic>> librosCargados =
          await apiService.obtenerLibros();
      setState(() {
        libros = librosCargados;
      });
    } catch (error) {
      print('Error al cargar los libros: $error');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Libros'),
      ),
      body: libros.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: libros.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> libro = libros[index];
              
                return ListTile(
                  title: Text(libro['titulo']),
                  subtitle: Text(libro['autor']),
                );
              },
            ),
    );
  }
}
