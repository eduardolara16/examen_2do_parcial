import 'package:flutter/material.dart';
import 'package:libreria_examen/screens/libros_screen.dart';
import 'package:provider/provider.dart';
import 'package:libreria_examen/providers/libro_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LibrosProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación de Libros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListaLibrosScreen(),
    );
  }
}
