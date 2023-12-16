import 'package:flutter/material.dart';
import 'package:libreria_examen/widgets/item.dart';

import 'package:libreria_examen/providers/libro_provider.dart';
import 'package:provider/provider.dart';

class ListaLibrosScreen extends StatefulWidget {
  @override
  _ListaLibrosScreenState createState() => _ListaLibrosScreenState();
}

class _ListaLibrosScreenState extends State<ListaLibrosScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<LibrosProvider>(context, listen: false).cargarLibros();
  }

  @override
  Widget build(BuildContext context) {
    final libros = Provider.of<LibrosProvider>(context).libros;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Libros'),
      ),
      body: libros.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: libros.length,
              itemBuilder: (context, index) {
                return LibroItem(libro: libros[index]);
              },
            ),
    );
  }
}
